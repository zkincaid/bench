(declare-const delta_i Int)
(declare-const delta_param2@width Int)
(declare-const delta_param2@pos Int)
(declare-const delta_param0 Int)
(declare-const delta_param0@width Int)
(declare-const delta_param2 Int)
(declare-const delta_param1@width Int)
(declare-const delta_param1@pos Int)
(declare-const delta_param1 Int)
(declare-const delta_param0@pos Int)
(assert (exists
         ((|param2@width'?1| Int) (|param1@width'?2| Int)
            (|param0@width'?3| Int) (|param2@pos'?4| Int)
            (|param1@pos'?5| Int) (|param0@pos'?6| Int) (|param2'?7| Int)
            (|param1'?8| Int) (|param0'?9| Int) (|i'?10| Int)
            (phi_param1?11 Int) (phi_param1@pos?12 Int)
            (phi_param1@width?13 Int) (type_err?14 Int) (type_err?15 Int)
            (tr?16 Int) (type_err?17 Int) (type_err?18 Int) (type_err?19 Int)
            (type_err?20 Int) (tr?21 Real) (tr?22 Int) (stderr?23 Int)
            (stderr@pos?24 Int) (stderr@width?25 Int) (n?26 Int) (i?27 Int)
            (param2@width?28 Int) (param2@pos?29 Int) (param2?30 Int)
            (param1?31 Int) (param1@pos?32 Int) (param1@width?33 Int)
            (param0?34 Int) (param0@pos?35 Int) (param0@width?36 Int))
         (and (or (and (<= (- i?27) 0) (<= (+ (- n?26) i?27) 0)
                         (or (< (mod i?27 20) 0) (< 0 (mod i?27 20)))
                         (= (+ (- phi_param1?11) tr?22) 0)
                         (= (+ (- phi_param1@pos?12) type_err?20) 0)
                         (= (+ (- phi_param1@width?13) type_err?18) 0))
                    (and (<= (- i?27) 0) (<= (+ (- n?26) i?27) 0)
                           (= (mod i?27 20) 0)
                           (= (+ tr?16 (- phi_param1?11)) 0)
                           (= (+ type_err?15 (- phi_param1@pos?12)) 0)
                           (= (+ type_err?14 (- phi_param1@width?13)) 0)))
                (= (+ (- type_err?17) |param2@width'?1|) 0)
                (= (+ |param1@width'?2| (- phi_param1@width?13)) 0)
                (= (+ (- stderr@width?25) |param0@width'?3|) 0)
                (= (+ (- type_err?19) |param2@pos'?4|) 0)
                (= (+ |param1@pos'?5| (- phi_param1@pos?12)) 0)
                (= (+ (- stderr@pos?24) |param0@pos'?6|) 0)
                (= (+ (- tr?21) |param2'?7|) 0)
                (= (+ |param1'?8| (- phi_param1?11)) 0)
                (= (+ (- stderr?23) |param0'?9|) 0)
                (= (+ |i'?10| (- i?27) -1) 0)
                (= delta_i (+ |i'?10| (- i?27)))
                (= delta_param0 (+ |param0'?9| (- param0?34)))
                (= delta_param1 (+ |param1'?8| (- param1?31)))
                (= delta_param2 (+ |param2'?7| (- param2?30)))
                (= delta_param0@pos (+ |param0@pos'?6| (- param0@pos?35)))
                (= delta_param1@pos (+ |param1@pos'?5| (- param1@pos?32)))
                (= delta_param2@pos (+ |param2@pos'?4| (- param2@pos?29)))
                (= delta_param0@width (+ |param0@width'?3|
                                           (- param0@width?36)))
                (= delta_param1@width (+ |param1@width'?2|
                                           (- param1@width?33)))
                (= delta_param2@width (+ |param2@width'?1|
                                           (- param2@width?28))))))
(check-sat)
