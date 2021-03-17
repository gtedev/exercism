module ProteinTranslation(proteins) where

rnaMap::Char -> Char -> Char  -> [String]
rnaMap 'A' 'U' 'G' = ["Methionine"]
rnaMap 'U' 'U' 'U' = ["Phenylalanine"]
rnaMap 'U' 'U' 'C' = ["Phenylalanine"]
rnaMap 'U' 'U' 'A' = ["Leucine"]
rnaMap 'U' 'U' 'G' = ["Leucine"]
rnaMap 'U' 'C' 'U' = ["Serine"]
rnaMap 'U' 'C' 'C' = ["Serine"]
rnaMap 'U' 'C' 'A' = ["Serine"]
rnaMap 'U' 'C' 'G' = ["Serine"]
rnaMap 'U' 'A' 'U' = ["Tyrosine"]
rnaMap 'U' 'A' 'C' = ["Tyrosine"]
rnaMap 'U' 'G' 'U' = ["Cysteine"]
rnaMap 'U' 'G' 'C' = ["Cysteine"]
rnaMap 'U' 'G' 'G' = ["Tryptophan"]
rnaMap _ _ _ =  []

rnaRecursive::[Char] ->  [String]
rnaRecursive ('U':'A':'A':_) = []
rnaRecursive ('U':'A':'G':_) = []
rnaRecursive ('U':'G':'A':_) = []
rnaRecursive (a:b:c:xs) = rnaMap a b c ++ rnaRecursive xs
rnaRecursive _ = []


proteins :: String -> Maybe [String]
proteins x = Just (rnaRecursive x)