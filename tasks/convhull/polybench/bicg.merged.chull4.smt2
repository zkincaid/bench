(declare-const delta_param2@pos Int)
(declare-const delta_param1 Int)
(declare-const delta_param1@pos Int)
(declare-const delta_param0@pos Int)
(declare-const delta_param2 Int)
(declare-const delta_param0@width Int)
(declare-const delta_param1@width Int)
(declare-const delta_param2@width Int)
(declare-const delta_i Int)
(declare-const delta_param0 Int)
(assert (exists
         ((phi_param1?1 Int) (phi_param1@pos?2 Int) (phi_param1@width?3 Int)
            (type_err?4 Int) (type_err?5 Int) (tr?6 Int) (type_err?7 Int)
            (type_err?8 Int) (type_err?9 Int) (type_err?10 Int) (tr?11 Real)
            (tr?12 Int) (|param2@width'?13| Int) (|param1@width'?14| Int)
            (|param0@width'?15| Int) (|param2@pos'?16| Int)
            (|param1@pos'?17| Int) (|param0@pos'?18| Int) (|param2'?19| Int)
            (|param1'?20| Int) (|param0'?21| Int) (|i'?22| Int)
            (stderr?23 Int) (stderr@pos?24 Int) (stderr@width?25 Int)
            (ny?26 Int) (i?27 Int) (param2@width?28 Int) (param2@pos?29 Int)
            (param2?30 Int) (param1?31 Int) (param1@pos?32 Int)
            (param1@width?33 Int) (param0?34 Int) (param0@pos?35 Int)
            (param0@width?36 Int))
         (and (or (and (<= (- i?27) 0) (< (+ (- ny?26) i?27) 0)
                         (or (< (mod i?27 20) 0) (< 0 (mod i?27 20)))
                         (= (+ (- phi_param1?1) tr?12) 0)
                         (= (+ (- phi_param1@pos?2) type_err?10) 0)
                         (= (+ (- phi_param1@width?3) type_err?8) 0))
                    (and (<= (- i?27) 0) (< (+ (- ny?26) i?27) 0)
                           (= (mod i?27 20) 0)
                           (= (+ tr?6 (- phi_param1?1)) 0)
                           (= (+ type_err?5 (- phi_param1@pos?2)) 0)
                           (= (+ type_err?4 (- phi_param1@width?3)) 0)))
                (= (+ (- type_err?7) |param2@width'?13|) 0)
                (= (+ |param1@width'?14| (- phi_param1@width?3)) 0)
                (= (+ (- stderr@width?25) |param0@width'?15|) 0)
                (= (+ (- type_err?9) |param2@pos'?16|) 0)
                (= (+ |param1@pos'?17| (- phi_param1@pos?2)) 0)
                (= (+ (- stderr@pos?24) |param0@pos'?18|) 0)
                (= (+ (- tr?11) |param2'?19|) 0)
                (= (+ |param1'?20| (- phi_param1?1)) 0)
                (= (+ (- stderr?23) |param0'?21|) 0)
                (= (+ |i'?22| (- i?27) -1) 0)
                (= delta_i (+ |i'?22| (- i?27)))
                (= delta_param0 (+ |param0'?21| (- param0?34)))
                (= delta_param1 (+ |param1'?20| (- param1?31)))
                (= delta_param2 (+ |param2'?19| (- param2?30)))
                (= delta_param0@pos (+ |param0@pos'?18| (- param0@pos?35)))
                (= delta_param1@pos (+ |param1@pos'?17| (- param1@pos?32)))
                (= delta_param2@pos (+ |param2@pos'?16| (- param2@pos?29)))
                (= delta_param0@width (+ |param0@width'?15|
                                           (- param0@width?36)))
                (= delta_param1@width (+ |param1@width'?14|
                                           (- param1@width?33)))
                (= delta_param2@width (+ |param2@width'?13|
                                           (- param2@width?28))))))
(check-sat)
