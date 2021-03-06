module CollatzConjecture (collatz) where

oddOrEvenCalc :: Integer -> Integer 
oddOrEvenCalc n
 | odd n =  3*n + 1
 | otherwise = n `div` 2

collatzStep :: Integer -> Integer 
collatzStep x = 
   toInteger $ length $ takeWhile (/= 1) $ iterate oddOrEvenCalc x


collatz :: Integer -> Maybe Integer
collatz x
 | x <=  0 = Nothing
 | otherwise = Just (collatzStep x)