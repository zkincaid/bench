(declare-const delta_k Int)
(declare-const delta_j Int)
(declare-const delta_i Int)
(assert (exists
         ((|i'?1| Int) (|k'?2| Int) (|S1,0?3| Real) (|j'?4| Int)
            (KSUM1?5 Int) (|K1,0?6| Int) (K?7 Int) (|j'?8| Int) (|k'?9| Int)
            (nk?10 Int) (k?11 Int) (nj?12 Int) (j?13 Int) (ni?14 Int)
            (i?15 Int))
         (and (<= (- i?15) 0) (< (+ (- ni?14) i?15) 0) (<= (- K?7) 0)
                (<= (- |K1,0?6|) 0) (= (+ |K1,0?6| (- K?7)) 0)
                (<= (+ KSUM1?5 (- K?7)) 0)
                (= (+ (- |S1,0?3|) |j'?4| (- |K1,0?6|)) 0)
                (= (+ (- KSUM1?5) |K1,0?6|) 0) (= |S1,0?3| 0)
                (or (and (= K?7 0) (= (+ (- |k'?2|) k?11) 0) (= (- |j'?4|) 0))
                      (and (<= (+ (- K?7) 1) 0) (<= (+ (- nj?12) 1) 0)
                             (<= (+ (- nj?12) |j'?4|) 0)
                             (<= (+ nk?10 (- |k'?2|)) 0) (<= (- |k'?2|) 0)
                             (<= (+ (- |j'?4|) 1) 0)))
                (= (+ |j'?4| (- K?7)) 0) (<= (- K?7) 0) (<= (- |j'?4|) 0)
                (<= (+ nj?12 (- |j'?4|)) 0) (= (+ |k'?9| (- |k'?2|)) 0)
                (= (+ |j'?8| (- |j'?4|)) 0) (= (+ |i'?1| (- i?15) -1) 0)
                (= delta_i (+ |i'?1| (- i?15)))
                (= delta_j (+ |j'?8| (- j?13)))
                (= delta_k (+ |k'?9| (- k?11))))))
(check-sat)
