(declare-const delta_y Int)
(declare-const delta___cost Int)
(declare-const delta_x Int)
(assert (exists
         ((|__cost'?1| Int) (|x'?2| Int) (|y'?3| Int) (x?4 Int)
            (__cost?5 Int) (y?6 Int))
         (and (< (- y?6) 0) (<= (- __cost?5) 0) (<= (+ (- __cost?5) -1) 0)
                (= (+ |__cost'?1| (- __cost?5) -1) 0)
                (= (+ (- x?4) |x'?2| -1) 0) (= (+ |y'?3| (- y?6) 1) 0)
                (= delta_y (+ |y'?3| (- y?6))) (= delta_x (+ |x'?2| (- x?4)))
                (= delta___cost (+ |__cost'?1| (- __cost?5))))))
(check-sat)
