(declare-const delta_x Int)
(declare-const delta_tmp___0 Int)
(declare-const delta_y Int)
(declare-const delta_z Int)
(declare-const delta_c Int)
(declare-const delta_tmp___2 Int)
(declare-const delta_tmp___1 Int)
(assert (exists
         ((|tmp___2'?1| Int) (|z'?2| Int) (havoc?3 Int) (|tmp___1'?4| Int)
            (|S2,0?5| Real) (|S1,1?6| Real) (|y'?7| Int) (|S1,0?8| Real)
            (|x'?9| Int) (KSUM2?10 Int) (KSUM1?11 Int) (R2?12 Int)
            (|K1,0?13| Int) (K?14 Int) (havoc?15 Int) (|tmp___0'?16| Int)
            (|S2,0?17| Real) (|S1,2?18| Real) (|c'?19| Int) (|S1,1?20| Real)
            (|y'?21| Int) (|S1,0?22| Real) (|x'?23| Int) (KSUM2?24 Int)
            (KSUM1?25 Int) (R2?26 Int) (|K1,0?27| Int) (K?28 Int)
            (havoc?29 Int) (|tmp___0'?30| Int) (|c'?31| Int)
            (|tmp___1'?32| Int) (|y'?33| Int) (|x'?34| Int) (tmp___1?35 Int)
            (z?36 Int) (c?37 Int) (y?38 Int) (x?39 Int) (tmp___0?40 Int)
            (tmp___2?41 Int) (k?42 Int))
         (and (= (+ z?36 (- x?39) (- k?42)) 0) (= (+ y?38 (- x?39)) 0)
                (or (< havoc?29 0) (< 0 havoc?29)) (<= (- K?28) 0)
                (<= (- |K1,0?27|) 0) (= (+ |K1,0?27| (- K?28)) 0)
                (or (and (= (- K?28) 0) (= (+ R2?26 1) 0))
                      (and (or (< (- K?28) 0) (< 0 (- K?28)))
                             (or (< (+ R2?26 1) 0) (< 0 (+ R2?26 1)))))
                (or (and (= (+ (- KSUM2?24) KSUM1?25) 0)
                           (= (+ (- R2?26) -1) 0))
                      (and (or (< (+ (- KSUM2?24) KSUM1?25) 0)
                                 (< 0 (+ (- KSUM2?24) KSUM1?25)))
                             (or (< (+ (- R2?26) -1) 0)
                                   (< 0 (+ (- R2?26) -1)))))
                (<= (+ KSUM1?25 (- K?28)) 0) (<= (+ KSUM2?24 (- K?28)) 0)
                (= (+ (- |S1,0?22|) |x'?23| (- |K1,0?27|)) 0)
                (= (+ (- |S1,1?20|) |y'?21| (- |K1,0?27|)) 0)
                (= (+ (- |S1,2?18|) |c'?19| (- |K1,0?27|)) 0)
                (= (+ (- |S2,0?17|) (- |y'?21|) |x'?23|) 0)
                (= (+ (- KSUM1?25) |K1,0?27|) 0) (= (- KSUM2?24) 0)
                (= (+ |S1,0?22| (- x?39)) 0) (= (+ |S1,1?20| (- y?38)) 0)
                (= |S1,2?18| 0)
                (or (and (= (+ |S2,0?17| y?38 (- x?39)) 0) (= (+ R2?26 1) 0))
                      (and (= |S2,0?17| 0)
                             (or (<= 0 (+ KSUM2?24 (- KSUM1?25)))
                                   (<= (+ (- |K1,0?27|) 1) 0)) (= R2?26 0)))
                (or (and (= K?28 0) (= (+ (- |tmp___0'?16|) tmp___0?40) 0)
                           (= (- |c'?19|) 0) (= (+ (- |y'?21|) y?38) 0)
                           (= (+ (- |x'?23|) x?39) 0))
                      (and (<= (+ (- K?28) 1) 0)
                             (= (+ z?36 (- x?39) (- k?42)) 0)
                             (= (+ y?38 (- x?39)) 0)
                             (= (+ |c'?19| (- |y'?21|) z?36 (- k?42)) 0)
                             (= (+ (- |y'?21|) |x'?23|) 0)
                             (<= (+ (- |c'?19|) 1) 0)))
                (= (+ |x'?23| (- K?28) (- x?39)) 0)
                (= (+ |y'?21| (- K?28) (- y?38)) 0)
                (= (+ |c'?19| (- K?28)) 0) (<= (- K?28) 0) (<= (- |c'?19|) 0)
                (= (+ |c'?19| (- |x'?23|) z?36 (- k?42)) 0)
                (= (+ |y'?21| (- |x'?23|)) 0) (= havoc?15 0) (<= (- K?14) 0)
                (<= (- |K1,0?13|) 0) (= (+ |K1,0?13| (- K?14)) 0)
                (or (and (= (- K?14) 0) (= (+ R2?12 1) 0))
                      (and (or (< (- K?14) 0) (< 0 (- K?14)))
                             (or (< (+ R2?12 1) 0) (< 0 (+ R2?12 1)))))
                (or (and (= (+ (- KSUM2?10) KSUM1?11) 0)
                           (= (+ (- R2?12) -1) 0))
                      (and (or (< (+ (- KSUM2?10) KSUM1?11) 0)
                                 (< 0 (+ (- KSUM2?10) KSUM1?11)))
                             (or (< (+ (- R2?12) -1) 0)
                                   (< 0 (+ (- R2?12) -1)))))
                (<= (+ KSUM1?11 (- K?14)) 0) (<= (+ KSUM2?10 (- K?14)) 0)
                (= (+ (- |S1,0?8|) |x'?9| |K1,0?13|) 0)
                (= (+ (- |S1,1?6|) |y'?7| |K1,0?13|) 0)
                (= (+ (- |S2,0?5|) (- |y'?7|) |x'?9|) 0)
                (= (+ (- KSUM1?11) |K1,0?13|) 0) (= (- KSUM2?10) 0)
                (= (+ |S1,0?8| (- |x'?23|)) 0) (= (+ |S1,1?6| (- |y'?21|)) 0)
                (or (and (= (+ |S2,0?5| |y'?21| (- |x'?23|)) 0)
                           (= (+ R2?12 1) 0))
                      (and (= |S2,0?5| 0)
                             (or (<= 0 (+ KSUM2?10 (- KSUM1?11)))
                                   (<= (+ (- |K1,0?13|) 1) 0)) (= R2?12 0)))
                (or (and (= K?14 0) (= (+ (- |tmp___1'?4|) tmp___1?35) 0)
                           (= (+ (- |y'?7|) |y'?21|) 0)
                           (= (+ (- |x'?9|) |x'?23|) 0))
                      (and (<= (+ (- K?14) 1) 0)
                             (= (+ |y'?21| (- |x'?23|)) 0)
                             (= (+ (- |y'?7|) |x'?9|) 0)))
                (= (+ |x'?9| K?14 (- |x'?23|)) 0)
                (= (+ |y'?7| K?14 (- |y'?21|)) 0) (<= (- K?14) 0)
                (= (+ |y'?7| (- |x'?9|)) 0) (= havoc?3 0)
                (= (+ |tmp___2'?1| (- havoc?29)) 0)
                (= (+ |tmp___1'?32| (- havoc?3)) 0)
                (= (+ |tmp___0'?30| (- havoc?15)) 0)
                (= (+ |c'?31| (- |c'?19|)) 0) (= (+ |y'?33| (- |y'?7|)) 0)
                (= (+ |x'?34| (- |x'?9|)) 0)
                (= (+ |z'?2| (- |y'?7|) (- k?42)) 0)
                (= delta_z (+ |z'?2| (- z?36)))
                (= delta_x (+ |x'?34| (- x?39)))
                (= delta_y (+ |y'?33| (- y?38)))
                (= delta_c (+ |c'?31| (- c?37)))
                (= delta_tmp___0 (+ |tmp___0'?30| (- tmp___0?40)))
                (= delta_tmp___1 (+ |tmp___1'?32| (- tmp___1?35)))
                (= delta_tmp___2 (+ |tmp___2'?1| (- tmp___2?41))))))
(check-sat)
