(set-info :smt-lib-version 2.6)
(set-logic QF_NRA)
(set-info :source |
Generated by: Anastasiia Izycheva, Eva Darulova
Generated on: 2020-09-11
Generator: Pine (using Z3 Python API)
Application: Check inductiveness of a loop invariant
Target solver: Z3

These benchmarks were generated while developing the tool Pine [1], which uses
CVC4/Z3 to check inductiveness of invariants. The work is described in [2].

[1] https://github.com/izycheva/pine
[2] A.Izycheva, E.Darulova, H.Seidl, SAS'20, "Counterexample- and Simulation-Guided Floating-Point Loop Invariant Synthesis"

 Loop:
   x' := x + 0.01 * (-x + 2*x*x + y*y)
   y' := y + 0.01 * (-y + y*y)

 Input ranges:
   x in [-0.4,0.3]
   y in [-0.4,0.3]

 Invariant:
   0.1*x + 0.1*y + 0.98*x^2 + 0.01*x*y + 1.0*y^2 <= 0.24
 and
   x in [-0.4,0.4]
   y in [-0.4,0.3]

 Query: Loop and Invariant and not Invariant'
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
(declare-fun x! () Real)
(declare-fun y! () Real)
(declare-fun y () Real)
(declare-fun x () Real)
(assert
 (let ((?x166 (+ (* (* (/ 1.0 100.0) x!) y!) (+ (* (* 1.0 y!) y!) (* (/ 1.0 10.0) x!)))))
 (let ((?x86 (* (/ 1.0 10.0) y!)))
 (let (($x100 (and (<= (- (/ 2.0 5.0)) x!) (>= (/ 2.0 5.0) x!) (<= (- (/ 2.0 5.0)) y!) (>= (/ 3.0 10.0) y!))))
 (let (($x189 (and $x100 (>= (/ 6.0 25.0) (+ ?x86 (+ (* (* (/ 49.0 50.0) x!) x!) ?x166))) )))
 (let ((?x84 (+ x (* (/ 1.0 100.0) (+ (+ (- x) (* (* 2.0 x) x)) (* y y))))))
 (let (($x114 (and (= x! ?x84) (= y! (+ y (* (/ 1.0 100.0) (+ (- y) (* y y))))))))
 (let ((?x52 (+ (* (* (/ 1.0 100.0) x) y) (+ (* (* 1.0 y) y) (* (/ 1.0 10.0) x)))))
 (let ((?x57 (* (/ 1.0 10.0) y)))
 (let (($x16 (>= (/ 3.0 10.0) y)))
 (let (($x15 (<= (- (/ 2.0 5.0)) y)))
 (let (($x7 (<= (- (/ 2.0 5.0)) x)))
 (let (($x91 (and (and $x7 (>= (/ 2.0 5.0) x) $x15 $x16) (>= (/ 6.0 25.0) (+ ?x57 (+ (* (* (/ 49.0 50.0) x) x) ?x52))) )))
 (and $x91 $x114 (not $x189)))))))))))))))
(check-sat)
(exit)
