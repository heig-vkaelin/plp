import System.Environment
import Text.Printf
import Data.Text
import System.IO
main =
  do
    args <- getArgs
    progName <- getProgName 
    if Prelude.null args
      then usage progName
      else 
          putStrLn "Yo"
          

usage name = 
    do
        putStr "usage: ./"
        putStr name
        putStrLn " <file1> <file2>"
        putStrLn "Il faut au minimum 1 fichier"

