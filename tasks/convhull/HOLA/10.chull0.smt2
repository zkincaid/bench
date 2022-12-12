(declare-const delta_w Int)
(declare-const delta_y Int)
(declare-const delta_x Int)
(declare-const delta_z Int)
(declare-const delta_tmp Int)
(assert (exists
         ((|tmp'?1| Int) (|y'?2| Int) (|x'?3| Int) (|z'?4| Int) (|w'?5| Int)
            (phi_y?6 Int) (phi_z?7 Int) (phi_x?8 Int) (phi_w?9 Int)
            (havoc?10 Int) (z?11 Int) (y?12 Int) (w?13 Int) (x?14 Int)
            (tmp?15 Int))
         (and (<= (- z?11) 0) (<= (- y?12) 0) (<= (- w?13) 0) (<= (- x?14) 0)
                (= (+ (- x?14) z?11) 0) (= (+ (- x?14) y?12) 0)
                (= (+ x?14 w?13 -1) 0) (or (< havoc?10 0) (< 0 havoc?10))
                (or (and (or (< w?13 0) (< 0 w?13))
                           (= (+ (- phi_w?9) (ite (= w?13 0) 1 0)) 0)
                           (= (+ (- phi_x?8) x?14 1) 0))
                      (and (= w?13 0) (= (+ (- phi_w?9) w?13) 0)
                             (= (+ (- phi_x?8) x?14) 0)))
                (or (and (= z?11 0)
                           (= (+ (- phi_z?7) (ite (= z?11 0) 1 0)) 0)
                           (= (+ (- phi_y?6) y?12 1) 0))
                      (and (or (< z?11 0) (< 0 z?11))
                             (= (+ (- phi_z?7) z?11) 0)
                             (= (+ (- phi_y?6) y?12) 0)))
                (= (+ |tmp'?1| (- havoc?10)) 0) (= (+ |y'?2| (- phi_y?6)) 0)
                (= (+ |x'?3| (- phi_x?8)) 0) (= (+ |z'?4| (- phi_z?7)) 0)
                (= (+ |w'?5| (- phi_w?9)) 0) (= delta_w (+ |w'?5| (- w?13)))
                (= delta_z (+ |z'?4| (- z?11)))
                (= delta_x (+ |x'?3| (- x?14)))
                (= delta_y (+ |y'?2| (- y?12)))
                (= delta_tmp (+ |tmp'?1| (- tmp?15))))))
(check-sat)