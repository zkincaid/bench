(declare-const delta_y Int)
(declare-const delta_k Int)
(declare-const delta_tmp Int)
(declare-const delta_z Int)
(declare-const delta_x Int)
(assert (exists
         ((|tmp'?1| Int) (|k'?2| Int) (|z'?3| Int) (|y'?4| Int) (|x'?5| Int)
            (phi_x?6 Int) (havoc?7 Int) (z?8 Int) (k?9 Int) (x?10 Int)
            (y?11 Int) (tmp?12 Int))
         (and (<= (- z?8) 0) (<= (- k?9) 0) (<= (- x?10) 0) (<= (- y?11) 0)
                (= (+ (* -3 y?11) k?9) 0) (= (+ (- y?11) z?8) 0)
                (= (+ (- y?11) x?10) 0) (<= (+ y?11 -100000) 0)
                (or (< havoc?7 0) (< 0 havoc?7))
                (or (and (= (mod k?9 3) 0) (= (+ (- phi_x?6) x?10 1) 0))
                      (and (or (< (mod k?9 3) 0) (< 0 (mod k?9 3)))
                             (= (+ (- phi_x?6) x?10) 0)))
                (= (+ |tmp'?1| (- havoc?7)) 0)
                (= (+ |k'?2| (- phi_x?6) (- y?11) (- z?8) -2) 0)
                (= (+ |z'?3| (- z?8) -1) 0) (= (+ |y'?4| (- y?11) -1) 0)
                (= (+ |x'?5| (- phi_x?6)) 0) (= delta_x (+ |x'?5| (- x?10)))
                (= delta_y (+ |y'?4| (- y?11)))
                (= delta_z (+ |z'?3| (- z?8))) (= delta_k (+ |k'?2| (- k?9)))
                (= delta_tmp (+ |tmp'?1| (- tmp?12))))))
(check-sat)
