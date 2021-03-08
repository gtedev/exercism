{-# LANGUAGE OverloadedStrings #-}
module Phone (number) where
import Data.Char

translatePhoneNumber:: String -> Maybe String
translatePhoneNumber xs
    | length  onlyNumbers /= 10  = Nothing
    | not firstNumberIsValid = Nothing
    | not exchangeNumberIsValid = Nothing
    | otherwise = Just onlyNumbers

    where onlyNumbers = filter isDigit xs
          firstNumber = head onlyNumbers
          exchangeNumber = onlyNumbers!!3
          checkNumber n = n /= '0' && n /= '1'
          firstNumberIsValid = checkNumber firstNumber
          exchangeNumberIsValid = checkNumber exchangeNumber

number :: String -> Maybe String
number ('+':'1':xs) = translatePhoneNumber xs
number ('1':xs) = translatePhoneNumber xs
number xs = translatePhoneNumber xs