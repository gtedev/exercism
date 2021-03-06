module CollatzConjecture

let (|Even|Odd|) input = if input % 2 = 0 then Even else Odd

let evenCalculator n = n/2
let oddCalculator n = 3*n + 1

let rec collatz steps number  =

    if number = 1 then steps
    else
        let nextStep = steps + 1
        match number with
        | Even -> evenCalculator number |> collatz nextStep
        | Odd ->  oddCalculator number |> collatz nextStep

let steps (number: int): int option = 
    if number <= 0  then
        None
    else
        let result = collatz 0 number
        Some result