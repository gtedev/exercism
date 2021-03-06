import qualified Data.Text as T
import           Data.Text (Text)
import Data.Char

keepLetters:: Text-> Text 
keepLetters = T.filter isLetter . T.strip

lastLetter:: Text-> Text 
lastLetter = T.takeEnd 1

isQuestion:: Text-> Bool 
isQuestion xs = lastLetter (T.strip xs) == T.pack "?"

isSilence:: Text-> Bool 
isSilence = T.null . keepLetters

isYelling:: Text-> Bool 
isYelling = T.all isUpper . keepLetters

showBool :: Bool -> String
showBool = map toUpper . show

-- main = putStrLn (showBool (T.all isUpper (keepLetters (T.pack "1, 2, 3"))))
-- main = putStrLn (showBool $ isUpper ' ')
-- main = putStrLn (T.unpack $ keepLetters $ T.pack "1, 2, 3")
-- main = putStrLn (showBool $ T.null $ keepLetters $ T.pack "1, 2, 3")  -- TRUE
main = putStrLn (showBool $ isYelling $ T.pack "AAAA")

-- stack ghc .\runner.hs
-- stack exec .\runner.hs



var?  