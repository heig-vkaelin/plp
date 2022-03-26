-- ---------------------------
-- Exercice 2
-- ---------------------------

import Data.Char (toUpper)
import System.Environment

encodings :: [(Char, [Char])]
encodings =
  [ ('A', ".-"),
    ('B', "-..."),
    ('C', "-.-."),
    ('D', "-.."),
    ('E', "."),
    ('F', "..-."),
    ('G', "--."),
    ('H', "...."),
    ('I', ".."),
    ('J', ".---"),
    ('K', "-.-"),
    ('L', ".-.."),
    ('M', "--"),
    ('N', "-."),
    ('O', "---"),
    ('P', ".--."),
    ('Q', "--.-"),
    ('R', ".-."),
    ('S', "..."),
    ('T', "-"),
    ('U', "..-"),
    ('V', "...-"),
    ('W', ".--"),
    ('X', "-..-"),
    ('Y', "-.--"),
    ('Z', "--.."),
    ('0', "-----"),
    ('1', ".----"),
    ('2', "..---"),
    ('3', "...--"),
    ('4', "....-"),
    ('5', "....."),
    ('6', "-...."),
    ('7', "--..."),
    ('8', "---.."),
    ('9', "----."),
    (' ', "/")
  ]

findCode char = foldr (\(k, v) acc -> if char == k then v else acc) "?"

encodeChar :: Char -> [Char]
encodeChar char = findCode (toUpper char) encodings

encode :: [Char] -> [Char]
encode msg = unwords $ map encodeChar msg

usage = putStrLn "Usage: morse <filepath>"


main :: IO ()
main =
  do
    args <- getArgs
    if length args /= 1
      then usage
      else do
        contents <- readFile $ head args
        putStrLn $ encode contents

-- Exception pas handle, je laisse openFile throw si le fichier n'existe pas
