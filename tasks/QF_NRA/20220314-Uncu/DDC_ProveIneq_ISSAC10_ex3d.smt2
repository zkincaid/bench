(set-info :smt-lib-version 2.6)
(set-logic QF_NRA)
(set-info :source |
Generated by: Ali K. Uncu, Matthew England, and James H. Davenport
Generated on: 2022-01-06

Generator: SUMCracker-ProveInequality function by Manuel Kauers ("https://www3.risc.jku.at/research/combinat/software/ergosum/RISC/SumCracker.html")
Translated to SMT-Lib by Maple SMTLIB package.

Application: CAD calls of SUMCracker-ProveInequality to prove Example 3 in
M. Kauers and V. Pillwein, When can we detect that a P-finite sequence is positive?
ISSAC '10: Proceedings of the 2010 International Symposium on Symbolic and Algebraic ComputationJuly 2010 Pages 195–201
(https://doi.org/10.1145/1837934.1837974)

All denominators in the original CAD call got cleared by introducing disjunctions with sign conditions:
a/b == c/d --> a d==b c && b<>0 && d<>0
a/b >= c  --> a >=b c && b >0  or ( a <= b c && b < 0)
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :status sat)
(set-info :category "industrial")

(declare-fun V1 () Real)
(declare-fun V2 () Real)
(assert (and (<= 0 V1) (<= 1 V2) (<= 0 V2) (<= 0 (+ 1 V2)) (<= 0 (+ 2 V2)) (<= 0 (+ 3 V2)) (or (and (< 0 (+ (- 17) (* V2 3))) (<= 0 (* V1 (+ (- 16) (* V2 3))))) (and (< (* V2 3) 17) (<= (* V1 (+ (- 16) (* V2 3))) 0))) (or (and (< 0 (* (+ (- 17) (* V2 3)) (+ (- 14) (* V2 3)))) (<= 0 (* V1 (+ (* (* V2 V2) 9) (* V2 (- 87)) 208)))) (and (< (* (+ (- 17) (* V2 3)) (+ (- 14) (* V2 3))) 0) (<= (* V1 (+ (* (* V2 V2) 9) (* V2 (- 87)) 208)) 0))) (or (and (< 0 (* (+ (- 17) (* V2 3)) (+ (- 14) (* V2 3)) (+ (- 11) (* V2 3)))) (<= 0 (* V1 (+ (* (* V2 V2 V2) 27) (* (* V2 V2) (- 351)) (* V2 1494) (- 2080))))) (and (< (* (+ (- 17) (* V2 3)) (+ (- 14) (* V2 3)) (+ (- 11) (* V2 3))) 0) (<= (* V1 (+ (* (* V2 V2 V2) 27) (* (* V2 V2) (- 351)) (* V2 1494) (- 2080))) 0))) (or (and (< 0 (* (+ (- 17) (* V2 3)) (+ (- 14) (* V2 3)) (+ (- 11) (* V2 3)) (+ (- 8) (* V2 3)))) (< (* V1 (+ (* (* V2 V2 V2 V2) 81) (* (* V2 V2 V2) (- 1242)) (* (* V2 V2) 6939) (* V2 (- 16698)) 14560)) 0)) (and (< (* (+ (- 17) (* V2 3)) (+ (- 14) (* V2 3)) (+ (- 11) (* V2 3)) (+ (- 8) (* V2 3))) 0) (< 0 (* V1 (+ (* (* V2 V2 V2 V2) 81) (* (* V2 V2 V2) (- 1242)) (* (* V2 V2) 6939) (* V2 (- 16698)) 14560)))))))
(check-sat)
(exit)




















