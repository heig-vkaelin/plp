module Roman where

import Control.Monad (when)
import Data.List (genericReplicate)

toRomanMap :: [(Int, [Char])]
toRomanMap =
  [ (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I")
  ]

-- Valeur maximale pour les différentes conversions
maxValue :: Int
maxValue = 3999

-- TODO
fromRoman :: [Char] -> Int
fromRoman x = 0

toRoman :: Int -> [Char]
toRoman nb
  | nb == 0 = "∅"
  | nb < 0 = error "Le nombre doit être > 0"
  | nb > maxValue = error $ "Le nombre doit être <= à " ++ show maxValue
  | otherwise = toRoman' nb toRomanMap
  where
    toRoman' nb [] = ""
    toRoman' nb list@((k, v) : rest)
      | nb >= k = v ++ toRoman' (nb - k) list
      | otherwise = toRoman' nb rest
