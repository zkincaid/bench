(declare-const delta_j2 Int)
(declare-const delta_i Int)
(assert (exists
         ((|j2'?1| Int) (|S1,0?2| Real) (|i'?3| Int) (KSUM1?4 Int)
            (|K1,0?5| Int) (K?6 Int) (|i'?7| Int) (j2?8 Int) (n?9 Int)
            (i?10 Int) (m?11 Int))
         (and (< (- j2?8) 0) (<= (- i?10) 0) (< (- m?11) 0)
                (< (+ (- m?11) j2?8) 0) (<= (- K?6) 0) (<= (- |K1,0?5|) 0)
                (= (+ |K1,0?5| (- K?6)) 0) (<= (+ KSUM1?4 (- K?6)) 0)
                (= (+ (- |S1,0?2|) |i'?3| (- |K1,0?5|)) 0)
                (= (+ (- KSUM1?4) |K1,0?5|) 0) (= |S1,0?2| 0)
                (or (and (= K?6 0) (= (- |i'?3|) 0))
                      (and (<= (+ (- K?6) 1) 0) (<= (+ (- n?9) 1) 0)
                             (<= (+ (- n?9) |i'?3|) 0)
                             (<= (+ (- |i'?3|) 1) 0)))
                (= (+ |i'?3| (- K?6)) 0) (<= (- K?6) 0) (<= (- |i'?3|) 0)
                (<= (+ n?9 (- |i'?3|)) 0) (= (+ |j2'?1| (- j2?8) -1) 0)
                (= (+ |i'?7| (- |i'?3|)) 0) (= delta_i (+ |i'?7| (- i?10)))
                (= delta_j2 (+ |j2'?1| (- j2?8))))))
(check-sat)
