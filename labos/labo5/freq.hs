import System.Environment

-- ---------------------------
-- Exercice 3
-- ---------------------------

usage = putStrLn "Usage: freq <String>"

main :: IO ()
main =
  do
    args <- getArgs
    if length args /= 1
      then usage
      else do
        putStrLn "TODO"

-- contents <- rFeadFile $ head args
-- putStrLn $ encode contents
