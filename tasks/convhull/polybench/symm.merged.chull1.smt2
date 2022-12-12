(declare-const delta_k Int)
(declare-const delta_acc Real)
(declare-const delta_j Int)
(assert (exists
         ((|j'?1| Int) (|acc'?2| Real) (|S1,0?3| Real) (|k'?4| Int)
            (KSUM1?5 Int) (|K1,0?6| Int) (K?7 Int) (|acc'?8| Real)
            (|k'?9| Int) (acc?10 Real) (k?11 Int) (nj?12 Int) (j?13 Int))
         (and (<= (- j?13) 0) (< (+ (- nj?12) j?13) 0) (<= (- K?7) 0)
                (<= (- |K1,0?6|) 0) (= (+ |K1,0?6| (- K?7)) 0)
                (<= (+ KSUM1?5 (- K?7)) 0)
                (= (+ (- |S1,0?3|) |k'?4| (- |K1,0?6|)) 0)
                (= (+ (- KSUM1?5) |K1,0?6|) 0) (= |S1,0?3| 0)
                (or (and (= K?7 0) (= (- |acc'?2|) 0) (= (- |k'?4|) 0))
                      (and (<= (+ (- K?7) 1) 0) (<= (+ (- j?13) 2) 0)
                             (<= (+ |k'?4| (- j?13) 1) 0)
                             (<= (+ (- |k'?4|) 1) 0)))
                (= (+ |k'?4| (- K?7)) 0) (<= (- K?7) 0) (<= (- |k'?4|) 0)
                (<= (- j?13) 0) (<= (+ (- |k'?4|) j?13 -1) 0)
                (= (+ |acc'?8| (- |acc'?2|)) 0) (= (+ |k'?9| (- |k'?4|)) 0)
                (= (+ |j'?1| (- j?13) -1) 0) (= delta_j (+ |j'?1| (- j?13)))
                (= delta_k (+ |k'?9| (- k?11)))
                (= delta_acc (+ |acc'?8| (- acc?10))))))
(check-sat)