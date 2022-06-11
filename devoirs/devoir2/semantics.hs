module Semantics (typeof) where

import Data.List (find)
import Language
import Lexer
import Parser

-- -----------------------
-- Environment
-- -----------------------
getType :: Name -> TEnv -> Type
getType name env = case lookup name env of
  Just t -> t
  Nothing -> error $ name ++ " not found"

addToEnv :: Definition -> TEnv -> TEnv
addToEnv (Definition name [] expr) env = (name, typeofExpr expr env) : env -- Variables
addToEnv (Definition name args expr) env = (name, TFunc (typeofExpr expr env') args') : env -- Fonctions
  where
    env' = foldl (\env (Arg t name) -> (name, t) : env) env args
    args' = map (\(Arg t name) -> t) args

addAllToEnv :: [Definition] -> TEnv -> TEnv
addAllToEnv defs env = foldr addToEnv env defs

-- -----------------------
-- Statements
-- -----------------------
typeof :: Statement -> TEnv -> Type
typeof (Expr e) env = typeofExpr e env
typeof (Def d) env = typeofDef d env

-- -----------------------
-- Expressions
-- -----------------------
typeofExpr :: Expr -> TEnv -> Type
typeofExpr (EApp name args) env = typeofApp name args env
typeofExpr (ELet defs e) env = typeofLet defs e env
typeofExpr (EVar name) env = getType name env
typeofExpr (EValue v) env = typeofValue v env
typeofExpr (ECaseOf e cases) env = typeofCaseOf e cases env
typeofExpr (EBinary op x y) env = typeofBinary op x y env
typeofExpr (EUnary op x) env = typeofUnary op x env

-- Valeurs / Littéraux
typeofValue :: Value -> TEnv -> Type
typeofValue (VInt _) env = TInteger
typeofValue (VBool _) env = TBoolean
typeofValue (VTuple x y) env = TTuple (typeofExpr x env) (typeofExpr y env)
typeofValue _ _ = error "Unknown value"

-- Opérations arithmétiques
typeofBinary :: Operator -> Expr -> Expr -> TEnv -> Type
typeofBinary (Operator Arithmetic _) x y env =
  case (typeofExpr x env, typeofExpr y env) of
    (TInteger, TInteger) -> TInteger
    _ -> error "Type error: Arithmetic Operation invalid"
-- Opérations Comparaisons
typeofBinary (Operator Comparison _) x y env =
  if typeofExpr x env == typeofExpr y env
    then TBoolean
    else error "Type error: Comparison Operation invalid"
-- Opérations relationnelles
typeofBinary (Operator Relational _) x y env =
  case (typeofExpr x env, typeofExpr y env) of
    (TInteger, TInteger) -> TBoolean
    _ -> error "Type error: Relational Operation invalid"
-- Opérations logiques
typeofBinary (Operator Logical _) x y env =
  case (typeofExpr x env, typeofExpr y env) of
    (TBoolean, TBoolean) -> TBoolean
    _ -> error "Type error: Logical Operation invalid"

-- Opérations unaires
typeofUnary :: Operator -> Expr -> TEnv -> Type
typeofUnary (Operator Arithmetic _) x env =
  case typeofExpr x env of
    TInteger -> TInteger
    _ -> error "Type error: Arithmetic Operation invalid"
typeofUnary (Operator Logical _) x env =
  case typeofExpr x env of
    TBoolean -> TBoolean
    _ -> error "Type error: Logical Operation invalid"
typeofUnary _ _ _ = error "Type error: Unary Operation invalid"

-- Let
typeofLet :: [Definition] -> Expr -> TEnv -> Type
typeofLet defs body env = typeofExpr body env'
  where
    env' = addAllToEnv defs env

-- Case
typeofCaseOf :: Expr -> [(Pattern, Expr)] -> TEnv -> Type
typeofCaseOf cond cases env =
  if any (\(p, e) -> (p /= condType && p /= Language.TUniversal) || e /= exprType) typedCases
    then error "Type error: Case Operation invalid"
    else exprType
  where
    condType = typeofExpr cond env
    typedCases = map (\(p, e) -> (typeOfPattern p env, typeofExpr e env)) cases
    exprType = snd $ head typedCases

typeOfPattern :: Pattern -> TEnv -> Type
typeOfPattern (PVar x) env = getType x env
typeOfPattern (PValue x) env = typeofValue x env
typeOfPattern PUniversal env = Language.TUniversal

-- Application de fonction
typeofApp :: Name -> [Expr] -> TEnv -> Type
typeofApp name args env =
  case lookup name env of
    Just (TFunc t args') ->
      if (length args == length args') && all (\(t, a) -> t == typeofExpr a env) (zip args' args)
        then t
        else error "Type error: params of function invalid"
    _ -> error $ "Type error: call to unknown function " ++ show name

-- -----------------------
-- Définitions
-- -----------------------
typeofDef :: Definition -> TEnv -> Type
typeofDef (Definition x [] body) env = typeofExpr body env
typeofDef (Definition x ((Arg type' name) : args) body) env = typeofDef (Definition x args body) env'
  where
    env' = (name, type') : env

-- Pour tester:
-- typeof (parser $ lexer $ "var x = True") []
-- typeof (parser $ lexer $ "func x (Integer y) = 3") []
-- typeof (parser $ lexer $ "func x (Integer y) = y * 3") []
-- typeof (parser $ lexer $ "func mult (Integer y, Integer z) = y * z") []
-- typeof (parser $ lexer $ "func equals (Integer y, Integer z) = y == z") []

-- typeof (parser $ lexer $ "(1, True)") []
-- typeof (parser $ lexer $ "(1, (True, 172))") []

-- typeof (parser $ lexer $ "let var x = 2 var y = 3 in x * y * 2") []
-- typeof (parser $ lexer $ "let var x = 2 var y = 3 in x == y") []
-- typeof (parser $ lexer $ "let var x = (1, True) var y = (3, False) in x == y") []

-- typeof (parser $ lexer $ "let func x (Integer z) = z + 2 var y = 3 in x(3) * y * 2") []

-- typeof (parser $ lexer $ "let func x () = 2 + 2 var y = 3 in z(3)") []
-- typeof (parser $ lexer $ "let func x () = 2 + 2 var y = 3 in x") []
-- typeof (parser $ lexer $ "let func x (Integer z) = z + 2 var y = 3 in x(3)") []
-- typeof (parser $ lexer $ "let func x (Integer z) = z + 2 var y = 3 in x(True)") []

-- typeof (parser $ lexer $ "case 3 * 3 of (6 -> True) (2 -> False) (x -> False)") [("x", TInteger)]
-- typeof (parser $ lexer $ "case 3 * 3 of (6 -> True) (2 -> False) (x -> False) (_ -> False)") [("x", TInteger)]

-- typeof (parser $ lexer $ "case 3 * 3 of (_ -> True) (3 -> False)") []
-- typeof (parser $ lexer $ "case 3 * 3 of (3 -> False) (_ -> True)") []
-- typeof (parser $ lexer $ "case 3 * 3 of (_ -> True)") []
