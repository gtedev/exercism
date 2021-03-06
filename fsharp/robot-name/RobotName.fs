module RobotName
open System

let random array =
    array
    |> Seq.mapi (fun x i -> (i, Guid.NewGuid()))
    |> Seq.sortBy (fun x -> snd x ) 
    |> Seq.head
    |> fst

let randomLetter() = 
     [|'A'..'Z'|]
     |> random 
     |> string

let randomNumber() = 
    [|1..9|]
    |> random 
    |> string

let mkRobot() = randomLetter() + randomLetter() + randomNumber() + randomNumber() + randomNumber()

let robot = mkRobot()
let name robot = robot
let reset robot = mkRobot()