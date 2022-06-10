module Semantics (typeof) where

import Language
import Lexer
import Parser

type Name = String

type Env = [(Name, Type)]

getType :: Name -> Env -> Type
getType name env = case lookup name env of
  Just t -> t
  Nothing -> error $ name ++ " not found"

addToEnv :: Definition -> Env -> Env
addToEnv (Definition name [] expr) env = (name, typeofExpr expr env) : env -- Variables
addToEnv (Definition name args expr) env = (name, TFunc (typeofExpr expr env') args') : env -- Fonctions
  where
    env' = foldl (\env (Arg t name) -> (name, t) : env) env args
    args' = map (\(Arg t name) -> t) args

addAllToEnv :: [Definition] -> Env -> Env
addAllToEnv defs env = foldr addToEnv env defs

-- -----------------------
-- Statements
-- -----------------------
typeof :: Statement -> Env -> Type
typeof (Expr e) env = typeofExpr e env
typeof (Def d) env = typeofDef d env

-- -----------------------
-- Expressions
-- -----------------------
typeofExpr :: Expr -> Env -> Type
typeofExpr (EApp name args) env = typeofApp name args env
typeofExpr (ELet defs e) env = typeofLet defs e env
typeofExpr (EVar name) env = getType name env
typeofExpr (EValue v) env = typeofValue v env
typeofExpr (ECaseOf e cases) env = typeofCaseOf e cases env
typeofExpr (EBinary op x y) env = typeofBinary op x y env
typeofExpr (EUnary op x) env = typeofUnary op x env

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
    (TBoolean, TBoolean) -> TBoolean
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

-- Expression unaires
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

-- Let
typeofLet :: [Definition] -> Expr -> Env -> Type
typeofLet defs body env = typeofExpr body env'
  where
    env' = addAllToEnv defs env

-- Case
typeofCaseOf :: Expr -> [(Pattern, Expr)] -> Env -> Type
typeofCaseOf cond cases env =
  if any (\(p, e) -> (p /= typeCond && p /= Language.TUniversal) || e /= typeFirstResult) typedCases
    then error "Type error: Case Operation invalid"
    else typeFirstResult
  where
    typeCond = typeofExpr cond env
    typeFirstResult = typeofExpr (snd $ head cases) env
    typedCases = map (\(p, e) -> (typeOfPattern p env, typeofExpr e env)) cases

typeOfPattern :: Pattern -> Env -> Type
typeOfPattern (PVar x) env = getType x env
typeOfPattern (PValue x) env = typeofValue x env
typeOfPattern PUniversal env = Language.TUniversal

-- Application de fonction
typeofApp :: Name -> [Expr] -> Env -> Type
typeofApp name args env =
  case lookup name env of
    Just (TFunc t args') ->
      if (length args == length args') && all (\(t, a) -> t == typeofExpr a env) (zip args' args)
        then t
        else error "Type error: params of function invalid"
    _ -> error $ "Type error: call to unknown function " ++ show name ++ " " ++ show env

-- -----------------------
-- Définitions
-- -----------------------
typeofDef :: Definition -> Env -> Type
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

-- typeof (parser $ lexer $ "let func x (Integer z) = z + 2 var y = 3 in x * y * 2") []

-- typeof (parser $ lexer $ "let func x () = 2 + 2 var y = 3 in z(3)") []
-- typeof (parser $ lexer $ "let func x () = 2 + 2 var y = 3 in x") []
-- typeof (parser $ lexer $ "let func x (Integer z) = z + 2 var y = 3 in x(3)") []
-- typeof (parser $ lexer $ "let func x (Integer z) = z + 2 var y = 3 in x(True)") []

-- typeof (parser $ lexer $ "case 3 * 3 of (6 -> True) (2 -> False) (x -> False)") [("x", TInteger)]
-- typeof (parser $ lexer $ "case 3 * 3 of (6 -> True) (2 -> False) (x -> False) (_ -> False)") [("x", TInteger)]
