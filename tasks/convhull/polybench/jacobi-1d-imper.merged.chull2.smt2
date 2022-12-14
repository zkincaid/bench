(declare-const delta_i Int)
(declare-const delta_j Int)
(declare-const delta_t Int)
(assert (exists
         ((|t'?1| Int) (|S1,0?2| Real) (|j'?3| Int) (KSUM1?4 Int)
            (|K1,0?5| Int) (K?6 Int) (|S1,0?7| Real) (|i'?8| Int)
            (KSUM1?9 Int) (|K1,0?10| Int) (K?11 Int) (|i'?12| Int)
            (|j'?13| Int) (j?14 Int) (n?15 Int) (i?16 Int) (tsteps?17 Int)
            (t?18 Int))
         (and (<= (- t?18) 0) (< (+ (- tsteps?17) t?18) 0) (<= (- K?11) 0)
                (<= (- |K1,0?10|) 0) (= (+ |K1,0?10| (- K?11)) 0)
                (<= (+ KSUM1?9 (- K?11)) 0)
                (= (+ (- |S1,0?7|) |i'?8| (- |K1,0?10|)) 0)
                (= (+ (- KSUM1?9) |K1,0?10|) 0) (= (+ |S1,0?7| -1) 0)
                (or (and (= K?11 0) (= (+ (- |i'?8|) 1) 0))
                      (and (<= (+ (- K?11) 1) 0) (<= (+ (- n?15) 3) 0)
                             (<= (+ (- n?15) |i'?8| 1) 0)
                             (<= (+ (- |i'?8|) 2) 0)))
                (= (+ |i'?8| (- K?11) -1) 0) (<= (- K?11) 0) (< (- |i'?8|) 0)
                (<= (+ n?15 (- |i'?8|) -1) 0) (<= (- K?6) 0)
                (<= (- |K1,0?5|) 0) (= (+ |K1,0?5| (- K?6)) 0)
                (<= (+ KSUM1?4 (- K?6)) 0)
                (= (+ (- |S1,0?2|) |j'?3| (- |K1,0?5|)) 0)
                (= (+ (- KSUM1?4) |K1,0?5|) 0) (= (+ |S1,0?2| -1) 0)
                (or (and (= K?6 0) (= (+ (- |j'?3|) 1) 0))
                      (and (<= (+ (- K?6) 1) 0) (<= (+ (- n?15) 3) 0)
                             (<= (+ |j'?3| (- n?15) 1) 0)
                             (<= (+ (- |j'?3|) 2) 0)))
                (= (+ |j'?3| (- K?6) -1) 0) (<= (- K?6) 0) (< (- |j'?3|) 0)
                (<= (+ (- |j'?3|) n?15 -1) 0) (= (+ |j'?13| (- |j'?3|)) 0)
                (= (+ |i'?12| (- |i'?8|)) 0) (= (+ |t'?1| (- t?18) -1) 0)
                (= delta_t (+ |t'?1| (- t?18)))
                (= delta_i (+ |i'?12| (- i?16)))
                (= delta_j (+ |j'?13| (- j?14))))))
(check-sat)
