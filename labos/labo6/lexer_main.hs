-- ---------------------------
-- Exercice 7
-- ---------------------------
import Lexer
import System.IO

main = do
  putStr "> "
  line <- getLine
  let tokens = lexer line
  print tokens
  main
