(declare-const delta_y Int)
(declare-const delta_x Int)
(declare-const delta_i Int)
(assert (exists
         ((|i'?1| Int) (|y'?2| Int) (|x'?3| Int) (phi_y?4 Int) (y?5 Int)
            (x?6 Int) (n?7 Int) (i?8 Int))
         (and (<= (- y?5) 0) (<= (- x?6) 0) (<= (- i?8) 0)
                (= (+ (- i?8) x?6) 0) (< (+ (- n?7) i?8) 0)
                (or (and (= (mod (+ i?8 1) 2) 0) (= (+ (- phi_y?4) y?5 1) 0))
                      (and (or (< (mod (+ i?8 1) 2) 0)
                                 (< 0 (mod (+ i?8 1) 2)))
                             (= (+ (- phi_y?4) y?5) 0)))
                (= (+ |i'?1| (- i?8) -1) 0) (= (+ |y'?2| (- phi_y?4)) 0)
                (= (+ |x'?3| (- x?6) -1) 0) (= delta_x (+ |x'?3| (- x?6)))
                (= delta_y (+ |y'?2| (- y?5))) (= delta_i (+ |i'?1| (- i?8))))))
(check-sat)
