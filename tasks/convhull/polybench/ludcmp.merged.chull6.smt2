(declare-const delta_w Real)
(declare-const delta_k Int)
(assert (exists
         ((uninterp?1 Int) (|k'?2| Int) (|w'?3| Real) (w?4 Real) (k?5 Int)
            (i?6 Int))
         (and (<= (- k?5) 0) (<= (- i?6) 0) (< (+ (- i?6) k?5) 0)
                (= (+ uninterp?1 (- w?4) |w'?3|) 0)
                (= (+ |k'?2| (- k?5) -1) 0) (= delta_k (+ |k'?2| (- k?5)))
                (= delta_w (+ |w'?3| (- w?4))))))
(check-sat)
