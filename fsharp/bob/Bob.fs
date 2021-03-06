module Bob
open System

let isQuestion (str: string): bool = str.Trim().EndsWith("?")
let shout (str: string): bool = String.exists Char.IsUpper str && str.ToUpperInvariant() = str
let isEmpty (str: string): bool = String.IsNullOrWhiteSpace str


let response (input: string): string = 
    match input with
    | _ when isQuestion input && shout input -> "Calm down, I know what I'm doing!"
    | _ when isQuestion input -> "Sure."
    | _ when shout input -> "Whoa, chill out!"
    | _ when isEmpty input -> "Fine. Be that way!"
    | _  -> "Whatever."