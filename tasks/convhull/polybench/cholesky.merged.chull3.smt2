(declare-const delta_param0@width Int)
(declare-const delta_j Int)
(declare-const delta_param0 Int)
(declare-const delta_param0@pos Int)
(declare-const delta_x Real)
(declare-const delta_k Int)
(declare-const delta_i Int)
(assert (exists
         ((|param0@width'?1| Int) (|param0@pos'?2| Int) (|param0'?3| Int)
            (|i'?4| Int) (|k'?5| Int) (|x'?6| Real) (|S1,0?7| Real)
            (|j'?8| Int) (KSUM1?9 Int) (|K1,0?10| Int) (K?11 Int)
            (type_err?12 Int) (type_err?13 Int) (|x'?14| Real)
            (|S1,0?15| Real) (|j'?16| Int) (KSUM1?17 Int) (|K1,0?18| Int)
            (K?19 Int) (tr?20 Int) (|j'?21| Int) (|x'?22| Real) (|k'?23| Int)
            (k?24 Int) (x?25 Real) (j?26 Int) (n?27 Int) (i?28 Int)
            (param0?29 Int) (param0@pos?30 Int) (param0@width?31 Int))
         (and (<= (- i?28) 0) (< (+ (- n?27) i?28) 0) (<= (- K?19) 0)
                (<= (- |K1,0?18|) 0) (= (+ |K1,0?18| (- K?19)) 0)
                (<= (+ KSUM1?17 (- K?19)) 0)
                (= (+ (- |S1,0?15|) |j'?16| (- |K1,0?18|)) 0)
                (= (+ (- KSUM1?17) |K1,0?18|) 0) (= |S1,0?15| 0)
                (or (and (= K?19 0) (= (+ (- |x'?14|) tr?20) 0)
                           (= (- |j'?16|) 0))
                      (and (<= (+ (- K?19) 1) 0) (<= (+ (- i?28) 1) 0)
                             (<= (+ |j'?16| (- i?28)) 0)
                             (<= (+ (- |j'?16|) 1) 0)))
                (= (+ |j'?16| (- K?19)) 0) (<= (- K?19) 0) (<= (- |j'?16|) 0)
                (<= (- i?28) 0) (< (+ (- |j'?16|) i?28 -1) 0) (<= (- K?11) 0)
                (<= (- |K1,0?10|) 0) (= (+ |K1,0?10| (- K?11)) 0)
                (<= (+ KSUM1?9 (- K?11)) 0)
                (= (+ (- |S1,0?7|) |j'?8| (- |K1,0?10|)) 0)
                (= (+ (- KSUM1?9) |K1,0?10|) 0)
                (= (+ |S1,0?7| (- i?28) -1) 0)
                (or (and (= K?11 0) (= (+ (- |x'?6|) |x'?14|) 0)
                           (= (+ (- |k'?5|) k?24) 0)
                           (= (+ (- |j'?8|) i?28 1) 0))
                      (and (<= (+ (- K?11) 1) 0) (<= (+ (- n?27) i?28 2) 0)
                             (<= (- i?28) 0) (<= (- i?28) 0)
                             (= (+ (- |k'?5|) i?28) 0)
                             (<= (+ |j'?8| (- n?27)) 0)
                             (<= (+ (- |j'?8|) 2) 0) (<= (- |k'?5|) 0)))
                (= (+ |j'?8| (- K?11) (- i?28) -1) 0) (<= (- K?11) 0)
                (< (- |j'?8|) 0) (< (- n?27) 0) (<= (- i?28) 0)
                (<= (+ (- |j'?8|) n?27) 0)
                (= (+ (- type_err?12) |param0@width'?1|) 0)
                (= (+ (- type_err?13) |param0@pos'?2|) 0)
                (= (+ |param0'?3| (- |x'?14|)) 0)
                (= (+ |x'?22| (- |x'?6|)) 0) (= (+ |k'?23| (- |k'?5|)) 0)
                (= (+ |j'?21| (- |j'?8|)) 0) (= (+ |i'?4| (- i?28) -1) 0)
                (= delta_i (+ |i'?4| (- i?28)))
                (= delta_j (+ |j'?21| (- j?26)))
                (= delta_k (+ |k'?23| (- k?24)))
                (= delta_x (+ |x'?22| (- x?25)))
                (= delta_param0 (+ |param0'?3| (- param0?29)))
                (= delta_param0@pos (+ |param0@pos'?2| (- param0@pos?30)))
                (= delta_param0@width (+ |param0@width'?1|
                                           (- param0@width?31))))))
(check-sat)
