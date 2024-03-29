module Eval (eval) where

import Language
import Lexer
import Parser

-- Intérpreteur de notre langage de programmation fonctionnelle
-- mettant à disposition une fonction eval permettant d'évaluer
-- les statements de notre langage. Cette fonction vérifie
-- notamment que les variables utilisées dans les expressions
-- sont bien définies.
-- Auteurs: Jonathan Friedli et Valentin Kaelin
-- Date de dernière modification: 17 juin 2022

-- -----------------------
-- Environment
-- -----------------------
value :: Name -> Env -> Value
value v [] = error $ v ++ " not found (value)"
value v ((var, val) : env)
  | v == var = val
  | otherwise = value v env

-- -----------------------
-- Statements
-- -----------------------
eval :: Statement -> Env -> Either Env Value
eval (Expr expr) env = Right $ evalExpr expr env
eval (Def def) env = Left $ evalDef def env

-- -----------------------
-- Expressions
-- -----------------------
evalExpr :: Expr -> Env -> Value
evalExpr (EApp name args) env = evalApp name args env
evalExpr (ELet defs expr) env = evalExpr expr (evalDefs defs env)
evalExpr (EVar v) env = value v env
evalExpr (EValue v) env = v
evalExpr (ECaseOf expr cases) env = evalCaseOf expr cases env
evalExpr (EBinary op x y) env = evalBinary op (evalExpr x env) (evalExpr y env) env
evalExpr (EUnary op x) env = evalUnary op (evalExpr x env) env

-- Opérations binaires
evalBinary :: Operator -> Value -> Value -> Env -> Value
evalBinary (Operator Arithmetic op) x y env =
  case (x, y) of
    (VInt a, VInt b) -> evalArithmetic op a b
    _ -> error "Error: invalid arithmetic types"
  where
    evalArithmetic op x y =
      case op of
        "+" -> VInt $ x + y
        "-" -> VInt $ x - y
        "*" -> VInt $ x * y
        "/" -> if y == 0 then error "Error: Division by 0 is impossible" else VInt $ x `div` y
        "%" -> VInt $ x `mod` y
        _ -> error "Eval error: Arithmetic Operation invalid"
evalBinary (Operator Comparison op) x y env =
  case (x, y) of
    (VInt a, VInt b) -> VBool (toComparison op a b)
    (VBool a, VBool b) -> VBool (toComparison op a b)
    (VTuple a b, VTuple c d) -> evalExpr (EBinary (Operator Comparison op) (EValue v1) (EValue v2)) env
      where
        v1 = evalExpr (EBinary (Operator Comparison op) a c) env
        v2 = evalExpr (EBinary (Operator Comparison op) b d) env
    _ -> error "Eval error: Comparison Operation invalid"
evalBinary (Operator Relational op) x y env =
  case (x, y) of
    (VInt a, VInt b) -> VBool (toRelational op a b)
    _ -> error "Error: invalid comparison types"
evalBinary (Operator Logical op) x y env =
  case (x, y) of
    (VBool a, VBool b) -> VBool (toLogical op a b)
    _ -> error "Error: invalid comparison types"

toComparison :: Eq a => [Char] -> a -> a -> Bool
toComparison "==" = (==)
toComparison "!=" = (/=)
toComparison _ = error "runtime error: unknown operator"

toRelational :: Ord a => [Char] -> a -> a -> Bool
toRelational ">" = (>)
toRelational "<" = (<)
toRelational ">=" = (>=)
toRelational "<=" = (<=)
toRelational _ = error "runtime error: unknown operator"

toLogical :: [Char] -> Bool -> Bool -> Bool
toLogical "&&" = (&&)
toLogical "||" = (||)
toLogical _ = error "runtime error: unknown operator"

-- Opérations unaires
evalUnary :: Operator -> Value -> Env -> Value
evalUnary (Operator Arithmetic op) x env =
  case x of
    VInt a -> VInt (evalUnaryArithmetic op a)
    _ -> error "Error: invalid arithmetic types"
  where
    evalUnaryArithmetic op a =
      case op of
        "-" -> - a
        "++" -> a + 1
        "--" -> a - 1
        _ -> error "Eval error: Arithmetic Operation invalid"
evalUnary (Operator Logical op) x env =
  case x of
    VBool a -> VBool (evalUnaryLogical op a)
    _ -> error "Error: invalid arithmetic types"
  where
    evalUnaryLogical op a =
      case op of
        "!" -> not a
        _ -> error "Eval error: Logical Operation invalid"
evalUnary _ _ _ = error "Eval error: Unary Operation invalid"

-- Case
evalCaseOf :: Expr -> [(Pattern, Expr)] -> Env -> Value
evalCaseOf expr cases@((pattern, value) : _) env =
  case pattern of
    PUniversal -> evalExpr value env
    _ -> checkPattern cases
  where
    checkPattern :: [(Pattern, Expr)] -> Value
    checkPattern [] = error "Eval error: no pattern match"
    checkPattern ((pattern', value') : xs)
      | compareValues (evalExpr expr env) (evalPattern pattern' env) env = evalExpr value' env
      | otherwise = evalCaseOf expr xs env
evalCaseOf _ _ _ = error "Eval error: no pattern match"

evalPattern :: Pattern -> Env -> Value
evalPattern (PVar v) env = value v env
evalPattern (PValue v) env = v
evalPattern _ _ = error "Eval error: impossible pattern"

compareValues :: Value -> Value -> Env -> Bool
compareValues (VInt a) (VInt b) _ = a == b
compareValues (VBool a) (VBool b) _ = a == b
compareValues (VTuple a b) (VTuple c d) env = compareValues (evalExpr a env) (evalExpr c env) env && compareValues (evalExpr b env) (evalExpr d env) env
compareValues _ _ _ = False

-- Application de fonction
evalApp :: Name -> [Expr] -> Env -> Value
evalApp name args env =
  case value name env of
    (VFunc body params env') -> evalExpr body env''
      where
        env'' = populateArgs params args env'
    _ -> error "Eval error: invalid function application"

populateArgs :: [Arg] -> [Expr] -> Env -> Env
populateArgs (arg : args) (expr : exprs) env = populateArgs args exprs (populateArg arg expr env)
populateArgs _ _ env = env

populateArg :: Arg -> Expr -> Env -> Env
populateArg (Arg _ name) expr env = (name, evalExpr expr env) : env

-- -----------------------
-- Définitions
-- -----------------------
evalDefs :: [Definition] -> Env -> Env
evalDefs defs env = foldr evalDef env defs

evalDef :: Definition -> Env -> Env
evalDef (Definition name args body) env =
  case args of
    [] -> (name, evalExpr body env) : env -- Variable et fonctions sans param
    _ -> (name, VFunc body args env) : env -- Fonctions avec params
