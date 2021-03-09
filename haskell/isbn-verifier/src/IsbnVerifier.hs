module IsbnVerifier (isbn) where

import Data.Char;

isbnNumbers:: String -> Maybe [Int]
isbnNumbers s =
    let digitOrX = filter (\c -> isDigit c || c == 'X') s in
    let anyXBefore = any (== 'X') ((tail . reverse) digitOrX)  in
    let lastCharIsXorDigit = isDigit (last digitOrX) || last digitOrX == 'X'   in
    if length digitOrX /= 10 || anyXBefore || not lastCharIsXorDigit then
       Nothing
    else
       let numbers =  map (\c -> if c == 'X' then 10 else digitToInt c) digitOrX in
       Just numbers


isbn :: String -> Bool
isbn s =
    let numbers = isbnNumbers s in
    case numbers of
    Nothing -> False
    Just n ->  (sum (zipWith (*) n [10,9..1]) `mod` 11) == 0
