module Evaluation (eval) where

import Language
import Lexer
import Parser

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
evalExpr (EVar v) env = value v env
evalExpr (EValue v) env = v
evalExpr (EBinary op x y) env = evalBinary op (evalExpr x env) (evalExpr y env) env
evalExpr (EUnary op x) env = evalUnary op (evalExpr x env) env
evalExpr _ _ = error "TODO"

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
    _ -> error "TODO"
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

-- TODO: Let

-- TODO: Case

-- TODO: Application de fonction

-- -----------------------
-- Définitions
-- -----------------------
evalDef :: Definition -> Env -> Env
evalDef (Definition id args expr) env = case args of
  [] -> (id, evalExpr expr env) : env -- Variable / Function sans paramètres
  _ -> (id, VFunc expr args env) : env -- Function avec paramètres

-- pour tester:
-- eval (parser $ lexer "5") []
-- eval (parser $ lexer "x") [("x", VInt 5)]
-- eval (parser $ lexer "x + 3") [("x", VInt 5)]
-- eval (parser $ lexer "x / 2") [("x", VInt 6)]
-- eval (parser $ lexer "x / 0") [("x", VInt 6)]

-- eval (parser $ lexer "x == 6") [("x", VInt 6)]
-- eval (parser $ lexer "x != 6") [("x", VInt 6)]

-- eval (parser $ lexer "x == (6, 7)") [("x", VTuple (EValue (VInt 6)) (EValue (VInt 7)))]
-- eval (parser $ lexer "x == ((1, 2), (3, 4))") [("x", VTuple (EValue (VTuple (EValue (VInt 1)) (EValue (VInt 2)))) (EValue (VTuple (EValue (VInt 3)) (EValue (VInt 4)))))]

-- eval (parser $ lexer "(2, 3) == (6, 7)") []
-- eval (parser $ lexer "(2, 3) == (2, 3)") []
-- eval (parser $ lexer "x < 6") [("x", VInt 6)]
-- eval (parser $ lexer "x <= 6") [("x", VInt 6)]
-- eval (parser $ lexer "x && False") [("x", VBool True)]
-- eval (parser $ lexer "x && True") [("x", VBool True)]

-- eval (parser $ lexer "++x") [("x", VInt 3)]
-- eval (parser $ lexer "--x") [("x", VInt 3)]
-- eval (parser $ lexer "!x") [("x", VBool True)]
-- eval (parser $ lexer "!x") [("x", VBool False)]

-- eval (parser $ lexer "var x = 2") []
-- eval (parser $ lexer "func x (Integer y) = y * 2") []
