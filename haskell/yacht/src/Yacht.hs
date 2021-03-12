module Yacht (yacht, Category(..)) where

import Data.List
data Category = Ones
              | Twos
              | Threes
              | Fours
              | Fives
              | Sixes
              | FullHouse
              | FourOfAKind
              | LittleStraight
              | BigStraight
              | Choice
              | Yacht

filterSum:: Int -> [Int] -> Int
filterSum n l =
   sum $ filter (== n) l

yacht :: Category -> [Int] -> Int
yacht Ones   xs = filterSum 1 xs
yacht Twos   xs = filterSum 2 xs
yacht Threes xs = filterSum 3 xs
yacht Fours  xs = filterSum 4 xs
yacht Fives  xs = filterSum 5 xs
yacht Sixes  xs = filterSum 6 xs

yacht FullHouse xs = if checkFullHouse  then sum xs else  0
   where checkFullHouse = (== ) 2 (length $ removeDuplicate xs)
         removeDuplicate = map head . group . sort

yacht FourOfAKind [a, b, c, d, e] = if checkFourOfAKind  then sum [a, b, c, d, e] else  0
   where checkFourOfAKind  = a==b && b==c && c==d

yacht LittleStraight [1, 2, 3, 4, 5] = 30
yacht BigStraight [2, 3, 4, 5, 6] = 30
yacht Choice xs  = sum xs

yacht Yacht [a, b, c, d, e] = if checkYacht  then 50 else 0
   where checkYacht = a==b && b==c && c==d && d==e

yacht _ _  = 0


