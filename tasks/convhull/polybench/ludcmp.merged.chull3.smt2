(declare-const delta_w Real)
(declare-const delta_j Int)
(declare-const delta_i Int)
(assert (exists
         ((|w'?1| Real) (|S1,0?2| Real) (|j'?3| Int) (KSUM1?4 Int)
            (|K1,0?5| Int) (K?6 Int) (tr?7 Real) (|i'?8| Int) (|w'?9| Real)
            (|j'?10| Int) (w?11 Real) (j?12 Int) (n?13 Int) (i?14 Int))
         (and (< (- i?14) 0) (<= (+ (- n?13) i?14) 0) (<= (- K?6) 0)
                (<= (- |K1,0?5|) 0) (= (+ |K1,0?5| (- K?6)) 0)
                (<= (+ KSUM1?4 (- K?6)) 0)
                (= (+ (- |S1,0?2|) |j'?3| (- |K1,0?5|)) 0)
                (= (+ (- KSUM1?4) |K1,0?5|) 0) (= |S1,0?2| 0)
                (or (and (= K?6 0) (= (+ (- |w'?1|) tr?7) 0) (= (- |j'?3|) 0))
                      (and (<= (+ (- K?6) 1) 0) (<= (+ (- i?14) 1) 0)
                             (<= (+ |j'?3| (- i?14)) 0)
                             (<= (+ (- |j'?3|) 1) 0)))
                (= (+ |j'?3| (- K?6)) 0) (<= (- K?6) 0) (<= (- |j'?3|) 0)
                (< (- i?14) 0) (<= (+ (- |j'?3|) i?14) 0)
                (= (+ |w'?9| (- |w'?1|)) 0) (= (+ |j'?10| (- |j'?3|)) 0)
                (= (+ |i'?8| (- i?14) -1) 0) (= delta_i (+ |i'?8| (- i?14)))
                (= delta_j (+ |j'?10| (- j?12)))
                (= delta_w (+ |w'?9| (- w?11))))))
(check-sat)
