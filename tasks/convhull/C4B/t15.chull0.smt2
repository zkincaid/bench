(declare-const delta___cost Int)
(declare-const delta_z Int)
(assert (exists ((|z'?1| Int) (|__cost'?2| Int) (z?3 Int) (__cost?4 Int))
         (and (<= (- z?3) 0) (< (- __cost?4) 0) (< (- z?3) 0)
                (<= (- __cost?4) 0) (<= (+ (- __cost?4) -1) 0)
                (= (+ |z'?1| (- z?3) 1) 0)
                (= (+ |__cost'?2| (- __cost?4) -1) 0)
                (= delta___cost (+ |__cost'?2| (- __cost?4)))
                (= delta_z (+ |z'?1| (- z?3))))))
(check-sat)
