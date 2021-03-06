module Proverb


let proverb (a,b) =     
    "For want of a "+ a + " the " + b + " was lost."

let recite (input: string list): string list =
   match input.Length with
   |0 -> input
   |_ ->
        let windowed = 
            Seq.windowed 2 input
            |> Seq.map (fun x -> (x.[0],x.[1]))
            |> Seq.map proverb

        Seq.append windowed ["And all for the want of a " + input.[0] + "."]
        |> Seq.toList
      