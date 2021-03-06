module SumOfMultiples

let hasXSomeMultipleAmongList (numbers: int list) x  = 
    let isXMultipleOf y = x % y = 0
    numbers
    |> List.filter (fun x -> x > 0)
    |> Seq.exists isXMultipleOf

let sum (numbers: int list) (upperBound: int): int =
    [|1..upperBound-1|]
    |> Seq.filter (hasXSomeMultipleAmongList numbers)
    |> Seq.sum