(declare-const delta_y Int)
(declare-const delta_x Int)
(assert (exists ((|y'?1| Int) (|x'?2| Int) (y?3 Int) (x?4 Int))
         (and (or (< x?4 0) (< (- x?4) 0)) (= (+ (- y?3) |y'?1| 1) 0)
                (= (+ |x'?2| (- x?4) 1) 0) (= delta_x (+ |x'?2| (- x?4)))
                (= delta_y (+ |y'?1| (- y?3))))))
(check-sat)
