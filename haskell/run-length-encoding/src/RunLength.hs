module RunLength (decode, encode) where
import Data.List

import Data.Char

decodeNumberedExpression:: String -> String
decodeNumberedExpression expr =
    let number = read (init expr) in
    let letter = last expr in
    replicate number letter

decodeExpression:: String -> String
decodeExpression [x] = [x]
decodeExpression expr = decodeNumberedExpression expr

separator:: ([String], String) -> Char -> ([String], String)
separator (accArray, acc) c =
    if isLetter c || isSpace c 
    then (accArray ++ [acc ++ [c]], "")  
    else (accArray, acc ++ [c])

splitExpression:: String -> [String]
splitExpression encodedText = 
    let separatedExpr = foldl separator ([],"") encodedText in
    fst separatedExpr

decode :: String -> String
decode encodedText =
    let expressions = splitExpression encodedText in
    let decodedGrps = map decodeExpression expressions in
    concat decodedGrps

encode :: String -> String
encode text =
    let quantify = \grp -> if length grp == 1 then "" else show (length grp) in
    let encodeGrpLetter = (\grp ->  quantify grp ++ [head grp]) in
    let encodedGrps = map encodeGrpLetter $ group text in
    concat encodedGrps