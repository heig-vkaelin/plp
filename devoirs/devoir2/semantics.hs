module Semantics (typeof) where

import Language
import Lexer
import Parser

type Name = String

type Env = [(Name, Type)]

-- Variables
lookup :: Name -> Env -> Type
lookup x [] = error $ x ++ " not found"
lookup x ((n, t) : env)
  | x == n = t
  | otherwise = Semantics.lookup x env

typeof :: Statement -> Env -> Type
typeof (Expr e) env = typeofExpr e env
typeof _ _ = error "typeof: not implemented"

-- -----------------------
-- Expressions
-- -----------------------
typeofExpr :: Expr -> Env -> Type
typeofExpr (EValue v) env = typeofValue v env
typeofExpr (EVar x) env = Semantics.lookup x env
typeofExpr (EBinary op x y) env = typeofBinary op x y env
typeofExpr (EUnary op x) env = typeofUnary op x env
typeofExpr _ _ = error "typeofExpr: not implemented"

-- Valeurs / Littéraux
typeofValue :: Value -> Env -> Type
typeofValue (VInt _) env = TInteger
typeofValue (VBool _) env = TBoolean
typeofValue (VTuple x y) env = TTuple (typeofExpr x env) (typeofExpr y env)

-- Expressions arithmétiques
typeofBinary :: Operator -> Expr -> Expr -> Env -> Type
typeofBinary (Operator Arithmetic _) x y env =
  case (typeofExpr x env, typeofExpr y env) of
    (TInteger, TInteger) -> TInteger
    _ -> error "Type error: Arithmetic Operation invalid"
-- Expressions Comparaisons
typeofBinary (Operator Comparison _) x y env =
  case (typeofExpr x env, typeofExpr y env) of
    (TInteger, TInteger) -> TBoolean
    _ -> error "Type error: Comparison Operation invalid"
-- Expressions relationnelles
typeofBinary (Operator Relational _) x y env =
  case (typeofExpr x env, typeofExpr y env) of
    (TInteger, TInteger) -> TBoolean
    _ -> error "Type error: Relational Operation invalid"
-- Expressions logiques
typeofBinary (Operator Logical _) x y env =
  case (typeofExpr x env, typeofExpr y env) of
    (TBoolean, TBoolean) -> TBoolean
    _ -> error "Type error: Logical Operation invalid"

typeofUnary :: Operator -> Expr -> Env -> Type
typeofUnary (Operator Arithmetic _) x env =
  case typeofExpr x env of
    TInteger -> TInteger
    _ -> error "Type error: Arithmetic Operation invalid"
typeofUnary (Operator Logical _) x env =
  case typeofExpr x env of
    TBoolean -> TBoolean
    _ -> error "Type error: Logical Operation invalid"
typeofUnary _ _ _ = error "Type error: Unary Operation invalid"

-- TODO: let

-- Let
-- typeof (ELet x y z) env = typeof z env'
--   where
--     t = typeof y env
--     env' = (x, t) : env

-- TODO: case

-- -----------------------
-- Définitions
-- -----------------------
-- TODO: Defs
