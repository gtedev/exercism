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

removeDuplicate:: [Int] -> [Int]
removeDuplicate =
   map head . group . sort

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
   where checkFullHouse = isTwoGroup && firstGroupIs2Or3
         isTwoGroup =  length (removeDuplicate xs) == 2
         firstGroupIs2Or3 = length firstGroup == 2 ||  length firstGroup == 3
         firstGroup = (head . group . sort) xs

yacht FourOfAKind xs = if checkFourOfAKind  then 4 * head getGroup4 else  0
   where checkFourOfAKind = (isOneGroup || isTwoGroup) && firstGroupIs4Or1
         isTwoGroup =  length (removeDuplicate xs) == 2
         isOneGroup =  length (removeDuplicate xs) == 1
         firstGroupIs4Or1 = length firstGroup == 1 || length firstGroup >= 4
         firstGroup = (head . group . sort) xs
         getGroup4 = head . filter (\l -> length l >= 4) $ (group . sort) xs

yacht LittleStraight xs = if checkLittleStraight  then 30 else  0
      where checkLittleStraight = length xs == 5 && all (\x -> x >= 1 && x <= 5) xs && is5Group
            is5Group = (==) 5 (length (removeDuplicate xs))

yacht BigStraight xs = if checkBigStraight  then 30 else  0
      where checkBigStraight = length xs == 5 && all (\x -> x >= 2 && x <= 6) xs && is5Group
            is5Group = (==) 5 (length (removeDuplicate xs))

yacht Choice xs  = sum xs

yacht Yacht [a, b, c, d, e] = if checkYacht  then 50 else 0
   where checkYacht = a==b && b==c && c==d && d==e

yacht _ _  = 0


