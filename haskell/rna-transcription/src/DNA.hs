module DNA (toRNA) where
import qualified Data.Map as Map


rnaMap:: Char -> Either Char String
rnaMap c =
    let val = Map.lookup c dict
    in case val of

    Nothing -> Left c
    Just x -> Right x

    where dict = Map.fromList [('G', "C"),('C', "G"),('T', "A"),('A', "U")]


rnaRun:: String -> String -> Either Char String
rnaRun  acc input =
  let c  = head input in
  let val = rnaMap c in
  case (val, acc, input) of
  (_, _, []) -> Right acc
  (Left _, _, _) -> val
  (Right xxx,_ , _:xs)  ->  rnaRun (acc ++ xxx) xs


toRNA :: String -> Either Char String
toRNA = rnaRun []
