module Beer (song) where


generateSong :: String
generateSong =
   foldl song "" [99,98..1]
   where
      song acc n = acc ++ verse n
      verse n = show n ++ " "++ bottles n ++ " of beer on the wall, " ++ show n ++     " "++ bottles n ++" of beer.\n\
                \Take "++ takeItOrOne (n-1) ++" down and pass it around, " ++ remainingQty (n-1) ++ " " ++ bottles (n-1) ++ " of beer on the wall.\n\
                \\n"
      takeItOrOne n = if n >= 1 then "one" else "it"
      remainingQty n = if n >= 1 then show n else "no more"
      bottles n = if n > 1 || n == 0 then "bottles" else "bottle"


song :: String
song = generateSong ++
       "No more bottles of beer on the wall, no more bottles of beer.\n\
       \Go to the store and buy some more, 99 bottles of beer on the wall.\n"

