(declare-const delta_flag Int)
(declare-const delta_n Int)
(declare-const delta___cost Int)
(assert (exists
         ((|n'?1| Int) (|flag'?2| Int) (|__cost'?3| Int) (n?4 Int)
            (flag?5 Int) (__cost?6 Int))
         (and (<= (- flag?5) 0) (< (- n?4) 0) (<= (- __cost?6) 0)
                (<= (+ (- __cost?6) -1) 0) (= (+ |n'?1| (- n?4) 1) 0)
                (= (+ |flag'?2| -1) 0) (= (+ |__cost'?3| (- __cost?6) -1) 0)
                (= delta___cost (+ |__cost'?3| (- __cost?6)))
                (= delta_flag (+ |flag'?2| (- flag?5)))
                (= delta_n (+ |n'?1| (- n?4))))))
(check-sat)
