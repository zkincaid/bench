(declare-const delta_y Int)
(declare-const delta_z Int)
(declare-const delta_tmp Int)
(declare-const delta_x Int)
(declare-const delta_w Int)
(assert (exists
         ((|tmp'?1| Int) (|w'?2| Int) (|y'?3| Int) (|x'?4| Int) (|z'?5| Int)
            (phi_x?6 Int) (havoc?7 Int) (z?8 Int) (x?9 Int) (y?10 Int)
            (w?11 Int) (tmp?12 Int))
         (and (< (- z?8) 0) (<= (- x?9) 0) (<= (- y?10) 0) (<= (- w?11) 0)
                (= (+ (- w?11) (* 2 y?10)) 0)
                (or (< havoc?7 0) (< 0 havoc?7))
                (or (and (= (+ (mod (+ w?11 y?10 x?9 z?8) 2) -1) 0)
                           (= (+ (- phi_x?6) x?9 1) 0))
                      (and (or (< (+ (mod (+ w?11 y?10 x?9 z?8) 2) -1) 0)
                                 (< 0 (+ (mod (+ w?11 y?10 x?9 z?8) 2) -1)))
                             (= (+ (- phi_x?6) x?9) 0)))
                (= (+ |tmp'?1| (- havoc?7)) 0) (= (+ |w'?2| (- w?11) -2) 0)
                (= (+ |y'?3| (- y?10) -1) 0) (= (+ |x'?4| (- phi_x?6)) 0)
                (= (+ |z'?5| (- w?11) (- y?10) (- x?9) (- z?8)) 0)
                (= delta_z (+ |z'?5| (- z?8))) (= delta_x (+ |x'?4| (- x?9)))
                (= delta_y (+ |y'?3| (- y?10)))
                (= delta_w (+ |w'?2| (- w?11)))
                (= delta_tmp (+ |tmp'?1| (- tmp?12))))))
(check-sat)
