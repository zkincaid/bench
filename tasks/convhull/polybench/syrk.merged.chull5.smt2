(declare-const delta_param2@pos Int)
(declare-const delta_param0@width Int)
(declare-const delta_param1@pos Int)
(declare-const delta_param0 Int)
(declare-const delta_param2@width Int)
(declare-const delta_param2 Int)
(declare-const delta_param0@pos Int)
(declare-const delta_param1 Int)
(declare-const delta_param1@width Int)
(declare-const delta_j Int)
(assert (exists
         ((uninterp?1 Int) (|param2@width'?2| Int) (|param1@width'?3| Int)
            (|param0@width'?4| Int) (|param2@pos'?5| Int)
            (|param1@pos'?6| Int) (|param0@pos'?7| Int) (|param2'?8| Int)
            (|param1'?9| Int) (|param0'?10| Int) (|j'?11| Int)
            (phi_param1?12 Int) (phi_param1@pos?13 Int)
            (phi_param1@width?14 Int) (type_err?15 Int) (type_err?16 Int)
            (tr?17 Int) (type_err?18 Int) (type_err?19 Int) (type_err?20 Int)
            (type_err?21 Int) (tr?22 Int) (tr?23 Int) (stderr?24 Int)
            (stderr@pos?25 Int) (stderr@width?26 Int) (j?27 Int) (ni?28 Int)
            (i?29 Int) (param2@width?30 Int) (param2@pos?31 Int)
            (param2?32 Int) (param1?33 Int) (param1@pos?34 Int)
            (param1@width?35 Int) (param0?36 Int) (param0@pos?37 Int)
            (param0@width?38 Int))
         (and (or (and (<= (- j?27) 0) (< (- ni?28) 0) (<= (- i?29) 0)
                         (< (+ (- ni?28) j?27) 0)
                         (or (< (mod (+ uninterp?1 j?27) 20) 0)
                               (< 0 (mod (+ uninterp?1 j?27) 20)))
                         (= (+ (- phi_param1?12) tr?23) 0)
                         (= (+ (- phi_param1@pos?13) type_err?21) 0)
                         (= (+ (- phi_param1@width?14) type_err?19) 0))
                    (and (<= (- j?27) 0) (< (- ni?28) 0) (<= (- i?29) 0)
                           (< (+ (- ni?28) j?27) 0)
                           (= (mod (+ uninterp?1 j?27) 20) 0)
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
                (= (+ |j'?11| (- j?27) -1) 0) (<= 0 uninterp?1)
                (<= i?29 uninterp?1) (= delta_j (+ |j'?11| (- j?27)))
                (= delta_param0 (+ |param0'?10| (- param0?36)))
                (= delta_param1 (+ |param1'?9| (- param1?33)))
                (= delta_param2 (+ |param2'?8| (- param2?32)))
                (= delta_param0@pos (+ |param0@pos'?7| (- param0@pos?37)))
                (= delta_param1@pos (+ |param1@pos'?6| (- param1@pos?34)))
                (= delta_param2@pos (+ |param2@pos'?5| (- param2@pos?31)))
                (= delta_param0@width (+ |param0@width'?4|
                                           (- param0@width?38)))
                (= delta_param1@width (+ |param1@width'?3|
                                           (- param1@width?35)))
                (= delta_param2@width (+ |param2@width'?2|
                                           (- param2@width?30))))))
(check-sat)
