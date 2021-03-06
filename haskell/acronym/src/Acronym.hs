-- module Acronym (abbreviate) where
-- import qualified Data.Text as T
-- import           Data.Text (splitOn, Text)

-- mapToString::[Text]-> [String]
-- mapToString = map show

-- firstLetter::String -> Char 
-- firstLetter (x:_) = x
-- firstLetter [] = ' ' 

-- mapFirstLetter::[String] -> [Char] 
-- mapFirstLetter = map firstLetter

-- -- partialSplitOn  = splitOn ".." "a..b...c....d.."

-- -- abbreviate :: String -> String
-- abbreviate xs = foldl . mapFirstLetter . mapToString . (splitOn "\r\n" xs)


-- module Acronym (abbreviate) where
-- import Data.Char (isUpper, toUpper)

-- abbreviate :: String -> String
-- abbreviate [] = ""
-- abbreviate (x:xs) = (toUpper x) : abbreviate xs

module Acronym (abbreviate) where

-- import Data.Char (isUpper, isLower, isLetter, toUpper)

-- inAcro :: (Char, Char) -> [Char]
-- inAcro (a, b)
--   | not (a == '\'' || isLetter a) && isLetter b = [b]
--   | isLower a && isUpper b = [b]
--   | otherwise = []

-- abbreviate :: String -> String
-- abbreviate x = map toUpper $ concat $ map inAcro $ zip (' ':x) x
-- --abbreviate x = zip (' ':x) x

import Data.Char
-- import Data.List.Split

abbreviate :: String -> String
abbreviate = concatMap (\x -> (toUpper . head) x : filter isAsciiUpper (tail x)) . filter (isLetter . head) . words