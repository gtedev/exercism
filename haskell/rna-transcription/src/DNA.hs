module DNA (toRNA) where

rnaMap:: String -> Either Char String
rnaMap [] = Right []
rnaMap ('G':_) = Right "C"
rnaMap ('C':_) =  Right"G"
rnaMap ('T':_) = Right "A"
rnaMap ('A':_) = Right "U"
rnaMap (x:_) = Left x

rnaRun:: String -> String -> Either Char String
rnaRun  acc input =
  let val = rnaMap input in
  case (val, input) of
  (_, []) -> Right acc
  (Left _, _) -> val
  (Right xxx, _:xs)  ->  rnaRun (acc ++ xxx) xs


toRNA :: String -> Either Char String
toRNA = rnaRun []