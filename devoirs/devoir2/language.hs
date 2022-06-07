module Language where

data Statement
  = Def Definition
  | Expr Expr
  deriving (Show)

data Expr
  = EApp String [Expr]
  | ELet [Definition] Expr
  | EVar String
  | EValue Value
  | ECaseOf Expr [(Pattern, Expr)]
  | EUnary Operator Expr
  | EBinary Operator Expr Expr
  deriving (Show)

data Operator
  = Operator OperatorType String
  deriving (Show)

data OperatorType
  = Arithmetic
  | Comparison
  | Relational
  | Logical
  deriving (Show)

data Pattern
  = PVar String
  | PValue Value
  | PUniversal
  deriving (Show)

data Definition
  = Definition String [Arg] Expr
  deriving (Show)

data Arg
  = Arg Type String
  deriving (Show)

data Value
  = VBool Bool
  | VInt Int
  | VTuple Expr Expr
  deriving (Show)

data Type
  = TBool
  | TInt
  | TTuple Type Type
  | TUniversal
  deriving (Show, Eq)
