(declare-const delta_j Int)
(declare-const delta_k Int)
(declare-const delta_i Int)
(assert (exists
         ((|j'?1| Int) (|k'?2| Int) (|i'?3| Int) (n?4 Int) (j?5 Int)
            (k?6 Int) (i?7 Int))
         (and (<= (- n?4) 0) (<= (- j?5) 0) (<= (- k?6) 0) (<= (- i?7) 0)
                (= (+ (- i?7) (- j?5) n?4) 0) (= (+ (- i?7) k?6) 0)
                (<= (- k?6) 0) (< (+ j?5 (- n?4) 1) 0)
                (= (+ |j'?1| (- j?5) -1) 0) (= (+ |k'?2| (- k?6) 1) 0)
                (= (+ |i'?3| (- i?7) 1) 0) (= delta_i (+ |i'?3| (- i?7)))
                (= delta_k (+ |k'?2| (- k?6))) (= delta_j (+ |j'?1| (- j?5))))))
(check-sat)
