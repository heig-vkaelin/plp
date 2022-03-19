-- ---------------------------
-- Exercice 2
-- ---------------------------

module Expr where

data Expr
  = Const Int
  | Sum Expr Expr
  | Prod Expr Expr

-- Définissez cette fonction show de manière à reproduire l'affichage d'une calculatrice.
instance Show Expr where
  show (Const x) = show x
  show (Sum x y) = "(" ++ show x ++ " + " ++ show y ++ ")"
  show (Prod x y) = "(" ++ show x ++ " * " ++ show y ++ ")"

-- Définissez ensuite une fonction eval qui permet de calculer le résultat d'une expression :
eval :: Expr -> Int
eval (Const x) = x
eval (Sum x y) = eval x + eval y
eval (Prod x y) = eval x * eval y
