(declare-const delta_x Int)
(declare-const delta_y Int)
(assert (exists ((|y'?1| Int) (|x'?2| Int) (y?3 Int) (x?4 Int))
         (and (< x?4 0) (= (+ (- y?3) |y'?1| -1) 0)
                (= (+ |x'?2| (- y?3) (- x?4)) 0)
                (= delta_x (+ |x'?2| (- x?4))) (= delta_y (+ |y'?1| (- y?3))))))
(check-sat)
