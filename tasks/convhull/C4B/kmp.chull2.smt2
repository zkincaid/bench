(declare-const delta_i Int)
(assert (exists ((|i'?1| Int) (tr?2 Int) (tr?3 Int) (p_len?4 Int) (i?5 Int))
         (and (< (- p_len?4) 0) (<= (- i?5) 0) (= (+ p_len?4 -5) 0)
                (< (+ i?5 (- p_len?4)) 0) (< (- tr?3) 0)
                (<= (+ tr?2 (- i?5) -1) 0) (= (+ |i'?1| (- i?5) -1) 0)
                (= delta_i (+ |i'?1| (- i?5))))))
(check-sat)
