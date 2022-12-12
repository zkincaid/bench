(declare-const delta_x Int)
(declare-const delta_y Int)
(declare-const delta___cost Int)
(assert (exists
         ((|x'?1| Int) (|y'?2| Int) (|__cost'?3| Int) (y?4 Int) (x?5 Int)
            (__cost?6 Int))
         (and (< (- x?5) 0) (<= (- __cost?6) 0) (<= (+ (- __cost?6) -1) 0)
                (= (+ (- y?4) |y'?2| -2) 0) (= (+ |x'?1| (- x?5) 1) 0)
                (= (+ |__cost'?3| (- __cost?6) -1) 0)
                (= delta___cost (+ |__cost'?3| (- __cost?6)))
                (= delta_x (+ |x'?1| (- x?5))) (= delta_y (+ |y'?2| (- y?4))))))
(check-sat)
