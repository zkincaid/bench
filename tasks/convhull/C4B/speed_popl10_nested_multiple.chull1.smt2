(declare-const delta___cost Int)
(declare-const delta_y Int)
(declare-const delta_tmp Int)
(declare-const delta_x Int)
(assert (exists
         ((|x'?1| Int) (havoc?2 Int) (phi_tmp?3 Int) (|tmp'?4| Int)
            (|S1,1?5| Real) (|y'?6| Int) (|S1,0?7| Real) (|__cost'?8| Int)
            (KSUM1?9 Int) (|K1,0?10| Int) (K?11 Int) (|y'?12| Int)
            (|tmp'?13| Int) (|__cost'?14| Int) (m?15 Int) (y?16 Int)
            (tmp?17 Int) (n?18 Int) (x?19 Int) (__cost?20 Int))
         (and (< (+ (- n?18) x?19) 0) (<= (- __cost?20) 0)
                (<= (+ (- __cost?20) -1) 0) (<= (- K?11) 0)
                (<= (- |K1,0?10|) 0) (= (+ |K1,0?10| (- K?11)) 0)
                (<= (+ KSUM1?9 (- K?11)) 0)
                (= (+ (- |S1,0?7|) |__cost'?8| (- |K1,0?10|)) 0)
                (= (+ (- |S1,1?5|) |y'?6| (- |K1,0?10|)) 0)
                (= (+ (- KSUM1?9) |K1,0?10|) 0)
                (= (+ |S1,0?7| (- __cost?20) -1) 0)
                (= (+ (- y?16) |S1,1?5|) 0)
                (or (and (= K?11 0) (= (+ y?16 (- |y'?6|)) 0)
                           (= (+ (- |tmp'?4|) tmp?17) 0)
                           (= (+ (- |__cost'?8|) __cost?20 1) 0))
                      (and (<= (+ (- K?11) 1) 0) (<= (+ (- m?15) y?16 1) 0)
                             (<= (- __cost?20) 0) (<= (+ (- m?15) |y'?6|) 0)
                             (<= (+ (- |__cost'?8|) 2) 0)))
                (= (+ |__cost'?8| (- K?11) (- __cost?20) -1) 0)
                (= (+ (- y?16) |y'?6| (- K?11)) 0) (<= (- K?11) 0)
                (or (and (< (- |__cost'?8|) 0) (<= (+ m?15 (- |y'?6|)) 0)
                           (= (+ (- phi_tmp?3) |tmp'?4|) 0))
                      (and (< (- |__cost'?8|) 0) (< (+ (- m?15) |y'?6|) 0)
                             (= havoc?2 0) (= (+ havoc?2 (- phi_tmp?3)) 0)))
                (= (+ |y'?12| (- |y'?6|)) 0) (= (+ |x'?1| (- x?19) -1) 0)
                (= (+ |tmp'?13| (- phi_tmp?3)) 0)
                (= (+ |__cost'?14| (- |__cost'?8|)) 0)
                (= delta___cost (+ |__cost'?14| (- __cost?20)))
                (= delta_tmp (+ |tmp'?13| (- tmp?17)))
                (= delta_x (+ |x'?1| (- x?19)))
                (= delta_y (+ |y'?12| (- y?16))))))
(check-sat)