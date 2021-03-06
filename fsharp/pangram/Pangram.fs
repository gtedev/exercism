module Pangram

let isPangram (input: string): bool =
    let lower = input.ToLower()

    "abcdefghijklmnopqrstuvwxyz"
    |> Seq.map (fun c -> lower.Contains(c))
    |> Seq.reduce (&&)