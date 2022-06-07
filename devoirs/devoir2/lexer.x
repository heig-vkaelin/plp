-- Lexer de notre langage de programmation fonctionnelle qui a pour but d'être utilisé par Alex
-- Auteurs: Jonathan Friedli et Valentin Kaelin
-- Date dernière modification: 07 juin 2022

{
module Lexer (lexer, Token(..)) where
}

%wrapper "basic"

$digit = 0-9
$lower = a-z
$alpha = [a-zA-Z]

-- TODO: add type before arguments in function calls

tokens :-
  $white+                        ;
  "--".*                         ;
  $digit+                        { \s -> TInt (read s) }
  "True"                         { \s -> TBool True }
  "False"                        { \s -> TBool False }
  "_"                            { \s -> TUniversal }
  "="                            { \s -> TEq }
  "!"                            { \s -> TNot }
  "++"                           { \s -> TPlusPlus }
  "--"                           { \s -> TMinusMinus }
  "+"                            { \s -> TPlus }
  "-"                            { \s -> TMinus }
  "*"                            { \s -> TMult }
  "/"                            { \s -> TDiv }
  "%"                            { \s -> TMod }
  ">"                            { \s -> TGreater }
  "<"                            { \s -> TLess }
  ">="                           { \s -> TGreaterEqual }
  "<="                           { \s -> TLessEqual }
  "=="                           { \s -> TEqual }
  "!="                           { \s -> TNotEqual }
  "&&"                           { \s -> TAnd }
  "||"                           { \s -> TOr }
  "("                            { \s -> TLParen }
  ")"                            { \s -> TRParen }
  ","                            { \s -> TComma }
  "->"                           { \s -> TArrow }
  "func"                         { \s -> TFunction s }
  let                            { \s -> TLet }
  in                             { \s -> TIn }
  case                           { \s -> TCase }
  of                             { \s -> TOf }
  [\_]? $lower [$alpha $digit]*  { \s -> TVar s }
  .                              { \s -> TErr s }
{

data Token
  = TInt Int
  | TBool Bool
  | TUniversal
  | TEq
  | TNot
  | TPlusPlus
  | TMinusMinus
  | TPlus
  | TMinus
  | TMult
  | TDiv
  | TMod
  | TGreater
  | TLess
  | TGreaterEqual
  | TLessEqual
  | TEqual
  | TNotEqual
  | TAnd
  | TOr
  | TLParen
  | TRParen
  | TComma
  | TArrow
  | TFunction String
  | TLet
  | TIn
  | TCase
  | TOf
  | TVar String
  | TErr String
  deriving (Eq, Show)

lexer = alexScanTokens
}