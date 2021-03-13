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

groupByy:: [Int] -> [[Int]]
groupByy =
   group . sort

removeDuplicate:: [Int] -> [Int]
removeDuplicate =
   map head . groupByy

countGroupOfSame:: [Int] -> Int
countGroupOfSame = 
   length . removeDuplicate

filterSum:: Int -> [Int] -> Int
filterSum n l =
   sum $ filter (== n) l

firstGroup:: [Int] -> [Int]
firstGroup =
   head . groupByy

yacht :: Category -> [Int] -> Int
yacht Ones   xs = filterSum 1 xs
yacht Twos   xs = filterSum 2 xs
yacht Threes xs = filterSum 3 xs
yacht Fours  xs = filterSum 4 xs
yacht Fives  xs = filterSum 5 xs
yacht Sixes  xs = filterSum 6 xs

yacht FullHouse xs = if isFullHouse  then sum xs else 0
      where isFullHouse      = isTwoGroup && firstGroupIs2Or3
            isTwoGroup       = countGroupOfSame xs == 2
            firstGroupIs2Or3 = length fstGroup == 2 ||  length fstGroup == 3
            fstGroup         = firstGroup xs

yacht FourOfAKind xs = if isFourOfAKind  then 4 * head getGroup4OrMore else 0
      where isFourOfAKind   = (isOneGroup || isTwoGroup) && fstGroupIs4Or1
            isTwoGroup      = countGroupOfSame xs == 2
            isOneGroup      = countGroupOfSame xs == 1
            fstGroupIs4Or1  = length fstGroup == 1 || length fstGroup >= 4
            fstGroup        = firstGroup xs
            getGroup4OrMore = head . filter (\l -> length l >= 4) $ groupByy xs

yacht LittleStraight xs = if isLittleStraight  then 30 else 0
      where isLittleStraight = length xs == 5 && all (\x -> x >= 1 && x <= 5) xs && is5Group
            is5Group         = countGroupOfSame xs == 5

yacht BigStraight xs = if isBigStraight  then 30 else  0
      where isBigStraight = length xs == 5 && all (\x -> x >= 2 && x <= 6) xs && is5Group
            is5Group      = countGroupOfSame xs == 5

yacht Choice xs  = sum xs

yacht Yacht [a, b, c, d, e] = if isYacht  then 50 else 0
      where isYacht = a==b && b==c && c==d && d==e

yacht _ _  = 0


