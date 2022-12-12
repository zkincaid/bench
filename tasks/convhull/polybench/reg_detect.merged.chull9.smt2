(declare-const delta_i Int)
(declare-const delta_cnt Int)
(declare-const delta_t Int)
(declare-const delta_j Int)
(assert (exists
         ((|t'?1| Int) (|i'?2| Int) (|S1,0?3| Real) (|j'?4| Int)
            (KSUM1?5 Int) (|K1,0?6| Int) (K?7 Int) (|S1,0?8| Real)
            (|i'?9| Int) (KSUM1?10 Int) (|K1,0?11| Int) (K?12 Int)
            (|i'?13| Int) (|cnt'?14| Int) (|S1,0?15| Real) (|j'?16| Int)
            (KSUM1?17 Int) (|K1,0?18| Int) (K?19 Int) (|i'?20| Int)
            (|cnt'?21| Int) (|S1,0?22| Real) (|j'?23| Int) (KSUM1?24 Int)
            (|K1,0?25| Int) (K?26 Int) (|cnt'?27| Int) (|j'?28| Int)
            (|i'?29| Int) (length?30 Int) (cnt?31 Int) (i?32 Int)
            (maxgrid?33 Int) (j?34 Int) (niter?35 Int) (t?36 Int))
         (and (<= (- t?36) 0) (< (+ (- niter?35) t?36) 0) (<= (- K?26) 0)
                (<= (- |K1,0?25|) 0) (= (+ |K1,0?25| (- K?26)) 0)
                (<= (+ KSUM1?24 (- K?26)) 0)
                (= (+ (- |S1,0?22|) |j'?23| (- |K1,0?25|)) 0)
                (= (+ (- KSUM1?24) |K1,0?25|) 0) (= |S1,0?22| 0)
                (or (and (= K?26 0) (= (+ (- |cnt'?21|) cnt?31) 0)
                           (= (- |j'?23|) 0) (= (+ (- |i'?20|) i?32) 0))
                      (and (<= (+ (- K?26) 1) 0) (<= (+ (- maxgrid?33) 1) 0)
                             (= (+ (- maxgrid?33) |i'?20|) 0)
                             (<= (+ (- |j'?23|) 1) 0)
                             (<= (+ length?30 (- |cnt'?21|)) 0)
                             (<= (- |cnt'?21|) 0)
                             (<= (+ (- maxgrid?33) |j'?23|) 0)))
                (= (+ |j'?23| (- K?26)) 0) (<= (- K?26) 0) (<= (- |j'?23|) 0)
                (< (+ maxgrid?33 (- |j'?23|) -1) 0) (<= (- K?19) 0)
                (<= (- |K1,0?18|) 0) (= (+ |K1,0?18| (- K?19)) 0)
                (<= (+ KSUM1?17 (- K?19)) 0)
                (= (+ (- |S1,0?15|) |j'?16| (- |K1,0?18|)) 0)
                (= (+ (- KSUM1?17) |K1,0?18|) 0) (= |S1,0?15| 0)
                (or (and (= K?19 0) (= (+ (- |cnt'?14|) |cnt'?21|) 0)
                           (= (- |j'?16|) 0) (= (+ (- |i'?13|) |i'?20|) 0))
                      (and (<= (+ (- K?19) 1) 0) (<= (+ (- maxgrid?33) 1) 0)
                             (= (+ |i'?13| (- maxgrid?33)) 0)
                             (<= (+ (- |cnt'?14|) length?30) 0)
                             (<= (+ (- |j'?16|) 1) 0)
                             (<= (+ (- |cnt'?14|) 1) 0)
                             (<= (+ |j'?16| (- maxgrid?33)) 0)))
                (= (+ |j'?16| (- K?19)) 0) (<= (- K?19) 0) (<= (- |j'?16|) 0)
                (< (+ (- |j'?16|) maxgrid?33 -1) 0) (<= (- K?12) 0)
                (<= (- |K1,0?11|) 0) (= (+ |K1,0?11| (- K?12)) 0)
                (<= (+ KSUM1?10 (- K?12)) 0)
                (= (+ (- |S1,0?8|) |i'?9| (- |K1,0?11|)) 0)
                (= (+ (- KSUM1?10) |K1,0?11|) 0) (= |S1,0?8| 0)
                (or (and (= K?12 0) (= (- |i'?9|) 0))
                      (and (<= (+ (- K?12) 1) 0) (<= (+ (- maxgrid?33) 1) 0)
                             (<= (+ |i'?9| (- maxgrid?33)) 0)
                             (<= (+ (- |i'?9|) 1) 0)))
                (= (+ |i'?9| (- K?12)) 0) (<= (- K?12) 0) (<= (- |i'?9|) 0)
                (< (+ (- |i'?9|) maxgrid?33 -1) 0) (<= (- K?7) 0)
                (<= (- |K1,0?6|) 0) (= (+ |K1,0?6| (- K?7)) 0)
                (<= (+ KSUM1?5 (- K?7)) 0)
                (= (+ (- |S1,0?3|) |j'?4| (- |K1,0?6|)) 0)
                (= (+ (- KSUM1?5) |K1,0?6|) 0) (= (+ |S1,0?3| -1) 0)
                (or (and (= K?7 0) (= (+ (- |j'?4|) 1) 0)
                           (= (+ (- |i'?2|) |i'?9|) 0))
                      (and (<= (+ (- K?7) 1) 0) (<= (+ (- maxgrid?33) 2) 0)
                             (<= (- |i'?9|) 0)
                             (= (+ (- |i'?2|) maxgrid?33) 0)
                             (<= (+ (- |j'?4|) 2) 0)
                             (<= (+ (- |i'?2|) |j'?4|) 0)))
                (= (+ |j'?4| (- K?7) -1) 0) (<= (- K?7) 0) (<= (- |i'?2|) 0)
                (< (- |j'?4|) 0) (< (+ (- |j'?4|) maxgrid?33 -1) 0)
                (= (+ |cnt'?27| (- |cnt'?14|)) 0)
                (= (+ |j'?28| (- |j'?4|)) 0) (= (+ |i'?29| (- |i'?2|)) 0)
                (= (+ |t'?1| (- t?36) -1) 0) (= delta_t (+ |t'?1| (- t?36)))
                (= delta_i (+ |i'?29| (- i?32)))
                (= delta_j (+ |j'?28| (- j?34)))
                (= delta_cnt (+ |cnt'?27| (- cnt?31))))))
(check-sat)
