(declare-const delta_flag Int)
(declare-const delta_n Int)
(declare-const delta___cost Int)
(assert (exists
         ((|S2,0?1| Real) (|flag'?2| Int) (|S1,1?3| Real) (|n'?4| Int)
            (|S1,0?5| Real) (|__cost'?6| Int) (KSUM2?7 Int) (KSUM1?8 Int)
            (R2?9 Int) (|K1,0?10| Int) (K?11 Int) (|n'?12| Int)
            (|flag'?13| Int) (|__cost'?14| Int) (n?15 Int) (flag?16 Int)
            (__cost?17 Int))
         (and (<= (- flag?16) 0) (< (- flag?16) 0) (<= (- K?11) 0)
                (<= (- |K1,0?10|) 0) (= (+ |K1,0?10| (- K?11)) 0)
                (or (and (= (- K?11) 0) (= (+ R2?9 1) 0))
                      (and (or (< (- K?11) 0) (< 0 (- K?11)))
                             (or (< (+ R2?9 1) 0) (< 0 (+ R2?9 1)))))
                (or (and (= (+ (- KSUM2?7) KSUM1?8) 0) (= (+ (- R2?9) -1) 0))
                      (and (or (< (+ (- KSUM2?7) KSUM1?8) 0)
                                 (< 0 (+ (- KSUM2?7) KSUM1?8)))
                             (or (< (+ (- R2?9) -1) 0) (< 0 (+ (- R2?9) -1)))))
                (<= (+ KSUM1?8 (- K?11)) 0) (<= (+ KSUM2?7 (- K?11)) 0)
                (= (+ (- |S1,0?5|) |__cost'?6| (- |K1,0?10|)) 0)
                (= (+ (- |S1,1?3|) |n'?4| |K1,0?10|) 0)
                (= (+ (- |S2,0?1|) |flag'?2|) 0)
                (= (+ (- KSUM1?8) |K1,0?10|) 0) (= (- KSUM2?7) 0)
                (= (+ (- __cost?17) |S1,0?5|) 0) (= (+ (- n?15) |S1,1?3|) 0)
                (or (and (= |S2,0?1| 0) (= (+ R2?9 1) 0))
                      (and (= (+ |S2,0?1| -1) 0)
                             (or (<= 0 (+ KSUM2?7 (- KSUM1?8)))
                                   (<= (+ (- |K1,0?10|) 1) 0)) (= R2?9 0)))
                (or (and (= K?11 0) (= (+ n?15 (- |n'?4|)) 0)
                           (= (- |flag'?2|) 0)
                           (= (+ __cost?17 (- |__cost'?6|)) 0))
                      (and (<= (+ (- K?11) 1) 0) (<= (+ (- n?15) 1) 0)
                             (<= (- __cost?17) 0) (= (+ |flag'?2| -1) 0)
                             (<= (- |n'?4|) 0) (<= (+ (- |__cost'?6|) 1) 0)))
                (= (+ (- __cost?17) |__cost'?6| (- K?11)) 0)
                (= (+ (- n?15) |n'?4| K?11) 0) (<= (+ |flag'?2| (- K?11)) 0)
                (<= (- K?11) 0) (<= (- |flag'?2|) 0) (<= |n'?4| 0)
                (= (+ |n'?12| (- |n'?4|)) 0)
                (= (+ |flag'?13| (- |flag'?2|)) 0)
                (= (+ |__cost'?14| (- |__cost'?6|)) 0)
                (= delta___cost (+ |__cost'?14| (- __cost?17)))
                (= delta_flag (+ |flag'?13| (- flag?16)))
                (= delta_n (+ |n'?12| (- n?15))))))
(check-sat)
