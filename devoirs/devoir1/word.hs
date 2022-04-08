import System.Environment
import System.IO
import Text.Printf

main =
  do
    args <- getArgs
    if null args
      then do
        progName <- getProgName
        usage progName
      else do
        showTitleLine "file" "words" "lines" "bytes"
        getNumber (0, 0, 0) args

getNumber (a, b, c) [] = showLine "total" (a, b, c)
getNumber (a, b, c) (x : xs) = do
  handle <- openFile x ReadMode
  contents <- hGetContents handle
  let current = countNbWords contents
  showLine x current
  getNumber (addTupleOfThree (a, b, c) current) xs

showLine name (a, b, c) = printf "%-10s %7d %7d %7d\n" name a b c
showTitleLine a b c d = printf "%-10s %7s %7s %7s\n" a b c d

addTupleOfThree (a, b, c) (d, e, f) = (a + d, b + e, c + f)

countNbWords file = (nbWords, nbLines, nbChars)
  where
    nbWords = length (words file)
    nbLines = length (lines file)
    nbChars = length file

usage name =
  do
    putStr "usage: ./"
    putStr name
    putStrLn " <file1> <file2> ..."
    putStrLn "Il faut au minimum 1 fichier"
