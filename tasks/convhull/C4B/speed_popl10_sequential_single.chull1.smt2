(declare-const delta___cost Int)
(declare-const delta_x Int)
(declare-const delta_tmp Int)
(assert (exists
         ((|tmp'?1| Int) (havoc?2 Int) (|x'?3| Int) (|__cost'?4| Int)
            (n?5 Int) (x?6 Int) (tmp?7 Int) (__cost?8 Int))
         (and (<= (- x?6) 0) (< (+ (- n?5) x?6) 0)
                (or (< havoc?2 0) (< 0 havoc?2)) (<= (- __cost?8) 0)
                (<= (+ (- __cost?8) -1) 0) (= (+ |tmp'?1| (- havoc?2)) 0)
                (= (+ |x'?3| (- x?6) -1) 0)
                (= (+ |__cost'?4| (- __cost?8) -1) 0)
                (= delta___cost (+ |__cost'?4| (- __cost?8)))
                (= delta_x (+ |x'?3| (- x?6)))
                (= delta_tmp (+ |tmp'?1| (- tmp?7))))))
(check-sat)
