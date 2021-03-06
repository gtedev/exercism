module ProteinTranslation

let rnaMapper sequence =
    match sequence with
    |"AUG" -> ["Methionine"]
    |"UUU"|"UUC" -> ["Phenylalanine"]
    |"UUA"|"UUG" -> ["Leucine"]
    |"UCU"|"UCC"|"UCA"| "UCG" -> ["Serine"]
    |"UAU"|"UAC" -> ["Tyrosine"]
    |"UGU"|"UGC" -> ["Cysteine"]
    |"UGG"-> ["Tryptophan"]
    |"UAA"|"UAG"| "UGA" -> []

let rec private rnaRecursive (input: string list): string list =
    match input with
        | x::y::z::rest -> 
            match rnaMapper(x+y+z) with
             | [] -> []
             | _ -> rnaMapper(x+y+z) @ rnaRecursive(rest)
        |_ -> []

let proteins (rna: string) = 
    let charString = rna |> Seq.toList |> List.map string
    rnaRecursive(charString)
