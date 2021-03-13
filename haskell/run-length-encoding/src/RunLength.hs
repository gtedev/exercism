module RunLength (decode, encode) where
import Data.List

decode :: String -> String
decode encodedText = error "You need to implement this function."

encode :: String -> String
encode text =
    let quantify = \g -> if length g == 1 then "" else show (length g) in
    let ls = map (\g ->  quantify g ++ [head g]) $ group text in
    concat ls