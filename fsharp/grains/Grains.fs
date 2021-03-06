module Grains



let powTwo n = pown 2UL (n-1)

let square (n: int): Result<uint64,string> = 
   if n < 1 || n > 64  then Error "square must be between 1 and 64"
    else Ok (powTwo n)

let total: Result<uint64, string> = 
    [|1..64|]
    |> Seq.sumBy powTwo
    |> Ok





//=============== GOOD SOLUTION =================
let squareDeux (n: int): Result<uint64,string> = 
    if n > 0 && n <= 64 then Ok (pown 2UL (n - 1))
    else Error "square must be between 1 and 64"


let totalDeux: Result<uint64,string> = 
    Ok 
        (seq { for i in 1 .. 64 do yield squareDeux i } 
         |> Seq.sumBy 
                (function
                 | Ok x -> x
                 | Error e -> failwith e))