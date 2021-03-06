module Pangram (isPangram) where
import Data.Char

stringToLower::String -> [Char]
stringToLower  =
    map toLower

isCharContained::[Char] -> Char -> Bool
isCharContained text char  =  char `elem` stringToLower text

isPangram :: String -> Bool
isPangram text =
    all (isCharContained text) ['a' .. 'z']
