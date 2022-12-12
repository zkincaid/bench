(set-info :smt-lib-version 2.6)
(set-logic QF_NIA)
(set-info
  :source |
SMT script generated by Ultimate Automizer [1,2].
Ultimate Automizer is an automatic software verification tool that implements
a new automata-theoretic approach [3].

This SMT script belongs to a set of SMT scripts that was generated by applying
Ultimate Automizer to benchmarks from the SV-COMP 2015 [4,5] which are available 
at [6].

This script does _not_ contain all SMT commands that are used by Ultimate 
Automizer while verifying a program. In order to fulfill the restrictions of
the main track at SMT-COMP this script contains only the commands that are
sufficient to reproduce one single satisfiablity check.

2015-04-30, Matthias Heizmann (heizmann@informatik.uni-freiburg.de)


[1] https://ultimate.informatik.uni-freiburg.de/automizer/
[2] Matthias Heizmann, Daniel Dietsch, Jan Leike, Betim Musa, Andreas Podelski:
Ultimate Automizer with Array Interpolation - (Competition Contribution). 
TACAS 2015: 455-457
[3] Matthias Heizmann, Jochen Hoenicke, Andreas Podelski: Software Model 
Checking for People Who Love Automata. CAV 2013:36-52
[4] Dirk Beyer: Software Verification and Verifiable Witnesses - (Report on 
SV-COMP 2015). TACAS 2015: 401-416
[5] http://sv-comp.sosy-lab.org/2015/
[6] https://svn.sosy-lab.org/software/sv-benchmarks/tags/svcomp15/


Made compatible to SMT-COMP rules by SMTInterpol
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun |#sizeof~INT| () Int)
(declare-fun |c_linear_search_#in~n| () Int)
(declare-fun |c_linear_search_#t~short1| () Bool)
(declare-fun c_linear_search_~n () Int)
(declare-fun c_linear_search_~j~5 () Int)
(assert (= |#sizeof~INT| 4))
(assert
 (and
 (or
 (and (= c_linear_search_~j~5 1) |c_linear_search_#t~short1|
 (< (mod c_linear_search_~j~5 4294967296)
 (mod |c_linear_search_#in~n| 4294967296)))
 (and (not |c_linear_search_#t~short1|)
 (not
 (< (mod c_linear_search_~j~5 4294967296)
 (mod |c_linear_search_#in~n| 4294967296))) 
 (= c_linear_search_~j~5 1))) 
 (= c_linear_search_~j~5 1) 
 (= c_linear_search_~n |c_linear_search_#in~n|)))
(assert
 (not
 (and
 (= |c_linear_search_#t~short1|
 (< (mod c_linear_search_~j~5 4294967296)
 (mod c_linear_search_~n 4294967296))) 
 (= c_linear_search_~j~5 1) 
 (= c_linear_search_~n |c_linear_search_#in~n|))))
(check-sat)
(exit)

