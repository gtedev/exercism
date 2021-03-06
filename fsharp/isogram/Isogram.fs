module Isogram

open System

let hasDuplicate xs x  = 
    xs
    |> Seq.filter (fun a -> x = a)
    |> Seq.length
    |> function x -> x > 1

let isIsogram (str:string) = 
    let charArray = str.ToLower().ToCharArray()
    charArray
    |> Seq.filter Char.IsLetter 
    |> Seq.filter (hasDuplicate charArray)
    |> Seq.length
    |> (=) 0