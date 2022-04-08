-- ---------------------------
-- Exercice 7
-- ---------------------------

{
  module Lexer (lexer, Name, Token (..)) where
}

%wrapper "basic"
$digit = 0-9 -- Macro pour definir les chiffres.
$alpha = [A-Za-z] -- Macro pour definir les lettres.

tokens :-
  $white+   ;
  let       { \s -> TLet }
  in        { \s -> TIn }
  if        { \s -> TIf }
  then      { \s -> TThen }
  else      { \s -> TElse }
  $digit+   { \s -> TNum (read s) }
  \'.\'     { \s -> TChar (head $ tail s) }
  [\=\+\*]  { \s -> TOp (head s) }
  $alpha+   { \s -> TVar s }

{
  -- Définition du type Token.
  type Name = String
  data Token = TLet | TIn | TIf | TTHen | TElse 
    | TOp Char | TVar Name | TChar Char | TNum Int
    deriving (Eq,Show)

  -- Alias du nom de la fonction d'analyse lexicale.
  lexer = alexScanTokens
}
