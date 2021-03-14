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


-- one elegant solution
-- module RunLength (decode, encode) where

-- import           Data.Char (isDigit)


-- decode :: String -> String
-- decode "" = ""
-- decode text = replicate count x ++ decode xs
--   where
--     (countStr, x:xs) = span isDigit text
--     count = case countStr of
--         "" -> 1
--         s  -> read s

-- encode :: String -> String
-- encode "" = ""
-- encode (x:xs) = countStr ++ [x] ++ encode rest
--   where
--     (matching, rest) = span (== x) xs
--     countStr = case matching of
--         "" -> ""
--         _  -> show $ length matching + 1

--https://exercism.io/tracks/haskell/exercises/run-length-encoding/solutions/d0ac499afe69495c8cea82b27239832a