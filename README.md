# Bench

Scripts for managing benchmark tasks, running tools with BenchExec, and
analyzing named results.

## Requirements

- [BenchExec](https://github.com/sosy-lab/benchexec)
- [PyYAML](https://pyyaml.org/), installed with
  `python -m pip install PyYAML`
- Benchmarked tools available in `PATH`

## Task management

`task.py` owns benchmark acquisition and subset construction:

```bash
./task.py update-svcomp --release svcomp26
./task.py fetch-svcomp --suites Loops,ControlFlow-Termination
./task.py select --suites Loops --output tasks/IntLoops.set \
  --verdict=True --floats=False
```

Suite names correspond to the runsets available in the `c/<name>.set` files
in SV-COMP (see [here](https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks/)).
Checked out SV-COMP tasks are stored in `tasks/sv-benchmarks` and metadata is recorded `svcomp.lock`. Changing releases clears
the fetched set list, while fetching sets from the current release is additive.

`select` accepts comma-separated input suites and arbitrary boolean category
filters. Expected verdicts are read from task YAML; other categories are
computed with `duet.exe -categorize`. Output paths are relative to the generated
`.set` file.

## Running tools

`run.py` executes tool configurations and records named runs:

```bash
./run.py --tools CRA,CRAM --suites IntLoops --timeout 60
./run.py --name before --tools CRA --suites IntLoops --timeout 60
```

Without `--name`, each tool configuration is also its run name. An explicit
name requires exactly one tool. Repeating a command uses the result recorded in
that run unless `--no-cache` is supplied. A run may accumulate multiple suites;
each manifest represents exactly one tool configuration.

Run manifests are stored in `results/runs/<name>.json`. Result XML remains in
BenchExec's `results` directory.

## Processing results

`result.py` reads named manifests and BenchExec XML without invoking tools:

```bash
./result.py list
./result.py show CRA
./result.py summary --runs CRA,CRAM --suites IntLoops
./result.py summary-by-verdict --runs CRA,CRAM --suites IntLoops
./result.py scatter --runs CRA,CRAM --suites IntLoops
./result.py cactus --runs CRA,CRAM --suites IntLoops
./result.py table --runs CRA,CRAM --suites IntLoops
./result.py compare --reference CRA --runs CRAM,OtherRun
```

If an analysis command omits `--suites`, it uses the suites common to every
selected run. Run names are used as labels, so multiple executions of the same
tool configuration can be compared directly. `compare` reports result-count
deltas and geometric-mean and median speedups for each candidate relative to
one reference run.

Each script supports `-h` and `--help`.

## Benchmark definitions

Tool definitions live in `benchmark-defs`. Duet configurations are named run
definitions in `DuetSafety.xml` and `DuetTermination.xml`; their mapping is in
`benchlib.py`. Other tools have their own BenchExec XML files.
