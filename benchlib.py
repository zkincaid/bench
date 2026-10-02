import bz2
import glob
import json
import os
import re
import subprocess
import tempfile
from datetime import datetime, timezone
import xml.etree.ElementTree as ET


SVCOMP_DIRECTORY = os.path.join("tasks", "sv-benchmarks")
SVCOMP_LOCK = "svcomp.lock"
RUNS_DIRECTORY = os.path.join("results", "runs")

DUET_CONFIGS = {
    "CRA": ("DuetSafety", "CRA"),
    "CRAM": ("DuetSafety", "CRAM"),
    "LIRR": ("DuetSafety", "LIRR"),
    "CRAM-NoSplit": ("DuetSafety", "CRAM-NoSplit"),
    "ComPACT": ("DuetTermination", "ComPACT"),
    "Combined": ("DuetTermination", "Combined"),
    "BLACT": ("DuetTermination", "BLACT"),
    "ComPACT-exp-only-no-phase":
        ("DuetTermination", "ComPACT-exp-only-no-phase"),
    "ComPACT-exp-only-with-phase":
        ("DuetTermination", "ComPACT-exp-only-with-phase"),
    "ComPACT-llrf-only-no-phase":
        ("DuetTermination", "ComPACT-llrf-only-no-phase"),
    "ComPACT-llrf-only-with-phase":
        ("DuetTermination", "ComPACT-llrf-only-with-phase"),
}


def comma_list(value):
    values = [item for item in value.split(",") if item]
    if not values:
        raise ValueError("expected a non-empty comma-separated list")
    return values


def load_svcomp_lock(required=False):
    try:
        with open(SVCOMP_LOCK) as lock_file:
            return json.load(lock_file)
    except (OSError, ValueError) as error:
        if required:
            raise RuntimeError(
                "No SV-COMP release is configured; run "
                "'./task.py update-svcomp --release RELEASE' first") from error
        return None


def svcomp_set_file(suite):
    if not re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9_.+-]*", suite):
        raise ValueError("Invalid SV-COMP set name %r" % suite)
    return "c/%s.set" % suite


def svcomp_set_patterns(release, suite):
    set_file = svcomp_set_file(suite)
    try:
        contents = subprocess.run(
            ["git", "-C", SVCOMP_DIRECTORY, "show",
             "%s:%s" % (release, set_file)], check=True,
            capture_output=True, text=True).stdout
    except subprocess.CalledProcessError as error:
        raise ValueError(
            "SV-COMP release %s has no set named %s (%s)"
            % (release, suite, set_file)) from error
    base = os.path.dirname(set_file)
    return [os.path.join(base, line.strip())
            for line in contents.splitlines()
            if line.strip() and not line.lstrip().startswith("#")]


def is_svcomp_suite(suite, lock=None):
    lock = load_svcomp_lock() if lock is None else lock
    if lock is None:
        return False
    try:
        svcomp_set_patterns(lock["release"], suite)
        return True
    except ValueError:
        return False


def check_svcomp(suites):
    lock = load_svcomp_lock()
    if lock is None:
        return
    required = [suite for suite in suites if is_svcomp_suite(suite, lock)]
    missing_suites = set(required).difference(lock.get("suites", []))
    if missing_suites:
        raise RuntimeError(
            "SV-COMP data is not installed for %s; run "
            "'./task.py fetch-svcomp --suites %s'"
            % (", ".join(sorted(missing_suites)),
               ",".join(sorted(missing_suites))))
    commit = subprocess.run(
        ["git", "-C", SVCOMP_DIRECTORY, "rev-parse", "HEAD"], check=True,
        capture_output=True, text=True).stdout.strip()
    if commit != lock["commit"]:
        raise RuntimeError("SV-COMP checkout does not match svcomp.lock")
    missing = [path for path in lock.get("directories", [])
               if not os.path.isdir(os.path.join(SVCOMP_DIRECTORY, path))]
    if missing:
        raise RuntimeError("SV-COMP sparse checkout is incomplete")


def validate_run_name(name):
    if not re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9_.+-]*", name):
        raise ValueError("Invalid run name %r" % name)


def run_manifest_path(name):
    validate_run_name(name)
    return os.path.join(RUNS_DIRECTORY, name + ".json")


def load_run_manifest(name, required=False):
    path = run_manifest_path(name)
    try:
        with open(path) as manifest_file:
            manifest = json.load(manifest_file)
    except FileNotFoundError:
        if required:
            raise RuntimeError("No named run %r" % name)
        return None
    if manifest.get("format_version") != 1 or manifest.get("name") != name:
        raise RuntimeError("Invalid named-run manifest %s" % path)
    return manifest


def result_file_is_complete(filename):
    try:
        opener = bz2.open if filename.endswith(".bz2") else open
        with opener(filename, "rb") as result_file:
            return ET.parse(result_file).getroot().get("error") is None
    except (OSError, EOFError, ET.ParseError):
        return False


def named_result(name, suite):
    manifest = load_run_manifest(name, required=True)
    entry = manifest.get("suites", {}).get(suite)
    filename = entry and entry.get("result")
    if filename is None or not result_file_is_complete(filename):
        raise RuntimeError(
            "Named run %r has no complete result for suite %s" % (name, suite))
    return filename


def write_run_manifest(name, tool, suite, result_file, timeout):
    manifest = load_run_manifest(name)
    now = datetime.now(timezone.utc).isoformat()
    if manifest is None:
        manifest = {"format_version": 1, "name": name, "tool": tool,
                    "created_at": now, "suites": {}}
    elif manifest.get("tool") != tool:
        raise RuntimeError("Named run %r belongs to %s, not %s"
                           % (name, manifest.get("tool"), tool))
    entry = {"result": result_file, "created_at": now, "timeout": timeout}
    lock = load_svcomp_lock()
    if is_svcomp_suite(suite, lock):
        entry["svcomp_commit"] = lock.get("commit")
        entry["svcomp_release"] = lock.get("release")
    manifest["suites"][suite] = entry
    manifest["updated_at"] = now
    os.makedirs(RUNS_DIRECTORY, exist_ok=True)
    fd, temporary = tempfile.mkstemp(
        prefix=name + ".", suffix=".tmp", dir=RUNS_DIRECTORY, text=True)
    try:
        with os.fdopen(fd, "w") as output:
            json.dump(manifest, output, indent=2, sort_keys=True)
            output.write("\n")
        os.replace(temporary, run_manifest_path(name))
    finally:
        if os.path.exists(temporary):
            os.remove(temporary)


def result_files(tool, suite):
    benchmark, run_definition = DUET_CONFIGS.get(tool, (tool, None))
    patterns = (["results/%s.*.%s.%s.xml.bz2"
                 % (benchmark, run_definition, suite)]
                if run_definition else [])
    patterns.append("results/%s.*.%s.xml.bz2" % (tool, suite))
    filenames = {filename for pattern in patterns for filename in glob.glob(pattern)}
    return sorted(filename for filename in filenames
                  if result_file_is_complete(filename))


def read_result(filename):
    opener = bz2.open if filename.endswith(".bz2") else open
    with opener(filename, "rb") as result_file:
        root = ET.parse(result_file).getroot()
    tasks = {}
    for run in root.findall("run"):
        columns = {column.get("title"): column.get("value", "")
                   for column in run.findall("column")}
        def seconds(title):
            value = columns.get(title, "")
            if value.endswith("s"):
                value = value[:-1]
            try:
                return float(value) if value else None
            except ValueError:
                return None
        tasks[run.get("name")] = {
            "status": columns.get("status", "unknown"),
            "category": columns.get("category", "unknown"),
            "cputime": seconds("cputime"),
            "walltime": seconds("walltime"),
            "expected_verdict": run.get("expectedVerdict", "unknown"),
        }
    return tasks
