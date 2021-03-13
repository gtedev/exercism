module RunLength (decode, encode) where
import Data.List

decode :: String -> String
decode encodedText = error "You need to implement this function."

encode :: String -> String
encode text =
    let quantify = \grp -> if length grp == 1 then "" else show (length grp) in
    let encodeGrpLetter = (\grp ->  quantify grp ++ [head grp]) in
    let encodedGrps = map encodeGrpLetter $ group text in
    concat encodedGrps