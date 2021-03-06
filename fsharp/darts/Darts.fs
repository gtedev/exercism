module Darts

let pythagore x y = 
    (pown x 2) + (pown y 2) 
    |> sqrt

let score (x: double) (y: double): int = 
    match pythagore x y with
    | radius when radius <= 10. && radius > 5. -> 1
    | radius when radius > 1. && radius <= 5. -> 5
    | radius when radius <= 1.  -> 10
    | _ -> 0
