(declare-const delta_i Int)
(declare-const delta_nrm Real)
(assert (exists
         ((uninterp?1 Int) (|nrm'?2| Real) (|i'?3| Int) (nrm?4 Real)
            (ni?5 Int) (i?6 Int))
         (and (<= (- i?6) 0) (< (+ (- ni?5) i?6) 0)
                (= (+ (- uninterp?1) (- nrm?4) |nrm'?2|) 0)
                (= (+ |i'?3| (- i?6) -1) 0) (= delta_i (+ |i'?3| (- i?6)))
                (= delta_nrm (+ |nrm'?2| (- nrm?4))))))
(check-sat)