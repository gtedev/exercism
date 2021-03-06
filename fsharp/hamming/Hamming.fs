module Hamming

let compare (strand1: string) (strand2: string) = 
    strand1
    |> Seq.mapi (fun i x -> if x.Equals(strand2.Chars(i)) then 0 else 1)
    |> Seq.sum

let distance (strand1: string) (strand2: string): int option =
    let diff = strand1.Length - strand2.Length 
    match diff with
    | 0 -> Some(compare strand1 strand2)
    | _ -> None 