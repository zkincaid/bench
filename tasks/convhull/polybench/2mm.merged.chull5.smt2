(declare-const delta_k Int)
(declare-const delta_j Int)
(declare-const delta_i Int)
(assert (exists
         ((|k'?1| Int) (|S1,0?2| Real) (|j'?3| Int) (KSUM1?4 Int)
            (|K1,0?5| Int) (K?6 Int) (|i'?7| Int) (|j'?8| Int) (|k'?9| Int)
            (nk?10 Int) (k?11 Int) (nj?12 Int) (j?13 Int) (ni?14 Int)
            (i?15 Int))
         (and (<= (- i?15) 0) (< (+ (- ni?14) i?15) 0) (<= (- K?6) 0)
                (<= (- |K1,0?5|) 0) (= (+ |K1,0?5| (- K?6)) 0)
                (<= (+ KSUM1?4 (- K?6)) 0)
                (= (+ (- |S1,0?2|) |j'?3| (- |K1,0?5|)) 0)
                (= (+ (- KSUM1?4) |K1,0?5|) 0) (= |S1,0?2| 0)
                (or (and (= K?6 0) (= (+ (- |k'?1|) k?11) 0) (= (- |j'?3|) 0))
                      (and (<= (+ (- K?6) 1) 0) (<= (+ (- nj?12) 1) 0)
                             (<= (+ (- nj?12) |j'?3|) 0)
                             (<= (+ nk?10 (- |k'?1|)) 0) (<= (- |k'?1|) 0)
                             (<= (+ (- |j'?3|) 1) 0)))
                (= (+ |j'?3| (- K?6)) 0) (<= (- K?6) 0) (<= (- |j'?3|) 0)
                (<= (+ nj?12 (- |j'?3|)) 0) (= (+ |k'?9| (- |k'?1|)) 0)
                (= (+ |j'?8| (- |j'?3|)) 0) (= (+ |i'?7| (- i?15) -1) 0)
                (= delta_i (+ |i'?7| (- i?15)))
                (= delta_j (+ |j'?8| (- j?13)))
                (= delta_k (+ |k'?9| (- k?11))))))
(check-sat)
