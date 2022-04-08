import System.Environment (getArgs, getProgName)
import System.IO (IOMode (ReadMode), hGetContents, openFile)
import Text.Printf (printf)

main :: IO ()
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

getNumber :: (Int, Int, Int) -> [FilePath] -> IO ()
getNumber (a, b, c) [] = showLine "total" (a, b, c)
-- TODO : "Accumulateur à la main" demander si c'est nul
getNumber (a, b, c) (x : xs) = do
  handle <- openFile x ReadMode
  contents <- hGetContents handle
  let current = countNbWords contents
  showLine x current
  getNumber (addTupleOfThree (a, b, c) current) xs

showLine name (a, b, c) = printf "%-10s %7d %7d %7d\n" name a b c

showTitleLine :: [Char] -> [Char] -> [Char] -> [Char] -> IO ()
showTitleLine = printf "%-10s %7s %7s %7s\n"

addTupleOfThree :: (Num a, Num b, Num c) => (a, b, c) -> (a, b, c) -> (a, b, c)
addTupleOfThree (a, b, c) (d, e, f) = (a + d, b + e, c + f)

countNbWords :: [Char] -> (Int, Int, Int)
countNbWords file = (nbWords, nbLines, nbChars)
  where
    nbWords = length (words file)
    nbLines = length (lines file)
    nbChars = length file

usage :: String -> IO ()
usage name =
  do
    putStr "usage: ./"
    putStr name
    putStrLn " <file1> <file2> ..."
    putStrLn "Il faut au minimum 1 fichier"
