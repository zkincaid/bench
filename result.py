#!/usr/bin/env python3

import argparse
import glob
import json
import math
import os
import statistics
import sys
import tempfile
import types
from collections import defaultdict
from string import Template

from benchlib import (RUNS_DIRECTORY, comma_list, load_run_manifest,
                      named_result, read_result)

tools = []
suites = []
analysis_runs = {}

table_begin = """<?xml version="1.0" ?>
<!DOCTYPE table PUBLIC "+//IDN sosy-lab.org//DTD BenchExec table 1.10//EN" "https://www.sosy-lab.org/benchexec/table-1.10.dtd">
<table>
"""
table_end = "</table>"

def list_named_runs():
    if not os.path.isdir(RUNS_DIRECTORY):
        return
    for path in sorted(glob.glob(os.path.join(RUNS_DIRECTORY, "*.json"))):
        name = os.path.basename(path)[:-5]
        manifest = load_run_manifest(name, required=True)
        print("%s\t%s\t%s" %
              (name, manifest["tool"],
               ",".join(sorted(manifest.get("suites", {})))))


def show_named_run(name):
    manifest = load_run_manifest(name, required=True)
    print(json.dumps(manifest, indent=2, sort_keys=True))



def analysis_result(tool, suite, which_run=1):
    if which_run != 1:
        raise ValueError("Named runs identify exactly one result per suite")
    return named_result(analysis_runs[tool], suite)









def result_class(result):
    if result["status"] == "TIMEOUT":
        return "timeout"
    if result["category"] == "correct":
        return "correct"
    if result["category"] == "error":
        return "error"
    return "incorrect"


def load_comparison_run(name, comparison_suites, reference_manifest=None):
    manifest = load_run_manifest(name, required=True)
    combined = {}
    for suite in comparison_suites:
        entry = manifest.get("suites", {}).get(suite)
        if entry is None:
            raise RuntimeError("Suite %s is not present in run %s"
                               % (suite, name))
        if reference_manifest is not None:
            reference_entry = reference_manifest["suites"][suite]
            if entry.get("svcomp_commit") != reference_entry.get("svcomp_commit"):
                raise RuntimeError(
                    "Suite %s uses different SV-COMP commits in the runs"
                    % suite)
        for task, result in read_result(named_result(name, suite)).items():
            combined[(suite, task)] = result
    return manifest, combined


def compare_named_runs(reference_name, candidate_names, selected_suites):
    reference = load_run_manifest(reference_name, required=True)
    if selected_suites:
        comparison_suites = selected_suites
    else:
        suite_sets = [set(reference.get("suites", {}))]
        suite_sets.extend(set(load_run_manifest(name, required=True)
                              .get("suites", {}))
                          for name in candidate_names)
        comparison_suites = sorted(set.intersection(*suite_sets))
    if not comparison_suites:
        raise RuntimeError("The named runs have no suites in common")
    _, reference_results = load_comparison_run(
        reference_name, comparison_suites)
    classes = ("correct", "incorrect", "timeout", "error")
    reference_counts = {kind: 0 for kind in classes}
    for result in reference_results.values():
        reference_counts[result_class(result)] += 1

    rows = []
    for candidate_name in candidate_names:
        _, candidate_results = load_comparison_run(
            candidate_name, comparison_suites, reference)
        if set(candidate_results) != set(reference_results):
            raise RuntimeError(
                "%s and %s contain different task sets"
                % (reference_name, candidate_name))
        counts = {kind: 0 for kind in classes}
        speedups = []
        for task, candidate_result in candidate_results.items():
            counts[result_class(candidate_result)] += 1
            reference_result = reference_results[task]
            if (result_class(reference_result) == "correct"
                    and result_class(candidate_result) == "correct"
                    and reference_result["walltime"]
                    and candidate_result["walltime"]):
                speedups.append(reference_result["walltime"]
                                / candidate_result["walltime"])
        geomean = (math.exp(statistics.mean(map(math.log, speedups)))
                   if speedups else None)
        median = statistics.median(speedups) if speedups else None
        rows.append((candidate_name, counts,
                     {kind: counts[kind] - reference_counts[kind]
                      for kind in classes},
                     geomean, median))
    return comparison_suites, reference_counts, rows


def summarize_result(tool, suite, average_over_runs=1):
    multirun_results = []
    run_data = []
    for run_index in range(average_over_runs):
        data = read_result(
            analysis_result(tool, suite, which_run=run_index + 1))
        run_data.append(data)
        result = types.SimpleNamespace()
        result.total = len(data)
        result.time = 0
        result.correct = 0
        result.timeout = 0
        result.memout = 0
        result.unknown = 0
        result.time_by_verdict = defaultdict(float)
        result.task_times_by_verdict = defaultdict(list)
        result.maxvar_by_verdict = defaultdict(float)
        result.num_by_verdict = defaultdict(int)
        result.correct_by_verdict = defaultdict(int)
        result.timeout_by_verdict = defaultdict(int)
        result.memout_by_verdict = defaultdict(int)
        for entry in data.values():
            verdict = entry["expected_verdict"] or "unknown"
            task_time = entry["walltime"] or 0.0
            result.time += task_time
            result.num_by_verdict[verdict] += 1
            result.time_by_verdict[verdict] += task_time
            result.task_times_by_verdict[verdict].append(task_time)
            if entry["status"] == "TIMEOUT":
                result.timeout += 1
                result.timeout_by_verdict[verdict] += 1
            elif entry["status"] == "KILLED BY SIGNAL 9":
                result.memout += 1
                result.memout_by_verdict[verdict] += 1
            elif entry["category"] == "correct":
                result.correct += 1
                result.correct_by_verdict[verdict] += 1
            elif entry["category"] == "unknown":
                result.unknown += 1
        multirun_results.append(result)
    ar = types.SimpleNamespace()
    r = multirun_results[0]
    ar.total = r.total

    multi_run_times = []
    for run in range(average_over_runs):
        multi_run_times.append(multirun_results[run].time)
    mean_run_time = statistics.mean(multi_run_times)
    ar.time = mean_run_time

    task_names = set().union(*(data.keys() for data in run_data))
    task_variances = {}
    for task in task_names:
        times = [data[task]["walltime"] for data in run_data
                 if task in data and data[task]["walltime"] is not None]
        task_variances[task] = (statistics.variance(times)
                                if len(times) > 1 else 0.0)
    ar.maxvar = max(task_variances.values(), default=0.0)

    ar.correct = r.correct
    ar.timeout = r.timeout
    ar.memout = r.memout
    ar.unknown = r.unknown

    ar.time_by_verdict = defaultdict(float)
    ar.maxvar_by_verdict = defaultdict(float)
    for v in ['true', 'false', 'unknown']:
        multi_run_times = []
        for run in range(average_over_runs):
            multi_run_times.append(multirun_results[run].time_by_verdict[v])
        mean_run_time = statistics.mean(multi_run_times)
        ar.time_by_verdict[v] = mean_run_time

        ar.maxvar_by_verdict[v] = max(
            (variance for task, variance in task_variances.items()
             if any(data.get(task, {}).get("expected_verdict") == v
                    for data in run_data)), default=0.0)

    ar.num_by_verdict = r.num_by_verdict
    ar.correct_by_verdict = r.correct_by_verdict
    ar.timeout_by_verdict = r.timeout_by_verdict
    ar.memout_by_verdict = r.memout_by_verdict
    return ar


def summary_by_verdict(average_over_runs=1):
    res = {}

    num = {}
    total_correct = {}
    total_time = {}
    num_timeout = {}
    num_memout = {}
    max_variance = {}

    for tool in tools:
        total_correct[tool] = 0
        num_timeout[tool] = 0
        num_memout[tool] = 0
        total_time[tool] = 0
        max_variance[tool] = 0

    for s in suites:
        r = {}
        for t in tools:
            r[t] = summarize_result(t, s, average_over_runs=average_over_runs)
        res[s] = r

    for suite in suites:
        for verd in ['true', 'false', 'unknown']:
            row_name = suite + ' - ' + verd
            for tool in tools:
                r = res[suite][tool]
                num_suite = r.num_by_verdict[verd]
                total_correct[tool] += r.correct_by_verdict[verd]
                total_time[tool] += r.time_by_verdict[verd]
                max_variance[tool] = max(max_variance[tool], r.maxvar)
                num_timeout[tool] += r.timeout_by_verdict[verd]
                num_memout[tool] += r.memout_by_verdict[verd]
            num[row_name] = num_suite

    print("\\begin{tabular}{@{}lc|%s@{}}" %
          ("|".join(["c@{}c@{}r@{}r"] * (len(tools)))))
    print("\\toprule")
    print(" &", end='')
    for tool in tools[:-1]:
        print(" & \\multicolumn{4}{c|}{%s}" % tool, end='')
    print(" & \\multicolumn{4}{c}{%s}\\\\" % tools[-1])

    print(" & \\#tasks & %s\\\\\\midrule" % " & ".join(
        ["\\#P & \\#E & t & $\\sigma$ "] * len(tools)))

    for suite in suites:
        for verd in ['true', 'false', 'unknown']:
            suite_name = suite + ' - ' + verd
            print("%s & %d" % (suite_name, num[suite_name]), end='')
            for tool in tools:
                c = res[suite][tool]
                print(" & %d" % c.correct_by_verdict[verd], end='')
                print(
                    " & %d/%d" % (c.timeout_by_verdict[verd], c.memout_by_verdict[verd]), end='')
                print(" & %.1f" % c.time_by_verdict[verd], end='')
                print(" & %.2f" % c.maxvar_by_verdict[verd], end='')

            print("\\\\")
    print("\\midrule")

    print("Total & %d " % sum(num.values()), end='')
    for tool in tools:
        print(" & %d" % total_correct[tool], end='')
        print(" & %d/%d" % (num_timeout[tool], num_memout[tool]), end='')
        print(" & %.1f" % total_time[tool], end='')
        print(" & %.2f" % max_variance[tool], end='')
    print("\\\\")

    print("\\bottomrule")
    print("\\end{tabular}")


def summary(average_over_runs=1):
    matrix = {}

    best_time = {}
    best_correct = {}
    num = {}
    total_correct = {}
    total_time = {}
    max_variance = {}
    num_timeout = {}
    num_timeout_by_suite = {}

    for tool in tools:
        total_correct[tool] = 0
        total_time[tool] = 0
        max_variance[tool] = 0
        num_timeout[tool] = 0

    for suite in suites:
        row = {}
        best_time_suite = 999999999.0
        best_correct_suite = 0
        num_suite = 0
        num_timeout_by_suite[suite] = {}
        for tool in tools:
            r = summarize_result(
                tool, suite, average_over_runs=average_over_runs)

            best_correct_suite = max(best_correct_suite, r.correct)
            num_suite = r.total
            row[tool] = r
            total_correct[tool] += r.correct

            total_time[tool] += r.time
            best_time_suite = min(best_time_suite, r.time)
            max_variance[tool] = max(max_variance[tool], r.maxvar)
            num_timeout[tool] += r.timeout
            num_timeout_by_suite[suite][tool] = r.timeout

        best_time[suite] = best_time_suite
        best_correct[suite] = best_correct_suite
        num[suite] = num_suite
        matrix[suite] = row

    print("\\begin{tabular}{@{}lc|%s@{}}" %
          ("|".join(["c@{}r"] * (len(tools)))))
    print("\\toprule")
    print(" &", end='')
    for tool in tools[:-1]:
        print(" & \\multicolumn{2}{c|}{%s}" % tool, end='')
    print(" & \\multicolumn{2}{c}{%s}\\\\" % tools[-1])

    print(" & \\#tasks & %s\\\\\\midrule" %
          " & ".join(["\\#correct & time"] * len(tools)))

    for suite in suites:
        print("%s & %d" % (suite, num[suite]), end='')
        for tool in tools:
            if (matrix[suite][tool].correct == best_correct[suite]):
                print(" & \\textbf{%d}" % best_correct[suite], end='')
            else:
                print(" & %d" % matrix[suite][tool].correct, end='')

            if (matrix[suite][tool].time == best_time[suite]):
                print(" & \\textbf{%.1f}" % best_time[suite], end='')
            else:
                print(" & %.1f" % matrix[suite][tool].time, end='')
            print(" (%d)" % num_timeout_by_suite[suite][tool], end='')
        print("\\\\")
    print("\\midrule")

    best_total_time = min(total_time.values())
    best_total_correct = max(total_correct.values())

    print("Total & %d " % sum(num.values()), end='')
    for tool in tools:
        if (total_correct[tool] == best_total_correct):
            print(" & \\textbf{%d}" % best_total_correct, end='')
        else:
            print(" & %d" % total_correct[tool], end='')

        if (total_time[tool] == best_total_time):
            print(" & \\textbf{%.1f}, max $\\sigma$=%.2f" %
                  (best_total_time, max_variance[tool]), end='')
        else:
            print(" & %.1f, max $\\sigma$=%.2f" %
                  (total_time[tool], max_variance[tool]), end='')
    print("\\\\")

    print("Timeouts & ", end='')
    for tool in tools:
        print(" & \\multicolumn{2}{c}{%d}" % num_timeout[tool], end='')

    print("\\\\")

    print("\\bottomrule")
    print("\\end{tabular}")


def make_table():
    with tempfile.TemporaryDirectory() as tmp_dir:
        tmp_file = os.path.join(tmp_dir, "results.xml")
        tmp = open(tmp_file, "w")
        tmp.write(table_begin)
        for tool in tools:
            tmp.write("<union>\n")
            for suite in suites:
                tmp.write('<result filename="')
                tmp.write(os.path.join(
                    os.getcwd(), analysis_result(tool, suite)))
                tmp.write('" />\n')
            tmp.write("</union>\n")
        tmp.write(table_end)
        tmp.close()
        os.system("table-generator -x %s -o results" % tmp_file)


def cactus_data(results, out):
    times = [entry["walltime"] for entry in results
             if entry["category"] == "correct"
             and entry["walltime"] is not None]
    times = sorted(times)
    if not times:
        return 0
    prev = times[0]
    last = len(times)
    for instance in range(1, last):
        if prev != times[instance]:
            prev = times[instance]
            out.write("%d %f\n" % (instance, times[instance - 1]))
    out.write("%d %f\n" % (last, times[last - 1]))
    return last


def cactus_plot():

    legend = ""
    data = ""

    bench_size = 0
    for tool_name in tools:
        results = []
        for suite in suites:
            results.extend(read_result(
                analysis_result(tool_name, suite)).values())

        print("Writing data to %s.dat" % tool_name)
        with open("%s.dat" % tool_name, "w") as output:
            bench_size = max(bench_size, cactus_data(results, output))
        if legend == "":
            legend = tool_name
        else:
            legend += "," + tool_name
        data += ('    \\addplot table {%s.dat};\n' % tool_name)

    subst = dict(legend=legend,
                 data=data,
                 bench_size=bench_size)
    print(Template(open("cactus.template").read()).substitute(subst))


def scatter_plot():
    if (len(tools) != 2):
        print("For scatter plot, must supply exactly two tools to compare")
        exit(-1)

    result_pair = [{}, {}]
    for suite in suites:
        for index, tool in enumerate(tools):
            suite_results = read_result(analysis_result(tool, suite))
            for task, result in suite_results.items():
                key = (suite, task)
                if key in result_pair[index]:
                    raise RuntimeError("Duplicate task %s in suite %s" %
                                       (task, suite))
                result_pair[index][key] = result
    task_keys = set(result_pair[0])
    if task_keys != set(result_pair[1]):
        only_first = task_keys.difference(result_pair[1])
        only_second = set(result_pair[1]).difference(task_keys)
        raise RuntimeError(
            "Scatter inputs contain different tasks (%d only in %s, "
            "%d only in %s)" %
            (len(only_first), tools[0], len(only_second), tools[1]))

    min_time = 1
    max_time = 1
    filenames = {
        (True, True): "scatter_%s_%s_tt.dat" % tuple(tools),
        (True, False): "scatter_%s_%s_tf.dat" % tuple(tools),
        (False, True): "scatter_%s_%s_ft.dat" % tuple(tools),
        (False, False): "scatter_%s_%s_ff.dat" % tuple(tools),
    }
    outputs = {}
    try:
        for categories, filename in filenames.items():
            print("Writing data to %s" % filename)
            outputs[categories] = open(filename, "w")
        for key in sorted(task_keys):
            first = result_pair[0][key]
            second = result_pair[1][key]
            time1 = first["walltime"]
            time2 = second["walltime"]
            if time1 is None or time2 is None:
                continue
            categories = (first["category"] == "correct",
                          second["category"] == "correct")
            outputs[categories].write("%f %f\n" % (time1, time2))
            min_time = min(min_time, time1, time2)
            max_time = max(max_time, time1, time2)
    finally:
        for output in outputs.values():
            output.close()

    filename_tt = filenames[(True, True)]
    filename_tf = filenames[(True, False)]
    filename_ft = filenames[(False, True)]
    filename_ff = filenames[(False, False)]
    legendentry_tt = "%s %s both correct" % tuple(tools)
    legendentry_tf = "%s correct, %s not correct" % tuple(tools)
    legendentry_ft = "%s not correct, %s correct" % tuple(tools)
    legendentry_ff = "%s %s both not correct" % tuple(tools)

    subst = dict(min=min_time,
                 max=max_time,
                 x=tools[0],
                 y=tools[1],
                 datatt=filename_tt,
                 ttlegend=legendentry_tt,
                 datatf=filename_tf,
                 tflegend=legendentry_tf,
                 dataft=filename_ft,
                 ftlegend=legendentry_ft,
                 dataff=filename_ff,
                 fflegend=legendentry_ff,
                 )
    print(Template(open("scatter.template").read()).substitute(subst))


def parser():
    result = argparse.ArgumentParser(
        description="Inspect and compare named benchmark runs")
    commands = result.add_subparsers(dest="command", required=True)
    commands.add_parser("list", help="list named runs")
    show = commands.add_parser("show", help="display a run manifest")
    show.add_argument("name")
    compare = commands.add_parser(
        "compare", help="compare candidate runs with one reference")
    compare.add_argument("--reference", required=True)
    compare.add_argument("--runs", required=True, type=comma_list,
                         help="comma-separated candidate named runs")
    compare.add_argument("--suites", type=comma_list)
    for command, description in [
            ("summary", "print a LaTeX summary"),
            ("summary-by-verdict", "summarize by expected verdict"),
            ("scatter", "generate scatter-plot data and LaTeX"),
            ("cactus", "generate cactus-plot data and LaTeX"),
            ("table", "generate a BenchExec HTML table")]:
        subparser = commands.add_parser(command, help=description)
        subparser.add_argument("--runs", required=True, type=comma_list)
        subparser.add_argument("--suites", type=comma_list)
    return result


def configure_analysis(run_names, selected_suites):
    global tools, suites, analysis_runs
    manifests = [load_run_manifest(name, required=True) for name in run_names]
    tools = run_names
    analysis_runs = {name: name for name in run_names}
    if selected_suites:
        suites = selected_suites
    else:
        suite_sets = [set(manifest.get("suites", {})) for manifest in manifests]
        suites = sorted(set.intersection(*suite_sets))
        if not suites:
            raise RuntimeError("Selected runs have no suites in common")


def main():
    if sys.argv[1:] == ["help"]:
        parser().print_help()
        return
    args = parser().parse_args()
    if args.command == "list":
        list_named_runs()
        return
    if args.command == "show":
        show_named_run(args.name)
        return
    if args.command == "compare":
        compared_suites, reference_counts, rows = compare_named_runs(
            args.reference, args.runs, args.suites or [])
        print("Reference: %s; suites: %s"
              % (args.reference, ",".join(compared_suites)))
        print("Reference counts: correct=%d incorrect=%d timeout=%d error=%d"
              % tuple(reference_counts[kind] for kind in
                      ("correct", "incorrect", "timeout", "error")))
        name_width = max(len("run"), *(len(row[0]) for row in rows))
        print(" " * (name_width + 49) + "%17s" % "Speedup")
        print("%-*s %12s %12s %12s %12s %8s %8s" % (
            name_width, "run", "correct", "incorrect", "timeout", "error",
            "gmean", "median"))
        for name, counts, deltas, geomean, median in rows:
            cells = ["%d (%+d)" % (counts[kind], deltas[kind])
                     for kind in ("correct", "incorrect", "timeout", "error")]
            print("%-*s %12s %12s %12s %12s %8s %8s" % (
                name_width, name, *cells,
                "%.3f" % geomean if geomean is not None else "n/a",
                "%.3f" % median if median is not None else "n/a"))
        return
    configure_analysis(args.runs, args.suites)
    if args.command == "summary":
        summary()
    elif args.command == "summary-by-verdict":
        summary_by_verdict()
    elif args.command == "scatter":
        scatter_plot()
    elif args.command == "cactus":
        cactus_plot()
    elif args.command == "table":
        make_table()


if __name__ == "__main__":
    main()
