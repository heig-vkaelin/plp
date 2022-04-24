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
        printAllFileStats (0, 0, 0) args

printAllFileStats :: (Int, Int, Int) -> [FilePath] -> IO ()
printAllFileStats (a, b, c) [] = showLine "total" (a, b, c) -- dernière ligne: les totaux
printAllFileStats (a, b, c) (x : xs) = do
  handle <- openFile x ReadMode
  contents <- hGetContents handle
  let current = countStatsInFile contents
  showLine x current
  printAllFileStats (addTupleOfThree (a, b, c) current) xs

countStatsInFile :: [Char] -> (Int, Int, Int)
countStatsInFile file = (nbWords, nbLines, nbChars)
  where
    nbWords = length (words file)
    nbLines = length (lines file)
    nbChars = length file

showLine :: String -> (Int, Int, Int) -> IO ()
showLine name (a, b, c) = printf "%-10s %7d %7d %7d\n" name a b c

showTitleLine :: [Char] -> [Char] -> [Char] -> [Char] -> IO ()
showTitleLine = printf "%-10s %7s %7s %7s\n"

addTupleOfThree :: Num a => (a, a, a) -> (a, a, a) -> (a, a, a)
addTupleOfThree (a, b, c) (d, e, f) = (a + d, b + e, c + f)

usage :: String -> IO ()
usage name =
  do
    putStr "usage: ./"
    putStr name
    putStrLn " <file1> <file2> ..."
    putStrLn "Il faut au minimum 1 fichier"
