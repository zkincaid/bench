(declare-const delta_x Int)
(declare-const delta___cost Int)
(declare-const delta_y Int)
(assert (exists
         ((|y'?1| Int) (|x'?2| Int) (|__cost'?3| Int) (phi_x?4 Int)
            (phi_y?5 Int) (n?6 Int) (x?7 Int) (y?8 Int) (__cost?9 Int))
         (and (or (and (<= (- x?7) 0) (<= (- y?8) 0) (< (+ (- n?6) x?7) 0)
                         (= (+ (- phi_x?4) x?7 1) 0)
                         (= (+ (- phi_y?5) y?8 1) 0))
                    (and (<= (- x?7) 0) (<= (- y?8) 0) (<= (+ n?6 (- x?7)) 0)
                           (< (- y?8) 0) (= (+ (- phi_x?4) x?7) 0)
                           (= (+ (- phi_y?5) y?8 -1) 0))) (<= (- __cost?9) 0)
                (<= (+ (- __cost?9) -1) 0) (= (+ |y'?1| (- phi_y?5)) 0)
                (= (+ |x'?2| (- phi_x?4)) 0)
                (= (+ |__cost'?3| (- __cost?9) -1) 0)
                (= delta___cost (+ |__cost'?3| (- __cost?9)))
                (= delta_x (+ |x'?2| (- x?7))) (= delta_y (+ |y'?1| (- y?8))))))
(check-sat)
