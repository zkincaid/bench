(declare-const delta_i Int)
(declare-const delta_j Int)
(declare-const delta___cost Int)
(assert (exists
         ((|j'?1| Int) (|i'?2| Int) (|__cost'?3| Int) (phi_i?4 Int) (i?5 Int)
            (x?6 Int) (j?7 Int) (__cost?8 Int))
         (and (< (- i?5) 0) (<= (- j?7) 0) (< (+ (- x?6) j?7) 0)
                (<= (- __cost?8) 0) (<= (+ (- __cost?8) -1) 0)
                (or (and (<= (+ (- i?5) 4) 0) (= (+ (- phi_i?4) 1) 0))
                      (and (< (+ i?5 -4) 0) (= (+ (- phi_i?4) i?5 1) 0)))
                (= (+ |j'?1| (- j?7) -1) 0) (= (+ |i'?2| (- phi_i?4)) 0)
                (= (+ |__cost'?3| (- __cost?8) -1) 0)
                (= delta___cost (+ |__cost'?3| (- __cost?8)))
                (= delta_i (+ |i'?2| (- i?5))) (= delta_j (+ |j'?1| (- j?7))))))
(check-sat)