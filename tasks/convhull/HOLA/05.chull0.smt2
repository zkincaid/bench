(declare-const delta_y Int)
(declare-const delta_x Int)
(declare-const delta_i Int)
(declare-const delta_j Int)
(declare-const delta_tmp Int)
(assert (exists
         ((|tmp'?1| Int) (|i'?2| Int) (|j'?3| Int) (|y'?4| Int) (|x'?5| Int)
            (phi_j?6 Int) (havoc?7 Int) (flag?8 Int) (j?9 Int) (i?10 Int)
            (y?11 Int) (x?12 Int) (tmp?13 Int))
         (and (<= (- j?9) 0) (<= (- i?10) 0) (<= (- y?11) 0) (<= (- x?12) 0)
                (= (+ (- x?12) y?11) 0) (< (+ x?12 -100000) 0)
                (or (< havoc?7 0) (< 0 havoc?7))
                (or (and (or (< flag?8 0) (< 0 flag?8))
                           (= (+ (- phi_j?6) y?11 j?9 2) 0))
                      (and (= flag?8 0) (= (+ (- phi_j?6) y?11 j?9 1) 0)))
                (= (+ |tmp'?1| (- havoc?7)) 0)
                (= (+ |i'?2| (- x?12) (- i?10) -1) 0)
                (= (+ |j'?3| (- phi_j?6)) 0) (= (+ |y'?4| (- y?11) -1) 0)
                (= (+ |x'?5| (- x?12) -1) 0) (= delta_x (+ |x'?5| (- x?12)))
                (= delta_y (+ |y'?4| (- y?11)))
                (= delta_j (+ |j'?3| (- j?9)))
                (= delta_i (+ |i'?2| (- i?10)))
                (= delta_tmp (+ |tmp'?1| (- tmp?13))))))
(check-sat)
