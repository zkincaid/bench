(declare-const delta_tmp___0 Int)
(declare-const delta_tmp Int)
(declare-const delta_d Int)
(declare-const delta_c Int)
(declare-const delta_x Int)
(declare-const delta_y Int)
(declare-const delta_b Int)
(declare-const delta_a Int)
(assert (exists
         ((|tmp___0'?1| Int) (|y'?2| Int) (|x'?3| Int) (|d'?4| Int)
            (|a'?5| Int) (havoc?6 Int) (|tmp'?7| Int) (|S2,0?8| Real)
            (|S1,1?9| Real) (|c'?10| Int) (|S1,0?11| Real) (|b'?12| Int)
            (KSUM2?13 Int) (KSUM1?14 Int) (R2?15 Int) (|K1,0?16| Int)
            (K?17 Int) (phi_d?18 Int) (phi_a?19 Int) (havoc?20 Int)
            (|tmp'?21| Int) (|c'?22| Int) (|b'?23| Int) (tmp?24 Int)
            (x?25 Int) (y?26 Int) (b?27 Int) (d?28 Int) (a?29 Int) (c?30 Int)
            (tmp___0?31 Int))
         (and (< (- d?28) 0) (< (- a?29) 0) (= (+ b?27 (- c?30) 1) 0)
                (= (+ (- a?29) d?28 -1) 0) (= (+ x?25 (- y?26)) 0)
                (or (< havoc?20 0) (< 0 havoc?20))
                (or (and (= (mod (+ b?27 c?30 a?29 d?28) 2) 0)
                           (= (+ (- phi_a?19) a?29 1) 0)
                           (= (+ (- phi_d?18) d?28 1) 0))
                      (and (or (< (mod (+ b?27 c?30 a?29 d?28) 2) 0)
                                 (< 0 (mod (+ b?27 c?30 a?29 d?28) 2)))
                             (= (+ (- phi_a?19) a?29 -1) 0)
                             (= (+ (- phi_d?18) d?28) 0))) (<= (- K?17) 0)
                (<= (- |K1,0?16|) 0) (= (+ |K1,0?16| (- K?17)) 0)
                (or (and (= (- K?17) 0) (= (+ R2?15 1) 0))
                      (and (or (< (- K?17) 0) (< 0 (- K?17)))
                             (or (< (+ R2?15 1) 0) (< 0 (+ R2?15 1)))))
                (or (and (= (+ (- KSUM2?13) KSUM1?14) 0)
                           (= (+ (- R2?15) -1) 0))
                      (and (or (< (+ (- KSUM2?13) KSUM1?14) 0)
                                 (< 0 (+ (- KSUM2?13) KSUM1?14)))
                             (or (< (+ (- R2?15) -1) 0)
                                   (< 0 (+ (- R2?15) -1)))))
                (<= (+ KSUM1?14 (- K?17)) 0) (<= (+ KSUM2?13 (- K?17)) 0)
                (= (+ (- |S1,0?11|) |b'?12| |K1,0?16|) 0)
                (= (+ (- |S1,1?9|) |c'?10| |K1,0?16|) 0)
                (= (+ (- |S2,0?8|) (- |c'?10|) |b'?12|) 0)
                (= (+ (- KSUM1?14) |K1,0?16|) 0) (= (- KSUM2?13) 0)
                (= (+ |S1,0?11| (- b?27)) 0) (= (+ |S1,1?9| (- c?30)) 0)
                (or (and (= (+ |S2,0?8| (- b?27) c?30) 0) (= (+ R2?15 1) 0))
                      (and (= (+ |S2,0?8| 1) 0)
                             (or (<= 0 (+ KSUM2?13 (- KSUM1?14)))
                                   (<= (+ (- |K1,0?16|) 1) 0)) (= R2?15 0)))
                (or (and (= K?17 0) (= (+ (- |tmp'?7|) tmp?24) 0)
                           (= (+ (- |c'?10|) c?30) 0)
                           (= (+ (- |b'?12|) b?27) 0))
                      (and (<= (+ (- K?17) 1) 0) (= (+ (- b?27) c?30 -1) 0)
                             (= (+ |c'?10| (- |b'?12|) -1) 0)))
                (= (+ |b'?12| K?17 (- b?27)) 0)
                (= (+ |c'?10| K?17 (- c?30)) 0) (<= (- K?17) 0)
                (= (+ (- |c'?10|) |b'?12| 1) 0) (= havoc?6 0)
                (= (+ |tmp___0'?1| (- havoc?20)) 0)
                (= (+ |tmp'?21| (- havoc?6)) 0)
                (= (+ |y'?2| (- b?27) (- d?28)) 0)
                (= (+ |x'?3| (- c?30) (- a?29)) 0)
                (= (+ |d'?4| (- phi_d?18)) 0) (= (+ |c'?22| (- |c'?10|)) 0)
                (= (+ |b'?23| (- |b'?12|)) 0) (= (+ |a'?5| (- phi_a?19)) 0)
                (= delta_a (+ |a'?5| (- a?29)))
                (= delta_b (+ |b'?23| (- b?27)))
                (= delta_c (+ |c'?22| (- c?30)))
                (= delta_d (+ |d'?4| (- d?28)))
                (= delta_x (+ |x'?3| (- x?25)))
                (= delta_y (+ |y'?2| (- y?26)))
                (= delta_tmp (+ |tmp'?21| (- tmp?24)))
                (= delta_tmp___0 (+ |tmp___0'?1| (- tmp___0?31))))))
(check-sat)
