(declare-const delta_ix Int)
(declare-const delta_iy Int)
(assert (exists
         ((|iy'?1| Int) (|S1,0?2| Real) (|ix'?3| Int) (KSUM1?4 Int)
            (|K1,0?5| Int) (K?6 Int) (|S1,0?7| Real) (|ix'?8| Int)
            (KSUM1?9 Int) (|K1,0?10| Int) (K?11 Int) (|ix'?12| Int)
            (cxm?13 Int) (ix?14 Int) (cym?15 Int) (iy?16 Int))
         (and (<= (- iy?16) 0) (< (+ (- cym?15) iy?16) 0) (<= (- K?11) 0)
                (<= (- |K1,0?10|) 0) (= (+ |K1,0?10| (- K?11)) 0)
                (<= (+ KSUM1?9 (- K?11)) 0)
                (= (+ (- |S1,0?7|) |ix'?8| (- |K1,0?10|)) 0)
                (= (+ (- KSUM1?9) |K1,0?10|) 0) (= |S1,0?7| 0)
                (or (and (= K?11 0) (= (- |ix'?8|) 0))
                      (and (<= (+ (- K?11) 1) 0) (<= (+ (- cxm?13) 1) 0)
                             (<= (+ (- cxm?13) |ix'?8|) 0)
                             (<= (+ (- |ix'?8|) 1) 0)))
                (= (+ |ix'?8| (- K?11)) 0) (<= (- K?11) 0) (<= (- |ix'?8|) 0)
                (<= (+ cxm?13 (- |ix'?8|)) 0) (<= (- K?6) 0)
                (<= (- |K1,0?5|) 0) (= (+ |K1,0?5| (- K?6)) 0)
                (<= (+ KSUM1?4 (- K?6)) 0)
                (= (+ (- |S1,0?2|) |ix'?3| (- |K1,0?5|)) 0)
                (= (+ (- KSUM1?4) |K1,0?5|) 0) (= |S1,0?2| 0)
                (or (and (= K?6 0) (= (- |ix'?3|) 0))
                      (and (<= (+ (- K?6) 1) 0) (<= (+ (- cxm?13) 1) 0)
                             (<= (+ |ix'?3| (- cxm?13)) 0)
                             (<= (+ (- |ix'?3|) 1) 0)))
                (= (+ |ix'?3| (- K?6)) 0) (<= (- K?6) 0) (<= (- |ix'?3|) 0)
                (<= (+ (- |ix'?3|) cxm?13) 0) (= (+ |ix'?12| (- |ix'?3|)) 0)
                (= (+ |iy'?1| (- iy?16) -1) 0)
                (= delta_iy (+ |iy'?1| (- iy?16)))
                (= delta_ix (+ |ix'?12| (- ix?14))))))
(check-sat)
