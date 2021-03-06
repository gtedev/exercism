module ArmstrongNumbers

let isArmstrongNumber (number: int): bool = 
    let numberArray =  
      number.ToString().ToCharArray() 
      |> Array.map string
      |> Array.map int
    
    numberArray
    |> Seq.map (fun x -> pown x numberArray.Length)
    |> Seq.sum
    |> (=) number