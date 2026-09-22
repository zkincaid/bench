#!/usr/bin/env python3

import argparse
import os
import subprocess
import sys
from collections import defaultdict

from benchlib import (DUET_CONFIGS, check_svcomp, comma_list,
                      load_run_manifest, named_result, result_files,
                      validate_run_name, write_run_manifest)


def parser():
    result = argparse.ArgumentParser(
        description="Run tool configurations and record named results")
    result.add_argument("--tools", required=True, type=comma_list,
                        help="comma-separated tool configurations")
    result.add_argument("--suites", required=True, type=comma_list,
                        help="comma-separated task suites")
    result.add_argument("--name", help="name for a single-tool run")
    result.add_argument("--timeout", type=int, default=600,
                        help="per-task time limit in seconds (default: 600)")
    result.add_argument("--no-cache", action="store_true",
                        help="rerun suites already present in the named run")
    result.add_argument("--container", action="store_true",
                        help="enable BenchExec container mode")
    return result


def names_for_tools(tools, explicit_name):
    if explicit_name is not None:
        if len(tools) != 1:
            raise ValueError("--name requires exactly one tool")
        validate_run_name(explicit_name)
        names = {tools[0]: explicit_name}
    else:
        names = {tool: tool for tool in tools}
    for tool, name in names.items():
        manifest = load_run_manifest(name)
        if manifest is not None and manifest.get("tool") != tool:
            raise RuntimeError("Named run %r belongs to %s, not %s"
                               % (name, manifest.get("tool"), tool))
    return names


def cached(name, suite):
    try:
        named_result(name, suite)
        return True
    except RuntimeError:
        return False


def latest_result(tool, suite):
    files = result_files(tool, suite)
    if not files:
        raise RuntimeError("No result for %s on suite %s" % (tool, suite))
    return files[-1]


def execute(args):
    check_svcomp(args.suites)
    names = names_for_tools(args.tools, args.name)
    for suite in args.suites:
        pending = defaultdict(list)
        for tool in args.tools:
            if not args.no_cache and cached(names[tool], suite):
                print("Result of %s on %s is cached in run %s"
                      % (tool, suite, names[tool]))
                continue
            benchmark, run_definition = DUET_CONFIGS.get(tool, (tool, None))
            pending[benchmark].append((tool, run_definition))

        for benchmark, configurations in pending.items():
            print("Running %s on suite %s"
                  % (", ".join(tool for tool, _ in configurations), suite))
            command = ["benchexec", "-W", str(args.timeout), "-t", suite]
            run_definitions = [definition for _, definition in configurations
                               if definition is not None]
            for definition in run_definitions:
                command += ["-r", definition]
            if run_definitions:
                command.append("--results-per-taskset")
            if args.container:
                command += ["--read-only-dir", "/", "--overlay-dir", "/home"]
            else:
                command.append("--no-container")
            command.append("benchmark-defs/%s.xml" % benchmark)
            environment = os.environ.copy()
            environment["PYTHONPATH"] = os.getcwd()
            subprocess.run(command, env=environment, check=True)
            for tool, _ in configurations:
                filename = latest_result(tool, suite)
                write_run_manifest(
                    names[tool], tool, suite, filename, args.timeout)
                print("Recorded %s/%s in named run %s"
                      % (tool, suite, names[tool]))


def main():
    if sys.argv[1:] == ["help"]:
        parser().print_help()
        return
    execute(parser().parse_args())


if __name__ == "__main__":
    main()
