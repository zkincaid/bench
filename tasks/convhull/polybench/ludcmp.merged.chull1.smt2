(declare-const delta_j Int)
(declare-const delta_i Int)
(declare-const delta_w Real)
(assert (exists
         ((|i'?1| Int) (|w'?2| Real) (|S1,0?3| Real) (|j'?4| Int)
            (KSUM1?5 Int) (|K1,0?6| Int) (K?7 Int) (tr?8 Real) (|w'?9| Real)
            (|j'?10| Int) (w?11 Real) (j?12 Int) (n?13 Int) (i?14 Int))
         (and (<= (- i?14) 0) (<= (+ (- n?13) i?14 1) 0) (<= (- K?7) 0)
                (<= (- |K1,0?6|) 0) (= (+ |K1,0?6| (- K?7)) 0)
                (<= (+ KSUM1?5 (- K?7)) 0)
                (= (+ (- |S1,0?3|) |j'?4| (- |K1,0?6|)) 0)
                (= (+ (- KSUM1?5) |K1,0?6|) 0)
                (= (+ |S1,0?3| (- n?13) i?14) 0)
                (or (and (= K?7 0) (= (+ (- |w'?2|) tr?8) 0)
                           (= (+ (- |j'?4|) n?13 (- i?14)) 0))
                      (and (<= (+ (- K?7) 1) 0) (<= (- i?14) 0)
                             (<= (+ (- n?13) i?14 1) 0)
                             (<= (+ |j'?4| (- n?13) -1) 0)
                             (<= (+ (- |j'?4|) 2) 0)))
                (= (+ |j'?4| (- K?7) (- n?13) i?14) 0) (<= (- K?7) 0)
                (< (- |j'?4|) 0) (< (- n?13) 0) (< (+ (- |j'?4|) n?13) 0)
                (= (+ |w'?9| (- |w'?2|)) 0) (= (+ |j'?10| (- |j'?4|)) 0)
                (= (+ |i'?1| (- i?14) -1) 0) (= delta_i (+ |i'?1| (- i?14)))
                (= delta_j (+ |j'?10| (- j?12)))
                (= delta_w (+ |w'?9| (- w?11))))))
(check-sat)
