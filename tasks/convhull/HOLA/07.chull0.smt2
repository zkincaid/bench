(declare-const delta_a Int)
(declare-const delta_b Int)
(declare-const delta_i Int)
(assert (exists
         ((|b'?1| Int) (|a'?2| Int) (|i'?3| Int) (phi_b?4 Int) (phi_a?5 Int)
            (havoc?6 Int) (b?7 Int) (a?8 Int) (i?9 Int) (n?10 Int))
         (and (<= (- b?7) 0) (<= (- a?8) 0) (<= (- i?9) 0) (<= (- n?10) 0)
                (= (+ (* -3 i?9) a?8 b?7) 0) (< (+ (- n?10) i?9) 0)
                (or (and (or (< havoc?6 0) (< 0 havoc?6))
                           (= (+ (- phi_a?5) a?8 1) 0)
                           (= (+ (- phi_b?4) b?7 2) 0))
                      (and (= havoc?6 0) (= (+ (- phi_a?5) a?8 2) 0)
                             (= (+ (- phi_b?4) b?7 1) 0)))
                (= (+ |b'?1| (- phi_b?4)) 0) (= (+ |a'?2| (- phi_a?5)) 0)
                (= (+ |i'?3| (- i?9) -1) 0) (= delta_i (+ |i'?3| (- i?9)))
                (= delta_a (+ |a'?2| (- a?8))) (= delta_b (+ |b'?1| (- b?7))))))
(check-sat)
