module Roman
  ( toRoman,
    fromRoman,
  )
where

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

romanValue :: Char -> Int
romanValue 'I' = 1
romanValue 'V' = 5
romanValue 'X' = 10
romanValue 'L' = 50
romanValue 'C' = 100
romanValue 'D' = 500
romanValue 'M' = 1000
romanValue _ = 0 -- afin d'éviter le warning, pas censé arriver dans ce cas

-- Valeur maximale pour les différentes conversions
maxValue :: Int
maxValue = 3999

fromRoman :: [Char] -> Int
fromRoman roman = if verified then result else error "Nombre romain incorrect."
  where
    result = romanDigitSum 0 $ map romanValue roman
    verified = toRoman result == roman
    romanDigitSum acc [] = acc
    romanDigitSum acc [z] = acc + z
    romanDigitSum acc (x : y : rest) =
      romanDigitSum (if x < y then acc - x else acc + x) (y : rest)

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
