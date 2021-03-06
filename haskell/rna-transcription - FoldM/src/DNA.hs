{-# LANGUAGE OverloadedStrings #-}
module DNA (toRNA) where

-- {-# OPTIONS_GHC -Wno-deferred-type-errors #-}
import qualified Data.Map as Map
import Control.Monad


getValueFromDict:: Char -> Maybe String
getValueFromDict c = 
    Map.lookup c dict
    where dict = Map.fromList [('G', "C"),('C', "G"),('T', "A"),('A', "U")]

rnaMap:: String -> Char -> Maybe String
rnaMap acc c = 
    let val = getValueFromDict c
    in case val of
    Nothing -> Nothing
    Just cc  ->   Just (acc ++ cc)
    
rnaMapFold:: [Char] ->  Maybe String
rnaMapFold = foldM rnaMap []


toEither:: String -> Maybe String -> Either Char String
toEither _ (Just x) = Right x
toEither (x:_) Nothing = Left x
toEither "" Nothing = Right ""

toRNA :: String -> Either Char String
toRNA x =
    toEither x (rnaMapFold x)
