(declare-const delta_t Int)
(declare-const delta_i2 Int)
(declare-const delta_i1 Int)
(assert (exists
         ((|t'?1| Int) (|i2'?2| Int) (|S1,0?3| Real) (|i1'?4| Int)
            (KSUM1?5 Int) (|K1,0?6| Int) (K?7 Int) (|S1,0?8| Real)
            (|i2'?9| Int) (KSUM1?10 Int) (|K1,0?11| Int) (K?12 Int)
            (|i2'?13| Int) (|S1,0?14| Real) (|i1'?15| Int) (KSUM1?16 Int)
            (|K1,0?17| Int) (K?18 Int) (|i2'?19| Int) (|S1,0?20| Real)
            (|i1'?21| Int) (KSUM1?22 Int) (|K1,0?23| Int) (K?24 Int)
            (|S1,0?25| Real) (|i1'?26| Int) (KSUM1?27 Int) (|K1,0?28| Int)
            (K?29 Int) (|i2'?30| Int) (|S1,0?31| Real) (|i1'?32| Int)
            (KSUM1?33 Int) (|K1,0?34| Int) (K?35 Int) (|i1'?36| Int)
            (|i2'?37| Int) (i2?38 Int) (n?39 Int) (i1?40 Int) (tsteps?41 Int)
            (t?42 Int))
         (and (<= (- t?42) 0) (< (+ (- tsteps?41) t?42) 0) (<= (- K?35) 0)
                (<= (- |K1,0?34|) 0) (= (+ |K1,0?34| (- K?35)) 0)
                (<= (+ KSUM1?33 (- K?35)) 0)
                (= (+ (- |S1,0?31|) |i1'?32| (- |K1,0?34|)) 0)
                (= (+ (- KSUM1?33) |K1,0?34|) 0) (= |S1,0?31| 0)
                (or (and (= K?35 0) (= (+ (- |i2'?30|) i2?38) 0)
                           (= (- |i1'?32|) 0))
                      (and (<= (+ (- K?35) 1) 0) (<= (+ (- n?39) 1) 0)
                             (= (+ n?39 (- |i2'?30|)) 0)
                             (<= (+ (- |i1'?32|) 1) 0)
                             (<= (+ (- |i2'?30|) |i1'?32|) 0)))
                (= (+ |i1'?32| (- K?35)) 0) (<= (- K?35) 0)
                (<= (- |i1'?32|) 0) (<= (+ n?39 (- |i1'?32|)) 0)
                (<= (- K?29) 0) (<= (- |K1,0?28|) 0)
                (= (+ |K1,0?28| (- K?29)) 0) (<= (+ KSUM1?27 (- K?29)) 0)
                (= (+ (- |S1,0?25|) |i1'?26| (- |K1,0?28|)) 0)
                (= (+ (- KSUM1?27) |K1,0?28|) 0) (= |S1,0?25| 0)
                (or (and (= K?29 0) (= (- |i1'?26|) 0))
                      (and (<= (+ (- K?29) 1) 0) (<= (+ (- n?39) 1) 0)
                             (<= (+ |i1'?26| (- n?39)) 0)
                             (<= (+ (- |i1'?26|) 1) 0)))
                (= (+ |i1'?26| (- K?29)) 0) (<= (- K?29) 0)
                (<= (- |i1'?26|) 0) (<= (+ (- |i1'?26|) n?39) 0)
                (<= (- K?24) 0) (<= (- |K1,0?23|) 0)
                (= (+ |K1,0?23| (- K?24)) 0) (<= (+ KSUM1?22 (- K?24)) 0)
                (= (+ (- |S1,0?20|) |i1'?21| (- |K1,0?23|)) 0)
                (= (+ (- KSUM1?22) |K1,0?23|) 0) (= |S1,0?20| 0)
                (or (and (= K?24 0) (= (+ (- |i2'?19|) |i2'?30|) 0)
                           (= (- |i1'?21|) 0))
                      (and (<= (+ (- K?24) 1) 0) (<= (+ (- n?39) 1) 0)
                             (<= (+ |i1'?21| (- n?39)) 0)
                             (<= (+ (- |i2'?19|) n?39 -2) 0)
                             (<= (- |i2'?19|) 0)
                             (<= (+ |i2'?19| (- n?39) 1) 0)
                             (<= (+ (- |i1'?21|) 1) 0)))
                (= (+ |i1'?21| (- K?24)) 0) (<= (- K?24) 0)
                (<= (- |i1'?21|) 0) (<= (+ (- |i1'?21|) n?39) 0)
                (<= (- K?18) 0) (<= (- |K1,0?17|) 0)
                (= (+ |K1,0?17| (- K?18)) 0) (<= (+ KSUM1?16 (- K?18)) 0)
                (= (+ (- |S1,0?14|) |i1'?15| (- |K1,0?17|)) 0)
                (= (+ (- KSUM1?16) |K1,0?17|) 0) (= (+ |S1,0?14| -1) 0)
                (or (and (= K?18 0) (= (+ (- |i2'?13|) |i2'?19|) 0)
                           (= (+ (- |i1'?15|) 1) 0))
                      (and (<= (+ (- K?18) 1) 0) (<= (+ (- n?39) 2) 0)
                             (= (+ |i2'?13| (- n?39)) 0)
                             (<= (+ (- |i1'?15|) 2) 0)
                             (<= (+ |i1'?15| (- n?39)) 0)))
                (= (+ |i1'?15| (- K?18) -1) 0) (<= (- K?18) 0)
                (< (- |i1'?15|) 0) (<= (+ (- |i1'?15|) n?39) 0)
                (<= (- K?12) 0) (<= (- |K1,0?11|) 0)
                (= (+ |K1,0?11| (- K?12)) 0) (<= (+ KSUM1?10 (- K?12)) 0)
                (= (+ (- |S1,0?8|) |i2'?9| (- |K1,0?11|)) 0)
                (= (+ (- KSUM1?10) |K1,0?11|) 0) (= |S1,0?8| 0)
                (or (and (= K?12 0) (= (- |i2'?9|) 0))
                      (and (<= (+ (- K?12) 1) 0) (<= (+ (- n?39) 1) 0)
                             (<= (+ |i2'?9| (- n?39)) 0)
                             (<= (+ (- |i2'?9|) 1) 0)))
                (= (+ |i2'?9| (- K?12)) 0) (<= (- K?12) 0) (<= (- |i2'?9|) 0)
                (<= (+ (- |i2'?9|) n?39) 0) (<= (- K?7) 0)
                (<= (- |K1,0?6|) 0) (= (+ |K1,0?6| (- K?7)) 0)
                (<= (+ KSUM1?5 (- K?7)) 0)
                (= (+ (- |S1,0?3|) |i1'?4| (- |K1,0?6|)) 0)
                (= (+ (- KSUM1?5) |K1,0?6|) 0) (= |S1,0?3| 0)
                (or (and (= K?7 0) (= (+ (- |i2'?2|) |i2'?9|) 0)
                           (= (- |i1'?4|) 0))
                      (and (<= (+ (- K?7) 1) 0) (<= (+ (- n?39) 3) 0)
                             (<= (- |i2'?9|) 0) (= (+ |i2'?2| (- n?39)) 0)
                             (<= (+ (- |i1'?4|) 1) 0)
                             (<= (+ |i1'?4| (- n?39) 2) 0)))
                (= (+ |i1'?4| (- K?7)) 0) (<= (- K?7) 0) (<= (- |i2'?2|) 0)
                (<= (- |i1'?4|) 0) (<= (+ (- |i1'?4|) n?39 -2) 0)
                (= (+ |i2'?37| (- |i2'?2|)) 0) (= (+ |i1'?36| (- |i1'?4|)) 0)
                (= (+ |t'?1| (- t?42) -1) 0) (= delta_t (+ |t'?1| (- t?42)))
                (= delta_i1 (+ |i1'?36| (- i1?40)))
                (= delta_i2 (+ |i2'?37| (- i2?38))))))
(check-sat)
