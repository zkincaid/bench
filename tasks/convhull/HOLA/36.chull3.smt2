(declare-const delta_b Int)
(declare-const delta_c Int)
(declare-const delta_tmp___2 Int)
(declare-const delta_a Int)
(declare-const delta_d Int)
(assert (exists
         ((|tmp___2'?1| Int) (|d'?2| Int) (|c'?3| Int) (|b'?4| Int)
            (|a'?5| Int) (phi_b?6 Int) (phi_a?7 Int) (havoc?8 Int)
            (flag?9 Int) (b?10 Int) (a?11 Int) (d?12 Int) (c?13 Int)
            (tmp___2?14 Int))
         (and (<= (- b?10) 0) (<= (- a?11) 0) (<= (- d?12) 0) (<= (- c?13) 0)
                (= (+ (- c?13) d?12) 0) (= (+ (- a?11) b?10) 0)
                (or (< havoc?8 0) (< 0 havoc?8))
                (or (and (or (< flag?9 0) (< 0 flag?9))
                           (= (+ (- phi_a?7) a?11 1) 0)
                           (= (+ (- phi_b?6) b?10 1) 0))
                      (and (= flag?9 0) (= (+ (- phi_a?7) c?13 a?11 1) 0)
                             (= (+ (- phi_b?6) d?12 b?10 1) 0)))
                (= (+ |tmp___2'?1| (- havoc?8)) 0)
                (= (+ |d'?2| (- d?12) -1) 0) (= (+ |c'?3| (- c?13) -1) 0)
                (= (+ |b'?4| (- phi_b?6)) 0) (= (+ |a'?5| (- phi_a?7)) 0)
                (= delta_a (+ |a'?5| (- a?11)))
                (= delta_b (+ |b'?4| (- b?10)))
                (= delta_c (+ |c'?3| (- c?13)))
                (= delta_d (+ |d'?2| (- d?12)))
                (= delta_tmp___2 (+ |tmp___2'?1| (- tmp___2?14))))))
(check-sat)
