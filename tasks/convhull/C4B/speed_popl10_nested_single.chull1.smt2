(declare-const delta_x Int)
(declare-const delta___cost Int)
(declare-const delta_tmp Int)
(assert (exists
         ((havoc?1 Int) (phi_tmp?2 Int) (|tmp'?3| Int) (|S1,1?4| Real)
            (|x'?5| Int) (|S1,0?6| Real) (|__cost'?7| Int) (KSUM1?8 Int)
            (|K1,0?9| Int) (K?10 Int) (|tmp'?11| Int) (|x'?12| Int)
            (|__cost'?13| Int) (tmp?14 Int) (n?15 Int) (x?16 Int)
            (__cost?17 Int))
         (and (<= (- x?16) 0) (< (+ (- n?15) x?16) 0) (<= (- __cost?17) 0)
                (<= (+ (- __cost?17) -1) 0) (<= (- K?10) 0)
                (<= (- |K1,0?9|) 0) (= (+ |K1,0?9| (- K?10)) 0)
                (<= (+ KSUM1?8 (- K?10)) 0)
                (= (+ (- |S1,0?6|) |__cost'?7| (- |K1,0?9|)) 0)
                (= (+ (- |S1,1?4|) |x'?5| (- |K1,0?9|)) 0)
                (= (+ (- KSUM1?8) |K1,0?9|) 0)
                (= (+ |S1,0?6| (- __cost?17) -1) 0)
                (= (+ |S1,1?4| (- x?16) -1) 0)
                (or (and (= K?10 0) (= (+ (- |tmp'?3|) tmp?14) 0)
                           (= (+ (- |x'?5|) x?16 1) 0)
                           (= (+ (- |__cost'?7|) __cost?17 1) 0))
                      (and (<= (+ (- K?10) 1) 0) (<= (+ (- n?15) x?16 2) 0)
                             (<= (- __cost?17) 0) (<= (- x?16) 0)
                             (<= (+ |x'?5| (- n?15)) 0)
                             (<= (+ (- |__cost'?7|) 2) 0)
                             (<= (+ (- |x'?5|) 2) 0)))
                (= (+ |__cost'?7| (- K?10) (- __cost?17) -1) 0)
                (= (+ |x'?5| (- K?10) (- x?16) -1) 0) (<= (- K?10) 0)
                (or (and (< (- n?15) 0) (< (- |x'?5|) 0)
                           (< (- |__cost'?7|) 0) (<= (+ (- |x'?5|) n?15) 0)
                           (= (+ (- phi_tmp?2) |tmp'?3|) 0))
                      (and (< (- n?15) 0) (< (- |x'?5|) 0)
                             (< (- |__cost'?7|) 0) (< (+ |x'?5| (- n?15)) 0)
                             (= havoc?1 0) (= (+ havoc?1 (- phi_tmp?2)) 0)))
                (= (+ |tmp'?11| (- phi_tmp?2)) 0)
                (= (+ |x'?12| (- |x'?5|)) 0)
                (= (+ |__cost'?13| (- |__cost'?7|)) 0)
                (= delta___cost (+ |__cost'?13| (- __cost?17)))
                (= delta_x (+ |x'?12| (- x?16)))
                (= delta_tmp (+ |tmp'?11| (- tmp?14))))))
(check-sat)
