module IsbnVerifier (isbn) where

import Data.Char;

isbnNumbers:: String -> Maybe [Int]
isbnNumbers s
   | isEmpty = Nothing
   | not lastCharIsXorDigit = Nothing
   | not lengthIs10 = Nothing
   | anyXBeforeLast = Nothing
   | otherwise  =
            let numbers =  map (\c -> if c == 'X' then 10 else digitToInt c) digitOrX in
            Just numbers
    where
       isEmpty = null s
       lastCharIsXorDigit =  isDigit (last s) || last s == 'X'
       digitOrX = filter (\c -> isDigit c || c == 'X') s
       anyXBeforeLast = 'X' `elem` (tail . reverse) digitOrX
       lengthIs10 = length digitOrX == 10


isbn :: String -> Bool
isbn s =
    let numbers = isbnNumbers s in
    case numbers of
    Nothing -> False
    Just n ->  sum (zipWith (*) n [10,9..1]) `mod` 11 == 0
