module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

aliquotSum :: Int -> Int -> [Int] -> Int
aliquotSum n x ns
 | n >= x = sum ns
 | x `mod` n == 0 = aliquotSum (n+1) x (ns ++ [n])
 | otherwise  = aliquotSum (n+1) x ns

classify :: Int -> Maybe Classification
classify n
 | n <= 0 = Nothing
 | aliquotSumValue == n = Just Perfect
 | aliquotSumValue >  n =  Just Abundant
 | aliquotSumValue <  n =  Just Deficient
 | otherwise = Nothing

 where aliquotSumValue = aliquotSum 1 n []
