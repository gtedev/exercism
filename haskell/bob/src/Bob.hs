{-# OPTIONS_GHC -Wno-name-shadowing #-}
{-# LANGUAGE OverloadedStrings #-}

module Bob (responseFor) where
import qualified Data.Text as T
import           Data.Text (Text)
import Data.Char


keepLetters:: Text -> Text
keepLetters = T.filter isLetter . T.strip

lastLetter:: Text -> Text
lastLetter = T.takeEnd 1 . T.strip

responseFor :: Text -> Text
responseFor xs
 | isQuestion  && isYelling  = "Calm down, I know what I'm doing!"
 | isQuestion  = "Sure."
 | isYelling  = "Whoa, chill out!"
 | isSilence = "Fine. Be that way!"
 | otherwise = "Whatever."

 where isQuestion = lastLetter xs == "?"
       isSilence = T.null (T.strip xs)
       isYelling = not (T.null (keepLetters xs)) && T.all isUpper (keepLetters xs)