-- ---------------------------
-- Exercice 3
-- ---------------------------

import Data.List
import System.Environment

getFreq :: [Char] -> [([Char], Int)]
getFreq = map (\x -> ([head x], length x)) . group . sort

printFreq :: Foldable t => t ([Char], Int) -> [Char]
printFreq = foldl (\acc (value, nb) -> acc ++ value ++ " " ++ replicate nb '*' ++ "\n") ""

usage = putStrLn "Usage: freq <String>"

main :: IO ()
main =
  do
    args <- getArgs
    if length args /= 1
      then usage
      else do
        let input = head args
            freq = getFreq input
        writeFile input $ printFreq freq
