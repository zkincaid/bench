(declare-const delta_tmp___1 Int)
(declare-const delta_x Int)
(declare-const delta_y Int)
(assert (exists
         ((|tmp___1'?1| Int) (|y'?2| Int) (|x'?3| Int) (havoc?4 Int)
            (tmp___1?5 Int) (y?6 Int) (x?7 Int))
         (and (= (+ y?6 (- x?7)) 0) (or (< havoc?4 0) (< 0 havoc?4))
                (= (+ |tmp___1'?1| (- havoc?4)) 0) (= (+ |y'?2| (- y?6) 1) 0)
                (= (+ |x'?3| (- x?7) 1) 0) (= delta_x (+ |x'?3| (- x?7)))
                (= delta_y (+ |y'?2| (- y?6)))
                (= delta_tmp___1 (+ |tmp___1'?1| (- tmp___1?5))))))
(check-sat)
