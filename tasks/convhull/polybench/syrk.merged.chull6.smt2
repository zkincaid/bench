(declare-const delta_j Int)
(declare-const delta_i Int)
(declare-const delta_param2@width Int)
(declare-const delta_param1@width Int)
(declare-const delta_param1 Int)
(declare-const delta_param1@pos Int)
(declare-const delta_param0@pos Int)
(declare-const delta_param2@pos Int)
(declare-const delta_param0@width Int)
(declare-const delta_param2 Int)
(declare-const delta_param0 Int)
(assert (exists
         ((uninterp?1 Int) (|i'?2| Int) (|param0'?3| Int) (|param1'?4| Int)
            (|param2'?5| Int) (|param0@pos'?6| Int) (|param1@pos'?7| Int)
            (|param2@pos'?8| Int) (|param0@width'?9| Int)
            (|param1@width'?10| Int) (|param2@width'?11| Int)
            (|S1,0?12| Real) (|j'?13| Int) (KSUM1?14 Int) (|K1,0?15| Int)
            (K?16 Int) (|param2@width'?17| Int) (|param1@width'?18| Int)
            (|param0@width'?19| Int) (|param2@pos'?20| Int)
            (|param1@pos'?21| Int) (|param0@pos'?22| Int) (|param2'?23| Int)
            (|param1'?24| Int) (|param0'?25| Int) (|j'?26| Int)
            (stderr?27 Int) (stderr@pos?28 Int) (stderr@width?29 Int)
            (j?30 Int) (ni?31 Int) (i?32 Int) (param2@width?33 Int)
            (param2@pos?34 Int) (param2?35 Int) (param1?36 Int)
            (param1@pos?37 Int) (param1@width?38 Int) (param0?39 Int)
            (param0@pos?40 Int) (param0@width?41 Int))
         (and (<= (- i?32) 0) (< (+ (- ni?31) i?32) 0) (<= (- K?16) 0)
                (<= (- |K1,0?15|) 0) (= (+ |K1,0?15| (- K?16)) 0)
                (<= (+ KSUM1?14 (- K?16)) 0)
                (= (+ (- |S1,0?12|) |j'?13| (- |K1,0?15|)) 0)
                (= (+ (- KSUM1?14) |K1,0?15|) 0) (= |S1,0?12| 0)
                (or (and (= K?16 0)
                           (= (+ (- |param2@width'?11|) param2@width?33) 0)
                           (= (+ (- |param1@width'?10|) param1@width?38) 0)
                           (= (+ (- |param0@width'?9|) param0@width?41) 0)
                           (= (+ (- |param2@pos'?8|) param2@pos?34) 0)
                           (= (+ (- |param1@pos'?7|) param1@pos?37) 0)
                           (= (+ (- |param0@pos'?6|) param0@pos?40) 0)
                           (= (+ (- |param2'?5|) param2?35) 0)
                           (= (+ (- |param1'?4|) param1?36) 0)
                           (= (+ (- |param0'?3|) param0?39) 0)
                           (= (- |j'?13|) 0))
                      (and (<= (+ (- K?16) 1) 0) (<= (+ (- ni?31) 1) 0)
                             (<= (+ (- uninterp?1) i?32) 0)
                             (<= (+ (mod uninterp?1 20) -19) 0)
                             (<= (- (mod uninterp?1 20)) 0) (<= (- i?32) 0)
                             (= (+ stderr?27 (- |param0'?3|)) 0)
                             (= (+ stderr@pos?28 (- |param0@pos'?6|)) 0)
                             (= (+ stderr@width?29 (- |param0@width'?9|)) 0)
                             (<= (+ |j'?13| (- ni?31)) 0)
                             (<= (+ (- uninterp?1) i?32) 0)
                             (<= (+ (mod (+ |j'?13| uninterp?1 -1) 20) -19) 0)
                             (<= (- (mod (+ |j'?13| uninterp?1 -1) 20)) 0)
                             (<= (- i?32) 0) (<= (+ (- |j'?13|) 1) 0)))
                (= (+ |j'?13| (- K?16)) 0) (<= (- K?16) 0) (<= (- |j'?13|) 0)
                (< (- ni?31) 0) (<= (- i?32) 0) (<= (+ (- |j'?13|) ni?31) 0)
                (= (+ |param2@width'?17| (- |param2@width'?11|)) 0)
                (= (+ |param1@width'?18| (- |param1@width'?10|)) 0)
                (= (+ |param0@width'?19| (- |param0@width'?9|)) 0)
                (= (+ |param2@pos'?20| (- |param2@pos'?8|)) 0)
                (= (+ |param1@pos'?21| (- |param1@pos'?7|)) 0)
                (= (+ |param0@pos'?22| (- |param0@pos'?6|)) 0)
                (= (+ |param2'?23| (- |param2'?5|)) 0)
                (= (+ |param1'?24| (- |param1'?4|)) 0)
                (= (+ |param0'?25| (- |param0'?3|)) 0)
                (= (+ |j'?26| (- |j'?13|)) 0) (= (+ |i'?2| (- i?32) -1) 0)
                (<= 0 uninterp?1) (<= i?32 uninterp?1)
                (= delta_i (+ |i'?2| (- i?32)))
                (= delta_j (+ |j'?26| (- j?30)))
                (= delta_param0 (+ |param0'?25| (- param0?39)))
                (= delta_param1 (+ |param1'?24| (- param1?36)))
                (= delta_param2 (+ |param2'?23| (- param2?35)))
                (= delta_param0@pos (+ |param0@pos'?22| (- param0@pos?40)))
                (= delta_param1@pos (+ |param1@pos'?21| (- param1@pos?37)))
                (= delta_param2@pos (+ |param2@pos'?20| (- param2@pos?34)))
                (= delta_param0@width (+ |param0@width'?19|
                                           (- param0@width?41)))
                (= delta_param1@width (+ |param1@width'?18|
                                           (- param1@width?38)))
                (= delta_param2@width (+ |param2@width'?17|
                                           (- param2@width?33))))))
(check-sat)
