#!/usr/bin/env python3

import argparse
import glob
import json
import os
import re
import subprocess
import sys

import yaml

from benchlib import (SVCOMP_DIRECTORY, SVCOMP_LOCK, comma_list,
                      load_svcomp_lock, svcomp_set_patterns)

SVCOMP_REPOSITORY = (
    "https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks.git")
DEFAULT_RELEASE = "svcomp26"
SUPPORTED_PROPERTIES = {"termination.prp", "unreach-call.prp"}


def argument_parser():
    parser = argparse.ArgumentParser(
        description="Manage benchmark tasks and create task subsets")
    commands = parser.add_subparsers(dest="command", required=True)
    update = commands.add_parser(
        "update-svcomp", help="select or update the pinned SV-COMP release")
    update.add_argument("--release", default=DEFAULT_RELEASE)
    fetch = commands.add_parser(
        "fetch-svcomp", help="fetch upstream SV-COMP sets")
    fetch.add_argument("--suites", required=True, type=comma_list)
    select = commands.add_parser(
        "select", help="create a filtered local .set file",
        epilog=("Boolean filters use --NAME=True or --NAME=False. Example: "
                "task.py select --suites Loops --output tasks/IntLoops.set "
                "--verdict=True --integer=True"))
    select.add_argument("--suites", required=True, type=comma_list)
    select.add_argument("--output", required=True)
    return parser


def parse_arguments():
    parser = argument_parser()
    args, filters = parser.parse_known_args()
    if args.command != "select" and filters:
        parser.error("unrecognized arguments: %s" % " ".join(filters))
    pattern = {}
    for option in filters:
        match = re.fullmatch(r"--([A-Za-z0-9_-]+)=(True|False)", option)
        if match is None:
            parser.error("invalid filter %r (expected --NAME=True or False)"
                         % option)
        pattern[match.group(1)] = match.group(2) == "True"
    return args, pattern


def pattern_directory(pattern):
    parts = pattern.split("/")
    literal = []
    for part in parts:
        if glob.has_magic(part):
            break
        literal.append(part)
    if len(literal) == len(parts):
        literal.pop()
    if not literal or pattern.startswith("/") or ".." in parts:
        raise ValueError("Unsafe SV-COMP pattern %r" % pattern)
    return "/".join(literal)


def sync_svcomp(release, suites):
    if not re.fullmatch(r"svcomp[0-9]+", release):
        raise ValueError("Invalid SV-COMP release %r" % release)
    os.makedirs(os.path.dirname(SVCOMP_DIRECTORY), exist_ok=True)
    if not os.path.isdir(os.path.join(SVCOMP_DIRECTORY, ".git")):
        subprocess.run([
            "git", "clone", "--filter=blob:none", "--no-checkout",
            SVCOMP_REPOSITORY, SVCOMP_DIRECTORY], check=True)
    subprocess.run([
        "git", "-C", SVCOMP_DIRECTORY, "fetch", "--filter=blob:none",
        "origin", "tag", release], check=True)
    directories = sorted({pattern_directory(pattern)
                          for suite in suites
                          for pattern in svcomp_set_patterns(release, suite)})
    if suites:
        directories.append("c/properties")
        directories = sorted(set(directories))
    subprocess.run([
        "git", "-C", SVCOMP_DIRECTORY, "sparse-checkout", "init", "--cone"],
        check=True)
    subprocess.run([
        "git", "-C", SVCOMP_DIRECTORY, "checkout", "--detach", release],
        check=True)
    subprocess.run([
        "git", "-C", SVCOMP_DIRECTORY, "sparse-checkout", "set"] + directories,
        check=True)
    commit = subprocess.run([
        "git", "-C", SVCOMP_DIRECTORY, "rev-parse", "HEAD"], check=True,
        capture_output=True, text=True).stdout.strip()
    lock = {"repository": SVCOMP_REPOSITORY, "release": release,
            "commit": commit, "suites": sorted(suites),
            "directories": directories}
    with open(SVCOMP_LOCK, "w") as output:
        json.dump(lock, output, indent=2)
        output.write("\n")
    print("Checked out %s (%s) for suites %s"
          % (release, commit[:12], ", ".join(sorted(suites)) or "(none)"))


def update_svcomp(release):
    lock = load_svcomp_lock()
    suites = lock.get("suites", []) if lock and lock.get("release") == release else []
    sync_svcomp(release, suites)


def fetch_svcomp(suites):
    lock = load_svcomp_lock(required=True)
    sync_svcomp(lock["release"], sorted(set(lock.get("suites", [])).union(suites)))


def suite_tasks(suite):
    if not re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9_.+-]*", suite):
        raise ValueError("invalid SV-COMP set name %r" % suite)
    set_file = os.path.join(SVCOMP_DIRECTORY, "c", suite + ".set")
    if not os.path.isfile(set_file):
        raise RuntimeError(
            "%s is not available; run "
            "'./task.py fetch-svcomp --suites %s' first"
            % (set_file, suite))
    tasks = []
    with open(set_file) as input_file:
        for line in input_file:
            task_pattern = line.strip()
            if not task_pattern or task_pattern.startswith("#"):
                continue
            tasks.extend(glob.glob(os.path.join(
                os.path.dirname(set_file), task_pattern), recursive=True))
    return tasks


def task_metadata(task):
    with open(task) as task_file:
        task_info = yaml.safe_load(task_file)
    input_files = task_info["input_files"]
    if isinstance(input_files, list):
        if len(input_files) != 1:
            raise RuntimeError("cannot categorize multi-input task %s" % task)
        input_files = input_files[0]
    relevant = [prop for prop in task_info.get("properties", [])
                if os.path.basename(prop.get("property_file", ""))
                in SUPPORTED_PROPERTIES]
    return input_files, relevant


def categorize(task, input_file, environment):
    input_file = os.path.join(os.path.dirname(task), input_file)
    result = subprocess.run(
        ["duet.exe", "-categorize", input_file], check=True,
        stdout=subprocess.PIPE, stderr=subprocess.PIPE,
        text=True, env=environment)
    return yaml.safe_load(result.stdout)


def selected(task, pattern, environment):
    input_file, properties = task_metadata(task)
    if not properties:
        return False

    verdict = pattern.get("verdict")
    if verdict is not None and not any(
            prop.get("expected_verdict") is verdict for prop in properties):
        return False

    category_pattern = {key: value for key, value in pattern.items()
                        if key != "verdict"}
    if category_pattern:
        categories = categorize(task, input_file, environment)
        if not all(categories.get(key) == value
                   for key, value in category_pattern.items()):
            return False
    return True


def main():
    if sys.argv[1:] == ["help"]:
        argument_parser().print_help()
        return
    args, pattern = parse_arguments()
    if args.command == "update-svcomp":
        update_svcomp(args.release)
        return
    if args.command == "fetch-svcomp":
        fetch_svcomp(args.suites)
        return
    suites, output = args.suites, args.output
    environment = os.environ.copy()
    environment["PATH"] += os.pathsep + os.path.abspath("..")

    tasks = sorted(set(
        os.path.normpath(task)
        for suite in suites
        for task in suite_tasks(suite)))
    selected_tasks = [task for task in tasks
                      if selected(task, pattern, environment)]

    output = os.path.abspath(output)
    output_directory = os.path.dirname(output)
    os.makedirs(output_directory, exist_ok=True)
    temporary = output + ".tmp"
    try:
        with open(temporary, "w") as output_file:
            for task in selected_tasks:
                print(os.path.relpath(os.path.abspath(task), output_directory),
                      file=output_file)
        os.replace(temporary, output)
    finally:
        if os.path.exists(temporary):
            os.remove(temporary)
    print("Selected %d of %d tasks into %s" %
          (len(selected_tasks), len(tasks), output), file=sys.stderr)


if __name__ == "__main__":
    main()
