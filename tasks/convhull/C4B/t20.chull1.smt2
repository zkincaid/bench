(declare-const delta___cost Int)
(declare-const delta_x Int)
(assert (exists
         ((|x'?1| Int) (|__cost'?2| Int) (y?3 Int) (x?4 Int) (__cost?5 Int))
         (and (< (+ (- y?3) x?4) 0) (<= (- __cost?5) 0)
                (<= (+ (- __cost?5) -1) 0) (= (+ |x'?1| (- x?4) -1) 0)
                (= (+ |__cost'?2| (- __cost?5) -1) 0)
                (= delta___cost (+ |__cost'?2| (- __cost?5)))
                (= delta_x (+ |x'?1| (- x?4))))))
(check-sat)
