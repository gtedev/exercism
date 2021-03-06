module DNA (toRNA) where
import qualified Data.Map as Map


rnaMap:: Char -> Maybe String
rnaMap c =
    Map.lookup c dict
    where dict = Map.fromList [('G', "C"),('C', "G"),('T', "A"),('A', "U")]

rnaAcc:: (String, Char, Bool) -> Char -> (String, Char, Bool)
rnaAcc  (acc, prevC, success) c =
  let val = rnaMap c
  in case (val, c, (acc, prevC, success)) of
   (_, _, (_, _, False))  -> (acc, prevC, success)
   (Nothing, _, (_, _, _)) -> (acc, c, False)
   (Just x, _, (_, _, _))  ->  (acc ++ x, c, True)


-- for information: "" = [] =>  that is why the first test works, foldl does nothing as there is no element.
rnaMapFold:: String -> (String, Char, Bool)
rnaMapFold = 
    let initValue = ([], '_' , True)
    in
        foldl rnaAcc initValue


toEither:: (String, Char , Bool) -> Either Char String
toEither (acc, _, True) = Right acc
toEither (_, lastLetter, False) = Left lastLetter

toRNA :: String -> Either Char String
toRNA  =
    toEither . rnaMapFold
