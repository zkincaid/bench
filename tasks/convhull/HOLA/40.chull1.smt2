(declare-const delta_tmp___1 Int)
(declare-const delta_a Int)
(declare-const delta_b Int)
(assert (exists
         ((|tmp___1'?1| Int) (|b'?2| Int) (|a'?3| Int) (havoc?4 Int)
            (b?5 Int) (a?6 Int) (tmp___1?7 Int) (j?8 Int) (i?9 Int))
         (and (<= (- a?6) 0) (< (- j?8) 0) (<= (- i?9) 0)
                (or (< havoc?4 0) (< 0 havoc?4))
                (= (+ |tmp___1'?1| (- havoc?4)) 0)
                (= (+ (- b?5) |b'?2| i?9 (- j?8)) 0)
                (= (+ |a'?3| (- a?6) -1) 0) (= delta_a (+ |a'?3| (- a?6)))
                (= delta_b (+ |b'?2| (- b?5)))
                (= delta_tmp___1 (+ |tmp___1'?1| (- tmp___1?7))))))
(check-sat)
