-- ---------------------------
-- Exercice 6
-- ---------------------------

import Data.Char

data Token
  = Let
  | Number String
  | Special String
  | Symbol String
  | LeftP
  | RightP
  deriving (Show)

isSpecial c = c `elem` "=+-*<>^"

token constructor filter cs = constructor token : lexer rest
  where
    (token, rest) = span filter cs

lexer [] = []
lexer ('(' : cs) = LeftP : lexer cs
lexer (')' : cs) = RightP : lexer cs
lexer ('l' : 'e' : 't' : cs) = Let : lexer cs
lexer (c : cs)
  | isSpace c = lexer cs
  | isNumber c = token Number isNumber (c : cs)
  | isSpecial c = token Special isSpecial (c : cs)
  | isLetter c = token Symbol isLetter (c : cs)
  | otherwise = error ("Unknown character: " ++ [c])
