(declare-const delta_i Int)
(declare-const delta_j Int)
(assert (exists
         ((|j'?1| Int) (|i'?2| Int) (j?3 Int) (n?4 Int) (k?5 Int) (i?6 Int))
         (and (<= (- j?3) 0) (< (- n?4) 0) (<= (- i?6) 0)
                (<= (+ (- k?5) i?6) 0) (= (+ |j'?1| (- n?4) (- j?3)) 0)
                (= (+ |i'?2| (- i?6) -1) 0) (= delta_i (+ |i'?2| (- i?6)))
                (= delta_j (+ |j'?1| (- j?3))))))
(check-sat)
