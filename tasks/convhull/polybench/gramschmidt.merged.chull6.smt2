(declare-const delta_param0@width Int)
(declare-const delta_param2 Int)
(declare-const delta_param1@width Int)
(declare-const delta_param0 Int)
(declare-const delta_j Int)
(declare-const delta_param1 Int)
(declare-const delta_param1@pos Int)
(declare-const delta_param0@pos Int)
(declare-const delta_param2@pos Int)
(declare-const delta_param2@width Int)
(assert (exists
         ((|param2@width'?1| Int) (|param1@width'?2| Int)
            (|param2@pos'?3| Int) (|param1@pos'?4| Int) (|param2'?5| Int)
            (|param1'?6| Int) (|j'?7| Int) (phi_param1?8 Int)
            (phi_param1@pos?9 Int) (phi_param1@width?10 Int)
            (type_err?11 Int) (type_err?12 Int) (tr?13 Int) (type_err?14 Int)
            (type_err?15 Int) (type_err?16 Int) (type_err?17 Int) (tr?18 Int)
            (tr?19 Int) (|param0@width'?20| Int) (|param0@pos'?21| Int)
            (|param0'?22| Int) (stderr?23 Int) (stderr@pos?24 Int)
            (stderr@width?25 Int) (nj?26 Int) (j?27 Int) (i?28 Int)
            (param2@width?29 Int) (param2@pos?30 Int) (param2?31 Int)
            (param1?32 Int) (param1@pos?33 Int) (param1@width?34 Int)
            (param0?35 Int) (param0@pos?36 Int) (param0@width?37 Int))
         (and (or (and (<= (- j?27) 0) (<= (- i?28) 0)
                         (< (+ (- nj?26) j?27) 0)
                         (or (< (mod i?28 20) 0) (< 0 (mod i?28 20)))
                         (= (+ (- phi_param1?8) tr?19) 0)
                         (= (+ (- phi_param1@pos?9) type_err?17) 0)
                         (= (+ (- phi_param1@width?10) type_err?15) 0))
                    (and (<= (- j?27) 0) (<= (- i?28) 0)
                           (< (+ (- nj?26) j?27) 0) (= (mod i?28 20) 0)
                           (= (+ tr?13 (- phi_param1?8)) 0)
                           (= (+ type_err?12 (- phi_param1@pos?9)) 0)
                           (= (+ type_err?11 (- phi_param1@width?10)) 0)))
                (= (+ (- type_err?14) |param2@width'?1|) 0)
                (= (+ |param1@width'?2| (- phi_param1@width?10)) 0)
                (= (+ (- stderr@width?25) |param0@width'?20|) 0)
                (= (+ (- type_err?16) |param2@pos'?3|) 0)
                (= (+ |param1@pos'?4| (- phi_param1@pos?9)) 0)
                (= (+ (- stderr@pos?24) |param0@pos'?21|) 0)
                (= (+ (- tr?18) |param2'?5|) 0)
                (= (+ |param1'?6| (- phi_param1?8)) 0)
                (= (+ (- stderr?23) |param0'?22|) 0)
                (= (+ |j'?7| (- j?27) -1) 0) (= delta_j (+ |j'?7| (- j?27)))
                (= delta_param0 (+ |param0'?22| (- param0?35)))
                (= delta_param1 (+ |param1'?6| (- param1?32)))
                (= delta_param2 (+ |param2'?5| (- param2?31)))
                (= delta_param0@pos (+ |param0@pos'?21| (- param0@pos?36)))
                (= delta_param1@pos (+ |param1@pos'?4| (- param1@pos?33)))
                (= delta_param2@pos (+ |param2@pos'?3| (- param2@pos?30)))
                (= delta_param0@width (+ |param0@width'?20|
                                           (- param0@width?37)))
                (= delta_param1@width (+ |param1@width'?2|
                                           (- param1@width?34)))
                (= delta_param2@width (+ |param2@width'?1|
                                           (- param2@width?29))))))
(check-sat)
