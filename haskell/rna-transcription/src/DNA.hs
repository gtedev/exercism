module DNA (toRNA) where
import qualified Data.Map as Map


rnaMap:: String -> Either Char String
rnaMap [] = Right []
rnaMap (x:_) =
    let val = Map.lookup x dict
    in case val of

    Nothing -> Left x
    Just xx -> Right xx

    where dict = Map.fromList [('G', "C"),('C', "G"),('T', "A"),('A', "U")]


rnaRun:: String -> String -> Either Char String
rnaRun  acc input =
  let val = rnaMap input in
  case (val, acc, input) of
  (_, _, []) -> Right acc
  (Left _, _, _) -> val
  (Right xxx,_ , _:xs)  ->  rnaRun (acc ++ xxx) xs


toRNA :: String -> Either Char String
toRNA = rnaRun []
