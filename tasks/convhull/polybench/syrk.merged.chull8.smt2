(declare-const delta_j Int)
(declare-const delta_i Int)
(assert (exists
         ((|i'?1| Int) (|S1,0?2| Real) (|j'?3| Int) (KSUM1?4 Int)
            (|K1,0?5| Int) (K?6 Int) (|j'?7| Int) (j?8 Int) (ni?9 Int)
            (i?10 Int))
         (and (<= (- i?10) 0) (< (+ (- ni?9) i?10) 0) (<= (- K?6) 0)
                (<= (- |K1,0?5|) 0) (= (+ |K1,0?5| (- K?6)) 0)
                (<= (+ KSUM1?4 (- K?6)) 0)
                (= (+ (- |S1,0?2|) |j'?3| (- |K1,0?5|)) 0)
                (= (+ (- KSUM1?4) |K1,0?5|) 0) (= |S1,0?2| 0)
                (or (and (= K?6 0) (= (- |j'?3|) 0))
                      (and (<= (+ (- K?6) 1) 0) (<= (+ (- ni?9) 1) 0)
                             (<= (+ |j'?3| (- ni?9)) 0)
                             (<= (+ (- |j'?3|) 1) 0)))
                (= (+ |j'?3| (- K?6)) 0) (<= (- K?6) 0) (<= (- |j'?3|) 0)
                (< (- ni?9) 0) (<= (+ (- |j'?3|) ni?9) 0)
                (= (+ |j'?7| (- |j'?3|)) 0) (= (+ |i'?1| (- i?10) -1) 0)
                (= delta_i (+ |i'?1| (- i?10)))
                (= delta_j (+ |j'?7| (- j?8))))))
(check-sat)
