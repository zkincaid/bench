(declare-const delta_x Real)
(declare-const delta_k Int)
(declare-const delta_j Int)
(assert (exists
         ((|j'?1| Int) (|x'?2| Real) (|S1,0?3| Real) (|k'?4| Int)
            (KSUM1?5 Int) (|K1,0?6| Int) (K?7 Int) (tr?8 Int) (|x'?9| Real)
            (|k'?10| Int) (k?11 Int) (x?12 Real) (j?13 Int) (n?14 Int)
            (i?15 Int))
         (and (< (- j?13) 0) (< (- n?14) 0) (<= (- i?15) 0)
                (< (+ (- n?14) j?13) 0) (<= (- K?7) 0) (<= (- |K1,0?6|) 0)
                (= (+ |K1,0?6| (- K?7)) 0) (<= (+ KSUM1?5 (- K?7)) 0)
                (= (+ (- |S1,0?3|) |k'?4| (- |K1,0?6|)) 0)
                (= (+ (- KSUM1?5) |K1,0?6|) 0) (= |S1,0?3| 0)
                (or (and (= K?7 0) (= (+ (- |x'?2|) tr?8) 0) (= (- |k'?4|) 0))
                      (and (<= (+ (- K?7) 1) 0) (<= (+ (- i?15) 1) 0)
                             (<= (+ |k'?4| (- i?15)) 0)
                             (<= (+ (- |k'?4|) 1) 0)))
                (= (+ |k'?4| (- K?7)) 0) (<= (- K?7) 0) (<= (- |k'?4|) 0)
                (<= (- i?15) 0) (< (+ (- |k'?4|) i?15 -1) 0)
                (= (+ |x'?9| (- |x'?2|)) 0) (= (+ |k'?10| (- |k'?4|)) 0)
                (= (+ |j'?1| (- j?13) -1) 0) (= delta_j (+ |j'?1| (- j?13)))
                (= delta_k (+ |k'?10| (- k?11)))
                (= delta_x (+ |x'?9| (- x?12))))))
(check-sat)
