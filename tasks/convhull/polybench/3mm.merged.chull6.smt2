(declare-const delta_k Int)
(assert (exists ((|k'?1| Int) (nk?2 Int) (k?3 Int))
         (and (<= (- k?3) 0) (< (+ (- nk?2) k?3) 0)
                (= (+ |k'?1| (- k?3) -1) 0) (= delta_k (+ |k'?1| (- k?3))))))
(check-sat)
