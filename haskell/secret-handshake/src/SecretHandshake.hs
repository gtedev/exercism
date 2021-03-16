module SecretHandshake (handshake) where
import Data.Bits

handshake :: Int -> [String]
handshake n =
    let wink         = if is0 then ["wink"] else [] in
    let dleBlink     = if is1 then wink ++ ["double blink"] else wink in
    let closeEyes    = if is2 then dleBlink ++ ["close your eyes"] else dleBlink in
    let jump         = if is3 then closeEyes ++ ["jump"] else closeEyes in
    let reverseOrder = if is4 then reverse jump else jump in

    reverseOrder

        where is0 = testBit n 0
              is1 = testBit n 1
              is2 = testBit n 2
              is3 = testBit n 3
              is4 = testBit n 4