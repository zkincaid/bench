(declare-const delta_j Int)
(declare-const delta_k Int)
(declare-const delta_i Int)
(assert (exists
         ((|i'?1| Int) (|k'?2| Int) (|S1,0?3| Real) (|j'?4| Int)
            (KSUM1?5 Int) (|K1,0?6| Int) (K?7 Int) (|j'?8| Int) (|k'?9| Int)
            (k?10 Int) (j?11 Int) (n?12 Int) (i?13 Int))
         (and (<= (- i?13) 0) (< (+ (- n?12) i?13) 0) (<= (- K?7) 0)
                (<= (- |K1,0?6|) 0) (= (+ |K1,0?6| (- K?7)) 0)
                (<= (+ KSUM1?5 (- K?7)) 0)
                (= (+ (- |S1,0?3|) |j'?4| (- |K1,0?6|)) 0)
                (= (+ (- KSUM1?5) |K1,0?6|) 0) (= (+ |S1,0?3| (- i?13)) 0)
                (or (and (= K?7 0) (= (+ (- |k'?2|) k?10) 0)
                           (= (+ (- |j'?4|) i?13) 0))
                      (and (<= (+ (- K?7) 1) 0) (<= (+ (- n?12) i?13 1) 0)
                             (<= (- i?13) 0) (= (+ |k'?2| (- n?12)) 0)
                             (<= (+ (- |j'?4|) i?13 1) 0) (<= (- i?13) 0)
                             (<= (+ |j'?4| (- n?12)) 0)))
                (= (+ |j'?4| (- K?7) (- i?13)) 0) (<= (- K?7) 0)
                (<= (- |j'?4|) 0) (< (- n?12) 0) (<= (- i?13) 0)
                (<= (+ (- |j'?4|) n?12) 0) (= (+ |k'?9| (- |k'?2|)) 0)
                (= (+ |j'?8| (- |j'?4|)) 0) (= (+ |i'?1| (- i?13) -1) 0)
                (= delta_i (+ |i'?1| (- i?13)))
                (= delta_j (+ |j'?8| (- j?11)))
                (= delta_k (+ |k'?9| (- k?10))))))
(check-sat)
