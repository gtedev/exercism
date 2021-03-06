module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year 
    | year `rem` 4 == 0 && year `rem` 100 > 0  = True
    | year `mod` 400 == 0  = True
    | otherwise = False

