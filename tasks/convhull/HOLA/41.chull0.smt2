(declare-const delta_i Int)
(declare-const delta_j Int)
(assert (exists ((|j'?1| Int) (|i'?2| Int) (j?3 Int) (i?4 Int) (n?5 Int))
         (and (<= (- j?3) 0) (<= (- i?4) 0) (<= (- n?5) 0)
                (<= (+ (- n?5) i?4) 0) (= (+ |j'?1| (- i?4) (- j?3) -1) 0)
                (= (+ |i'?2| (- i?4) -1) 0) (= delta_i (+ |i'?2| (- i?4)))
                (= delta_j (+ |j'?1| (- j?3))))))
(check-sat)
