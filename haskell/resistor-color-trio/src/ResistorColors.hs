module ResistorColors (Color(..), Resistor(..), label, ohms) where

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded)

newtype Resistor = Resistor { bands :: (Color, Color, Color) }
  deriving Show

colorValue:: Color -> Int
colorValue Black = 0
colorValue Brown = 1
colorValue Red = 2
colorValue Orange = 3
colorValue Yellow = 4
colorValue Green = 5
colorValue Blue = 6
colorValue Violet = 7
colorValue Grey = 8
colorValue White = 9

getBands:: Resistor -> (Color, Color, Color)
getBands resistor =
  case resistor of
  Resistor a -> a

ohmsToString:: Int -> String
ohmsToString n
 | giga > 0 = show giga ++ " gigaohms"
 | mega > 0 = show mega ++ " megaohms"
 | kilo > 0 = show kilo ++ " kiloohms"
 | otherwise = show n ++ " ohms"
 where giga = n `div` 10^9
       mega = n `div` 10^6
       kilo = n `div` 10^3


label :: Resistor -> String
label resistor =
  let ohmsValue = ohms resistor in
  ohmsToString ohmsValue

ohms :: Resistor -> Int
ohms resistor =
  let (band1, band2, band3) = getBands resistor  in
  (10 * colorValue band1 + colorValue band2) * 10 ^ colorValue band3