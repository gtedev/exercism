module Hamming (distance) where

distanceAcc:: Int -> (Char, Char) -> Int
distanceAcc acc (a,b)
 | a /= b = acc + 1
 | otherwise = acc

distance :: String -> String -> Maybe Int
distance xs ys
 | length xs /= length ys = Nothing
 | otherwise =  Just (foldl distanceAcc 0 $ zip xs ys)

