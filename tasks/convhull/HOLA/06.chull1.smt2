(declare-const delta_tmp___0 Int)
(declare-const delta_tmp Int)
(declare-const delta_z Int)
(declare-const delta_y Int)
(declare-const delta_w Int)
(declare-const delta_x Int)
(assert (exists
         ((|tmp___0'?1| Int) (|z'?2| Int) (|w'?3| Int) (havoc?4 Int)
            (phi_tmp?5 Int) (|tmp'?6| Int) (|S4,0?7| Real) (|S3,1?8| Real)
            (|S3,0?9| Real) (|S2,0?10| Real) (|S1,0?11| Real) (|y'?12| Int)
            (|x'?13| Int) (KSUM4?14 Int) (KSUM3?15 Int) (KSUM2?16 Int)
            (KSUM1?17 Int) (R4?18 Int) (R2?19 Int) (R1?20 Int)
            (|K4,0?21| Int) (|K3,1?22| Int) (|K3,0?23| Int) (|K1,1?24| Int)
            (K?25 Int) (havoc?26 Int) (|tmp'?27| Int) (|y'?28| Int)
            (|x'?29| Int) (x?30 Int) (y?31 Int) (tmp?32 Int) (z?33 Int)
            (w?34 Int) (tmp___0?35 Int))
         (and (<= (- x?30) 0) (<= (- y?31) 0) (<= (- z?33) 0) (< (- w?34) 0)
                (= (+ (- w?34) (* 2 x?30) 1) 0)
                (= (+ (- w?34) (* 2 y?31) 1) 0) (= (+ (- w?34) z?33 1) 0)
                (< (+ z?33 -100000) 0) (< (+ w?34 -100000) 0)
                (or (< havoc?26 0) (< 0 havoc?26)) (<= (- K?25) 0)
                (<= (- |K1,1?24|) 0) (<= (- |K3,0?23|) 0)
                (<= (- |K3,1?22|) 0) (<= (- |K4,0?21|) 0)
                (or (and (= (+ |K1,1?24| (- K?25)) 0) (= (+ R1?20 1) 0))
                      (and (or (< (+ |K1,1?24| (- K?25)) 0)
                                 (< 0 (+ |K1,1?24| (- K?25))))
                             (or (< (+ R1?20 1) 0) (< 0 (+ R1?20 1)))))
                (or (and (= (- K?25) 0) (= (+ R2?19 1) 0))
                      (and (or (< (- K?25) 0) (< 0 (- K?25)))
                             (or (< (+ R2?19 1) 0) (< 0 (+ R2?19 1)))))
                (= (+ |K3,1?22| |K3,0?23| (- K?25)) 0)
                (or (and (= (+ |K4,0?21| (- K?25)) 0) (= (+ R4?18 1) 0))
                      (and (or (< (+ |K4,0?21| (- K?25)) 0)
                                 (< 0 (+ |K4,0?21| (- K?25))))
                             (or (< (+ R4?18 1) 0) (< 0 (+ R4?18 1)))))
                (or (<= (+ (- |K3,1?22|) |K1,1?24|) 0)
                      (and (= |K3,0?23| 0) (<= (+ |K3,1?22| (- |K1,1?24|)) 0)))
                (or (= |K1,1?24| 0) (= |K4,0?21| 0))
                (or (and (<= (+ (- |K4,0?21|) |K3,0?23|) 0) (= |K3,1?22| 0))
                      (<= (+ |K4,0?21| (- |K3,0?23|)) 0))
                (or (and (= (+ (- KSUM2?16) KSUM1?17) 0)
                           (= (+ (- R2?19) R1?20) 0))
                      (and (or (< (+ (- KSUM2?16) KSUM1?17) 0)
                                 (< 0 (+ (- KSUM2?16) KSUM1?17)))
                             (or (< (+ (- R2?19) R1?20) 0)
                                   (< 0 (+ (- R2?19) R1?20)))))
                (or (and (= (+ (- KSUM3?15) KSUM1?17) 0) (= (+ R1?20 1) 0))
                      (and (or (< (+ (- KSUM3?15) KSUM1?17) 0)
                                 (< 0 (+ (- KSUM3?15) KSUM1?17)))
                             (or (< (+ R1?20 1) 0) (< 0 (+ R1?20 1)))))
                (or (and (= (+ (- KSUM4?14) KSUM1?17) 0)
                           (= (+ (- R4?18) R1?20) 0))
                      (and (or (< (+ (- KSUM4?14) KSUM1?17) 0)
                                 (< 0 (+ (- KSUM4?14) KSUM1?17)))
                             (or (< (+ (- R4?18) R1?20) 0)
                                   (< 0 (+ (- R4?18) R1?20)))))
                (or (and (= (+ (- KSUM3?15) KSUM2?16) 0) (= (+ R2?19 1) 0))
                      (and (or (< (+ (- KSUM3?15) KSUM2?16) 0)
                                 (< 0 (+ (- KSUM3?15) KSUM2?16)))
                             (or (< (+ R2?19 1) 0) (< 0 (+ R2?19 1)))))
                (or (and (= (+ (- KSUM4?14) KSUM2?16) 0)
                           (= (+ (- R4?18) R2?19) 0))
                      (and (or (< (+ (- KSUM4?14) KSUM2?16) 0)
                                 (< 0 (+ (- KSUM4?14) KSUM2?16)))
                             (or (< (+ (- R4?18) R2?19) 0)
                                   (< 0 (+ (- R4?18) R2?19)))))
                (or (and (= (+ (- KSUM4?14) KSUM3?15) 0)
                           (= (+ (- R4?18) -1) 0))
                      (and (or (< (+ (- KSUM4?14) KSUM3?15) 0)
                                 (< 0 (+ (- KSUM4?14) KSUM3?15)))
                             (or (< (+ (- R4?18) -1) 0)
                                   (< 0 (+ (- R4?18) -1)))))
                (<= (+ KSUM1?17 (- K?25)) 0) (<= (+ KSUM2?16 (- K?25)) 0)
                (<= (+ KSUM3?15 (- K?25)) 0) (<= (+ KSUM4?14 (- K?25)) 0)
                (= (+ (- |S1,0?11|) (- |y'?12|) |x'?13|) 0)
                (= (+ (- |S2,0?10|) (- |y'?12|) |x'?13|) 0)
                (= (+ (- |S3,0?9|) |x'?13| (- |K3,0?23|)) 0)
                (= (+ (- |S3,1?8|) |y'?12| (- |K3,0?23|)) 0)
                (= (+ (- |S4,0?7|) (- |y'?12|) |x'?13|) 0)
                (= (+ (- KSUM1?17) |K1,1?24|) 0) (= (- KSUM2?16) 0)
                (= (+ (- KSUM3?15) |K3,1?22| |K3,0?23|) 0)
                (= (+ (- KSUM4?14) |K4,0?21|) 0)
                (or (and (= (+ |S1,0?11| y?31 (- x?30)) 0) (= (+ R1?20 1) 0))
                      (and (= |S1,0?11| 0) (<= 0 (+ (- KSUM2?16) KSUM1?17))
                             (or (<= 0 (+ (- KSUM3?15) KSUM1?17))
                                   (<= (+ (- |K3,0?23|) 1) 0))
                             (or (<= 0 (+ (- KSUM4?14) KSUM1?17))
                                   (<= (+ (- |K4,0?21|) 1) 0)) (= R1?20 0)))
                (or (and (= (+ |S2,0?10| y?31 (- x?30)) 0) (= (+ R2?19 1) 0))
                      (and (= |S2,0?10| 0) (<= 0 (+ KSUM2?16 (- KSUM1?17)))
                             (or (<= 0 (+ (- KSUM3?15) KSUM2?16))
                                   (<= (+ (- |K3,0?23|) 1) 0))
                             (or (<= 0 (+ (- KSUM4?14) KSUM2?16))
                                   (<= (+ (- |K4,0?21|) 1) 0)) (= R2?19 0))
                      (and (= |S2,0?10| 0)
                             (or (<= 0 (+ KSUM2?16 (- KSUM1?17)))
                                   (<= (+ (- |K1,1?24|) 1) 0))
                             (or (<= 0 (+ (- KSUM3?15) KSUM2?16))
                                   (<= (+ (- |K3,1?22|) 1) 0))
                             (<= 0 (+ (- KSUM4?14) KSUM2?16))
                             (= (+ R2?19 -1) 0))) (= (+ |S3,0?9| (- x?30)) 0)
                (= (+ |S3,1?8| (- y?31)) 0)
                (or (and (= (+ |S4,0?7| y?31 (- x?30)) 0) (= (+ R4?18 1) 0))
                      (and (= |S4,0?7| 0)
                             (or (<= 0 (+ KSUM4?14 (- KSUM1?17)))
                                   (<= (+ (- |K1,1?24|) 1) 0))
                             (<= 0 (+ KSUM4?14 (- KSUM2?16)))
                             (or (<= 0 (+ KSUM4?14 (- KSUM3?15)))
                                   (<= (+ (- |K3,1?22|) 1) 0))
                             (= (+ R4?18 -1) 0)))
                (or (and (= K?25 0) (= (+ (- |tmp'?6|) tmp?32) 0)
                           (= (+ (- |y'?12|) y?31) 0)
                           (= (+ (- |x'?13|) x?30) 0))
                      (and (<= (+ (- K?25) 1) 0) (= (+ (- w?34) z?33 1) 0)
                             (= (+ (- y?31) x?30) 0)
                             (= (+ (mod w?34 2) (mod z?33 2) -1) 0)
                             (<= (+ y?31 -99999) 0)
                             (<= (+ (mod z?33 2) -1) 0)
                             (<= (- (mod z?33 2)) 0) (<= (- y?31) 0)
                             (<= (+ (- w?34) 1) 0) (= (+ (- w?34) z?33 1) 0)
                             (= (+ |y'?12| (- |x'?13|)) 0)
                             (= (+ (mod w?34 2) (mod z?33 2) -1) 0)
                             (<= (+ (mod z?33 2) |x'?13| -100000) 0)
                             (<= (+ (mod z?33 2) -1) 0)
                             (<= (- (mod z?33 2)) 0)
                             (<= (+ (- (mod z?33 2)) (- |x'?13|) 1) 0)
                             (<= (+ (- w?34) 1) 0)))
                (= (+ (- |y'?12|) |x'?13| y?31 (- x?30)) 0)
                (<= (+ |y'?12| (- K?25) (- y?31)) 0)
                (<= (+ (- |y'?12|) y?31) 0) (<= (- K?25) 0)
                (or (and (or (and (<= (- |x'?13|) 0) (<= (- |y'?12|) 0)
                                    (<= (- z?33) 0) (< (- w?34) 0)
                                    (= (+ (- w?34) z?33 1) 0)
                                    (= (+ (- |y'?12|) |x'?13|) 0)
                                    (<= (+ (- |x'?13|) 100000) 0))
                               (and (<= (- |x'?13|) 0) (<= (- |y'?12|) 0)
                                      (<= (- z?33) 0) (< (- w?34) 0)
                                      (= (+ (- w?34) z?33 1) 0)
                                      (= (+ (- |y'?12|) |x'?13|) 0)
                                      (< (+ |x'?13| -100000) 0)
                                      (<= (+ (- |y'?12|) 100000) 0)))
                           (= (+ (- phi_tmp?5) |tmp'?6|) 0))
                      (and (<= (- |x'?13|) 0) (<= (- |y'?12|) 0)
                             (<= (- z?33) 0) (< (- w?34) 0)
                             (= (+ (- w?34) z?33 1) 0)
                             (= (+ (- |y'?12|) |x'?13|) 0)
                             (< (+ |x'?13| -100000) 0)
                             (< (+ |y'?12| -100000) 0) (= havoc?4 0)
                             (= (+ havoc?4 (- phi_tmp?5)) 0)))
                (= (+ |tmp___0'?1| (- havoc?26)) 0)
                (= (+ |tmp'?27| (- phi_tmp?5)) 0)
                (= (+ |y'?28| (- |y'?12|)) 0) (= (+ |x'?29| (- |x'?13|)) 0)
                (= (+ |z'?2| (- |y'?12|) (- |x'?13|)) 0)
                (= (+ |w'?3| (- |y'?12|) (- |x'?13|) -1) 0)
                (= delta_w (+ |w'?3| (- w?34)))
                (= delta_z (+ |z'?2| (- z?33)))
                (= delta_x (+ |x'?29| (- x?30)))
                (= delta_y (+ |y'?28| (- y?31)))
                (= delta_tmp (+ |tmp'?27| (- tmp?32)))
                (= delta_tmp___0 (+ |tmp___0'?1| (- tmp___0?35))))))
(check-sat)
