(declare-const delta_param2@pos Int)
(declare-const delta_param0 Int)
(declare-const delta_param2 Int)
(declare-const delta_param1@width Int)
(declare-const delta_param1@pos Int)
(declare-const delta_param1 Int)
(declare-const delta_j Int)
(declare-const delta_param0@width Int)
(declare-const delta_param0@pos Int)
(declare-const delta_param2@width Int)
(assert (exists
         ((uninterp?1 Int) (|param2@width'?2| Int) (|param1@width'?3| Int)
            (|param0@width'?4| Int) (|param2@pos'?5| Int)
            (|param1@pos'?6| Int) (|param0@pos'?7| Int) (|param2'?8| Int)
            (|param1'?9| Int) (|param0'?10| Int) (|j'?11| Int)
            (phi_param1?12 Int) (phi_param1@pos?13 Int)
            (phi_param1@width?14 Int) (type_err?15 Int) (type_err?16 Int)
            (tr?17 Int) (type_err?18 Int) (type_err?19 Int) (type_err?20 Int)
            (type_err?21 Int) (tr?22 Int) (tr?23 Int) (stderr?24 Int)
            (stderr@pos?25 Int) (stderr@width?26 Int) (nj?27 Int) (j?28 Int)
            (ni?29 Int) (i?30 Int) (param2@width?31 Int) (param2@pos?32 Int)
            (param2?33 Int) (param1?34 Int) (param1@pos?35 Int)
            (param1@width?36 Int) (param0?37 Int) (param0@pos?38 Int)
            (param0@width?39 Int))
         (and (or (and (<= (- j?28) 0) (< (- ni?29) 0) (<= (- i?30) 0)
                         (< (+ (- nj?27) j?28) 0)
                         (or (< (mod (+ uninterp?1 j?28) 20) 0)
                               (< 0 (mod (+ uninterp?1 j?28) 20)))
                         (= (+ (- phi_param1?12) tr?23) 0)
                         (= (+ (- phi_param1@pos?13) type_err?21) 0)
                         (= (+ (- phi_param1@width?14) type_err?19) 0))
                    (and (<= (- j?28) 0) (< (- ni?29) 0) (<= (- i?30) 0)
                           (< (+ (- nj?27) j?28) 0)
                           (= (mod (+ uninterp?1 j?28) 20) 0)
                           (= (+ tr?17 (- phi_param1?12)) 0)
                           (= (+ type_err?16 (- phi_param1@pos?13)) 0)
                           (= (+ type_err?15 (- phi_param1@width?14)) 0)))
                (= (+ (- type_err?18) |param2@width'?2|) 0)
                (= (+ |param1@width'?3| (- phi_param1@width?14)) 0)
                (= (+ (- stderr@width?26) |param0@width'?4|) 0)
                (= (+ (- type_err?20) |param2@pos'?5|) 0)
                (= (+ |param1@pos'?6| (- phi_param1@pos?13)) 0)
                (= (+ (- stderr@pos?25) |param0@pos'?7|) 0)
                (= (+ (- tr?22) |param2'?8|) 0)
                (= (+ |param1'?9| (- phi_param1?12)) 0)
                (= (+ (- stderr?24) |param0'?10|) 0)
                (= (+ |j'?11| (- j?28) -1) 0) (<= 0 uninterp?1)
                (<= i?30 uninterp?1) (= delta_j (+ |j'?11| (- j?28)))
                (= delta_param0 (+ |param0'?10| (- param0?37)))
                (= delta_param1 (+ |param1'?9| (- param1?34)))
                (= delta_param2 (+ |param2'?8| (- param2?33)))
                (= delta_param0@pos (+ |param0@pos'?7| (- param0@pos?38)))
                (= delta_param1@pos (+ |param1@pos'?6| (- param1@pos?35)))
                (= delta_param2@pos (+ |param2@pos'?5| (- param2@pos?32)))
                (= delta_param0@width (+ |param0@width'?4|
                                           (- param0@width?39)))
                (= delta_param1@width (+ |param1@width'?3|
                                           (- param1@width?36)))
                (= delta_param2@width (+ |param2@width'?2|
                                           (- param2@width?31))))))
(check-sat)
