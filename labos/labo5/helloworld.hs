-- ---------------------------
-- Exercice 1
-- ---------------------------

import System.Environment

usage = putStrLn "Usage: helloworld [-en, -fr, -it, -es, -de]"

main :: IO ()
main =
  do
    args <- getArgs
    if length args /= 1
      then usage
      else putStrLn $ case head args of
        "-fr" -> "Bonjour monde!"
        "-it" -> "Ciao mondo!"
        "-es" -> "¡Hola Mundo!"
        "-de" -> "Hallo Welt!"
        _ -> "Hello World!"
