module TwelveDays (recite) where

data Gift = Gift
    { name      :: String
    , quantity  :: String
    , dayNumber :: String
    }

toGift:: Int -> Gift
toGift 1 =  Gift { name = "Partridge in a Pear Tree", quantity="a",      dayNumber = "first" }
toGift 2 =  Gift { name = "Turtle Doves",             quantity="two",    dayNumber = "second" }
toGift 3 =  Gift { name = "French Hens",              quantity="three",  dayNumber = "third" }
toGift 4 =  Gift { name = "Calling Birds",            quantity="four",   dayNumber = "fourth" }
toGift 5 =  Gift { name = "Gold Rings",               quantity="five",   dayNumber = "fifth" }
toGift 6 =  Gift { name = "Geese-a-Laying",           quantity="six",    dayNumber = "sixth" }
toGift 7 =  Gift { name = "Swans-a-Swimming",         quantity="seven",  dayNumber = "seventh"}
toGift 8 =  Gift { name = "Maids-a-Milking",          quantity="eight",  dayNumber = "eighth"}
toGift 9 =  Gift { name = "Ladies Dancing",           quantity="nine",   dayNumber = "ninth" }
toGift 10 = Gift { name = "Lords-a-Leaping",          quantity="ten",    dayNumber = "tenth" }
toGift 11 = Gift { name = "Pipers Piping",            quantity="eleven", dayNumber = "eleventh" }
toGift 12 = Gift { name = "Drummers Drumming",        quantity="twelve", dayNumber = "twelfth" }
toGift _  = Gift { name = "_",                        quantity="_",      dayNumber = "_" }

getGiftDayNumber:: Gift -> String
getGiftDayNumber (Gift _ _ dayNumber) = dayNumber

getGiftQuantity:: Gift -> String
getGiftQuantity (Gift _ quantity _) = quantity

getGifName:: Gift -> String
getGifName (Gift name _ _) = name

toNumberText:: Int -> String
toNumberText n =
    getGiftDayNumber $ toGift n

reciteGift:: Int -> String
reciteGift n =
    let quantity = getGiftQuantity $ toGift n in
    let name = getGifName $ toGift n in
    quantity ++ " " ++ name

reciteFirstPart:: Int -> String
reciteFirstPart n =
    let numberText = toNumberText n in
    "On the " ++ numberText ++ " day of Christmas my true love gave to me: "

reciteSecondPart:: Int -> String -> String
reciteSecondPart n acc
 | n == 0 = acc
 | n == 1 && null acc =  reciteGiftValue
 | n == 1 =  acc ++ ", and " ++ reciteGiftValue
 | n > 1 && null acc =  reciteSecondPart (n-1) reciteGiftValue
 | otherwise  = reciteSecondPart (n-1) ( acc ++ ", " ++  reciteGiftValue)

  where reciteGiftValue = reciteGift n

reciteSentence:: [String] -> Int -> [String]
reciteSentence acc start =
    let first = reciteFirstPart start in
    let second = reciteSecondPart start [] in
    let sentence = first ++ second ++ "." in
    acc ++ [sentence]

recite :: Int -> Int -> [String]
recite start stop =
    foldl reciteSentence [] [start..stop]
