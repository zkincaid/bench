(set-info :smt-lib-version 2.6)
(set-logic QF_NRA)
(set-info :source |
SMT script generated by Ultimate Automizer [1,2].
Ultimate Automizer is a software verifier for C programs that implements an
automata-based approach [3].
The commands in this SMT scripts are used for a constraint-based synthesis
of invariants [4].

2016-04-30, Matthias Heizmann (heizmann@informatik.uni-freiburg.de)


[1] http://http://ultimate.informatik.uni-freiburg.de/automizer/
[2] Matthias Heizmann, Daniel Dietsch, Marius Greitschus, Jan Leike,
Betim Musa, Claus Schätzle, Andreas Podelski: Ultimate Automizer with
Two-track Proofs - (Competition Contribution). TACAS 2016: 950-953
[3] Matthias Heizmann, Jochen Hoenicke, Andreas Podelski: Software Model
Checking for People Who Love Automata. CAV 2013:36-52
[4] Michael Colon, Sriram Sankaranarayanan, Henny Sipma: Linear Invariant
Generation Using Non-linear Constraint Solving. CAV 2003: 420-432

|)
(set-info :category "industrial")
(set-info :status sat)
(declare-fun liipp_0_c () Real)
(declare-fun liipp_0__x () Real)
(declare-fun liipp_0__y () Real)
(declare-fun liipp_1_c () Real)
(declare-fun liipp_1__x () Real)
(declare-fun liipp_1__y () Real)
(declare-fun liipp_2_c () Real)
(declare-fun liipp_2__x () Real)
(declare-fun liipp_2__y () Real)
(declare-fun liipp_3_c () Real)
(declare-fun liipp_3__x () Real)
(declare-fun liipp_3__y () Real)
(declare-fun liipp_4_c () Real)
(declare-fun liipp_4__x () Real)
(declare-fun liipp_4__y () Real)
(declare-fun liipp_5_c () Real)
(declare-fun liipp_5__x () Real)
(declare-fun liipp_5__y () Real)
(declare-fun liipp_6_replace_0 () Real)
(declare-fun liipp_6_replace_1 () Real)
(declare-fun liipp_7_replace_0 () Real)
(declare-fun liipp_7_replace_1 () Real)
(declare-fun motzkin_5543_0 () Real)
(declare-fun motzkin_5543_1 () Real)
(declare-fun motzkin_5543_2 () Real)
(declare-fun motzkin_5543_3 () Real)
(declare-fun motzkin_5543_4 () Real)
(declare-fun motzkin_5544_0 () Real)
(declare-fun motzkin_5544_1 () Real)
(declare-fun motzkin_5544_2 () Real)
(declare-fun motzkin_5544_3 () Real)
(declare-fun motzkin_5544_4 () Real)
(assert (and (>= motzkin_5543_0 0.0) (>= motzkin_5543_1 0.0) (>= motzkin_5543_2 0.0) (>= motzkin_5543_3 0.0) (>= motzkin_5543_4 0.0) (= (+ motzkin_5543_0 (* motzkin_5543_1 (- 1.0)) (* motzkin_5543_4 (+ (* (- 1.0) liipp_0__x) 0.0))) 0.0) (= (+ (* motzkin_5543_2 (- 1.0)) motzkin_5543_3 (* motzkin_5543_4 (+ (* (- 1.0) liipp_0__y) 0.0))) 0.0) (<= (+ (* motzkin_5543_2 50.0) (* motzkin_5543_3 (- 50.0)) (* motzkin_5543_4 (+ (* (- 1.0) liipp_0_c) 0.0))) 0.0) (or (< (+ (* motzkin_5543_2 50.0) (* motzkin_5543_3 (- 50.0)) (* motzkin_5543_4 (+ (* (- 1.0) liipp_0_c) 0.0))) 0.0) (> 0.0 0.0)) (>= motzkin_5544_0 0.0) (>= motzkin_5544_1 0.0) (>= motzkin_5544_2 0.0) (>= motzkin_5544_3 0.0) (>= motzkin_5544_4 0.0) (= (+ motzkin_5544_0 (* motzkin_5544_1 (- 1.0)) (* motzkin_5544_4 (+ (* (- 1.0) liipp_1__x) 0.0))) 0.0) (= (+ (* motzkin_5544_2 (- 1.0)) motzkin_5544_3 (* motzkin_5544_4 (+ (* (- 1.0) liipp_1__y) 0.0))) 0.0) (<= (+ (* motzkin_5544_2 50.0) (* motzkin_5544_3 (- 50.0)) (* motzkin_5544_4 (+ (* (- 1.0) liipp_1_c) 0.0))) 0.0) (or (< (+ (* motzkin_5544_2 50.0) (* motzkin_5544_3 (- 50.0))) 0.0) (> motzkin_5544_4 0.0))))
(declare-fun liipp_9_replace_0 () Real)
(declare-fun motzkin_5545_0 () Real)
(declare-fun motzkin_5545_1 () Real)
(declare-fun motzkin_5545_2 () Real)
(declare-fun motzkin_5545_3 () Real)
(declare-fun motzkin_5546_0 () Real)
(declare-fun motzkin_5546_1 () Real)
(declare-fun motzkin_5546_2 () Real)
(declare-fun motzkin_5546_3 () Real)
(assert (and (>= motzkin_5545_0 0.0) (>= motzkin_5545_1 0.0) (>= motzkin_5545_2 0.0) (>= motzkin_5545_3 0.0) (= (+ (* motzkin_5545_0 (- 1.0)) (* motzkin_5545_1 (+ (* (- 1.0) liipp_2__x) 0.0)) (* motzkin_5545_2 (+ (* 1.0 liipp_0__x) 0.0)) (* motzkin_5545_3 (+ (* 1.0 liipp_1__x) 0.0))) 0.0) (= (+ (* motzkin_5545_1 (+ (* (- 1.0) liipp_2__y) 0.0)) (* motzkin_5545_2 (+ (* 1.0 liipp_0__y) 0.0)) (* motzkin_5545_3 (+ (* 1.0 liipp_1__y) 0.0))) 0.0) (<= (+ (* motzkin_5545_0 99.0) (* motzkin_5545_1 (+ (* (- 1.0) liipp_2_c) 0.0)) (* motzkin_5545_2 (+ (* 1.0 liipp_0_c) 0.0)) (* motzkin_5545_3 (+ (* 1.0 liipp_1_c) 0.0))) 0.0) (or (< (+ (* motzkin_5545_0 99.0) (* motzkin_5545_1 (+ (* (- 1.0) liipp_2_c) 0.0)) (* motzkin_5545_3 (+ (* 1.0 liipp_1_c) 0.0))) 0.0) (> motzkin_5545_2 0.0)) (>= motzkin_5546_0 0.0) (>= motzkin_5546_1 0.0) (>= motzkin_5546_2 0.0) (>= motzkin_5546_3 0.0) (= (+ (* motzkin_5546_0 (- 1.0)) (* motzkin_5546_1 (+ (* (- 1.0) liipp_3__x) 0.0)) (* motzkin_5546_2 (+ (* 1.0 liipp_0__x) 0.0)) (* motzkin_5546_3 (+ (* 1.0 liipp_1__x) 0.0))) 0.0) (= (+ (* motzkin_5546_1 (+ (* (- 1.0) liipp_3__y) 0.0)) (* motzkin_5546_2 (+ (* 1.0 liipp_0__y) 0.0)) (* motzkin_5546_3 (+ (* 1.0 liipp_1__y) 0.0))) 0.0) (<= (+ (* motzkin_5546_0 99.0) (* motzkin_5546_1 (+ (* (- 1.0) liipp_3_c) 0.0)) (* motzkin_5546_2 (+ (* 1.0 liipp_0_c) 0.0)) (* motzkin_5546_3 (+ (* 1.0 liipp_1_c) 0.0))) 0.0) (or (< (+ (* motzkin_5546_0 99.0) (* motzkin_5546_3 (+ (* 1.0 liipp_1_c) 0.0))) 0.0) (> (+ motzkin_5546_1 motzkin_5546_2) 0.0))))
(declare-fun liipp_10_replace_0 () Real)
(declare-fun motzkin_5547_0 () Real)
(declare-fun motzkin_5547_1 () Real)
(declare-fun motzkin_5547_2 () Real)
(declare-fun motzkin_5547_3 () Real)
(declare-fun motzkin_5547_4 () Real)
(declare-fun motzkin_5547_5 () Real)
(declare-fun motzkin_5548_0 () Real)
(declare-fun motzkin_5548_1 () Real)
(declare-fun motzkin_5548_2 () Real)
(declare-fun motzkin_5548_3 () Real)
(declare-fun motzkin_5548_4 () Real)
(declare-fun motzkin_5548_5 () Real)
(assert (and (>= motzkin_5547_0 0.0) (>= motzkin_5547_1 0.0) (>= motzkin_5547_2 0.0) (>= motzkin_5547_3 0.0) (>= motzkin_5547_4 0.0) (>= motzkin_5547_5 0.0) (= (+ motzkin_5547_0 (* motzkin_5547_1 (- 1.0)) (* motzkin_5547_3 (+ (* (- 1.0) liipp_0__x) 0.0))) 0.0) (= (+ (* motzkin_5547_0 (- 1.0)) motzkin_5547_1 (* motzkin_5547_2 (- 1.0)) (* motzkin_5547_4 (+ (* 1.0 liipp_2__x) 0.0)) (* motzkin_5547_5 (+ (* 1.0 liipp_3__x) 0.0))) 0.0) (= (+ (* motzkin_5547_3 (+ (* (- 1.0) liipp_0__y) 0.0)) (* motzkin_5547_4 (+ (* 1.0 liipp_2__y) 0.0)) (* motzkin_5547_5 (+ (* 1.0 liipp_3__y) 0.0))) 0.0) (<= (+ (* motzkin_5547_0 (- 1.0)) motzkin_5547_1 (* motzkin_5547_2 49.0) (* motzkin_5547_3 (+ (* (- 1.0) liipp_0_c) 0.0)) (* motzkin_5547_4 (+ (* 1.0 liipp_2_c) 0.0)) (* motzkin_5547_5 (+ (* 1.0 liipp_3_c) 0.0))) 0.0) (or (< (+ (* motzkin_5547_0 (- 1.0)) motzkin_5547_1 (* motzkin_5547_2 49.0) (* motzkin_5547_3 (+ (* (- 1.0) liipp_0_c) 0.0)) (* motzkin_5547_5 (+ (* 1.0 liipp_3_c) 0.0))) 0.0) (> motzkin_5547_4 0.0)) (>= motzkin_5548_0 0.0) (>= motzkin_5548_1 0.0) (>= motzkin_5548_2 0.0) (>= motzkin_5548_3 0.0) (>= motzkin_5548_4 0.0) (>= motzkin_5548_5 0.0) (= (+ motzkin_5548_0 (* motzkin_5548_1 (- 1.0)) (* motzkin_5548_3 (+ (* (- 1.0) liipp_1__x) 0.0))) 0.0) (= (+ (* motzkin_5548_0 (- 1.0)) motzkin_5548_1 (* motzkin_5548_2 (- 1.0)) (* motzkin_5548_4 (+ (* 1.0 liipp_2__x) 0.0)) (* motzkin_5548_5 (+ (* 1.0 liipp_3__x) 0.0))) 0.0) (= (+ (* motzkin_5548_3 (+ (* (- 1.0) liipp_1__y) 0.0)) (* motzkin_5548_4 (+ (* 1.0 liipp_2__y) 0.0)) (* motzkin_5548_5 (+ (* 1.0 liipp_3__y) 0.0))) 0.0) (<= (+ (* motzkin_5548_0 (- 1.0)) motzkin_5548_1 (* motzkin_5548_2 49.0) (* motzkin_5548_3 (+ (* (- 1.0) liipp_1_c) 0.0)) (* motzkin_5548_4 (+ (* 1.0 liipp_2_c) 0.0)) (* motzkin_5548_5 (+ (* 1.0 liipp_3_c) 0.0))) 0.0) (or (< (+ (* motzkin_5548_0 (- 1.0)) motzkin_5548_1 (* motzkin_5548_2 49.0) (* motzkin_5548_5 (+ (* 1.0 liipp_3_c) 0.0))) 0.0) (> (+ motzkin_5548_3 motzkin_5548_4) 0.0))))
(declare-fun liipp_11_replace_0 () Real)
(declare-fun motzkin_5549_0 () Real)
(declare-fun motzkin_5549_1 () Real)
(declare-fun motzkin_5549_2 () Real)
(declare-fun motzkin_5549_3 () Real)
(declare-fun motzkin_5550_0 () Real)
(declare-fun motzkin_5550_1 () Real)
(declare-fun motzkin_5550_2 () Real)
(declare-fun motzkin_5550_3 () Real)
(assert (and (>= motzkin_5549_0 0.0) (>= motzkin_5549_1 0.0) (>= motzkin_5549_2 0.0) (>= motzkin_5549_3 0.0) (= (+ motzkin_5549_0 (* motzkin_5549_1 (+ (* (- 1.0) liipp_4__x) 0.0)) (* motzkin_5549_2 (+ (* 1.0 liipp_0__x) 0.0)) (* motzkin_5549_3 (+ (* 1.0 liipp_1__x) 0.0))) 0.0) (= (+ (* motzkin_5549_1 (+ (* (- 1.0) liipp_4__y) 0.0)) (* motzkin_5549_2 (+ (* 1.0 liipp_0__y) 0.0)) (* motzkin_5549_3 (+ (* 1.0 liipp_1__y) 0.0))) 0.0) (<= (+ (* motzkin_5549_0 (- 100.0)) (* motzkin_5549_1 (+ (* (- 1.0) liipp_4_c) 0.0)) (* motzkin_5549_2 (+ (* 1.0 liipp_0_c) 0.0)) (* motzkin_5549_3 (+ (* 1.0 liipp_1_c) 0.0))) 0.0) (or (< (+ (* motzkin_5549_0 (- 100.0)) (* motzkin_5549_1 (+ (* (- 1.0) liipp_4_c) 0.0)) (* motzkin_5549_3 (+ (* 1.0 liipp_1_c) 0.0))) 0.0) (> motzkin_5549_2 0.0)) (>= motzkin_5550_0 0.0) (>= motzkin_5550_1 0.0) (>= motzkin_5550_2 0.0) (>= motzkin_5550_3 0.0) (= (+ motzkin_5550_0 (* motzkin_5550_1 (+ (* (- 1.0) liipp_5__x) 0.0)) (* motzkin_5550_2 (+ (* 1.0 liipp_0__x) 0.0)) (* motzkin_5550_3 (+ (* 1.0 liipp_1__x) 0.0))) 0.0) (= (+ (* motzkin_5550_1 (+ (* (- 1.0) liipp_5__y) 0.0)) (* motzkin_5550_2 (+ (* 1.0 liipp_0__y) 0.0)) (* motzkin_5550_3 (+ (* 1.0 liipp_1__y) 0.0))) 0.0) (<= (+ (* motzkin_5550_0 (- 100.0)) (* motzkin_5550_1 (+ (* (- 1.0) liipp_5_c) 0.0)) (* motzkin_5550_2 (+ (* 1.0 liipp_0_c) 0.0)) (* motzkin_5550_3 (+ (* 1.0 liipp_1_c) 0.0))) 0.0) (or (< (+ (* motzkin_5550_0 (- 100.0)) (* motzkin_5550_3 (+ (* 1.0 liipp_1_c) 0.0))) 0.0) (> (+ motzkin_5550_1 motzkin_5550_2) 0.0))))
(declare-fun liipp_12_replace_0 () Real)
(declare-fun motzkin_5551_0 () Real)
(declare-fun motzkin_5551_1 () Real)
(declare-fun motzkin_5551_2 () Real)
(assert (and (>= motzkin_5551_0 0.0) (>= motzkin_5551_1 0.0) (>= motzkin_5551_2 0.0) (= (+ (* motzkin_5551_0 (- 1.0)) (* motzkin_5551_1 (+ (* 1.0 liipp_4__y) 0.0)) (* motzkin_5551_2 (+ (* 1.0 liipp_5__y) 0.0))) 0.0) (= (+ (* motzkin_5551_1 (+ (* 1.0 liipp_4__x) 0.0)) (* motzkin_5551_2 (+ (* 1.0 liipp_5__x) 0.0))) 0.0) (<= (+ (* motzkin_5551_0 99.0) (* motzkin_5551_1 (+ (* 1.0 liipp_4_c) 0.0)) (* motzkin_5551_2 (+ (* 1.0 liipp_5_c) 0.0))) 0.0) (or (< (+ (* motzkin_5551_0 99.0) (* motzkin_5551_2 (+ (* 1.0 liipp_5_c) 0.0))) 0.0) (> motzkin_5551_1 0.0))))
(check-sat)
(exit)
