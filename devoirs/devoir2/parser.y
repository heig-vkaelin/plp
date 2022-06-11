-- Analyse syntaxique de notre language de programmation fonctionnelle réalisée grâce à la librairie Happy
-- Auteurs: Jonathan Friedli et Valentin Kaelin
-- Date dernière modification: 07 juin 2022

{
module Parser (parser) where
import Language
import Lexer
}

%name parser
%tokentype { Token }
%error { parseError }

%token 
      'int'           { Lexer.TInt $$ }
      'bool'          { Lexer.TBool $$ }
      'integer'       { Lexer.TType "Integer" }
      'boolean'       { Lexer.TType "Boolean" }
      '_'             { Lexer.TUniversal }
      '='             { Lexer.TEq }
      '!'             { Lexer.TNot }
      '++'            { Lexer.TPlusPlus }
      '--'            { Lexer.TMinusMinus }
      '+'             { Lexer.TPlus }
      '-'             { Lexer.TMinus }
      '*'             { Lexer.TMult }
      '/'             { Lexer.TDiv }
      '%'             { Lexer.TMod }
      '>'             { Lexer.TGreater }
      '<'             { Lexer.TLess }
      '>='            { Lexer.TGreaterEqual }
      '<='            { Lexer.TLessEqual }
      '=='            { Lexer.TEqual }
      '!='            { Lexer.TNotEqual }
      '&&'            { Lexer.TAnd }
      '||'            { Lexer.TOr }
      '('             { Lexer.TLParen }
      ')'             { Lexer.TRParen }
      ','             { Lexer.TComma }
      '->'            { Lexer.TArrow }
      'func'          { Lexer.TFunction }
      'let'           { Lexer.TLet }
      'in'            { Lexer.TIn }
      'case'          { Lexer.TCase }
      'of'            { Lexer.TOf }
      'var'           { Lexer.TVar }
      'name'          { Lexer.TName $$ }

%right 'in'
%right '||'
%right '&&'
%nonassoc '==' '!=' '<=' '<' '>=' '>'
%left '+' '-'
%left '*' 'split' 'rest'
%left '-' '!'

%%

-- Statements
Statement
    : Expr                                                      { Language.Expr $1 }                      
    | Def                                                       { Language.Def $1 }

-- Expressions
Expr 
      : FuncApp                                                 { $1 }
      | 'let' Defs 'in' Expr                                    { Language.ELet $2 $4 }
      | 'name'                                                  { Language.EVar $1 }
      | Value                                                   { Language.EValue $1 }
      | 'case' Expr 'of' CaseOfPatterns                         { Language.ECaseOf $2 $4 }
      | UnaryOp Expr                                            { Language.EUnary $1 $2 }
      | Expr BinaryOp Expr                                      { Language.EBinary $2 $1 $3 }
      | '(' Expr ',' Expr ')'                                   { Language.ETuple $2 $4 }

-- Valeurs
Value
      : 'int'                                                   { Language.VInt $1 }
      | 'bool'                                                  { Language.VBool $1 }

-- Définition globale
Defs
      : Def                                                     { [$1] }
      | Def Defs                                                { $1:$2 }
      
Def
      : VarDef                                                  { $1 }
      | FuncDef                                                 { $1 }

-- Définition de variables;
VarDef
      : 'var' 'name' '=' Expr                                   { Language.Definition $2 [] $4 }

-- Définition de fonctions (non-récursives); 
FuncDef
      : 'func' 'name' '(' Params ')' '=' Expr                   { Language.Definition $2 $4 $7 } 
      | 'func' 'name' '(' ')' '=' Expr                          { Language.Definition $2 [] $6 }

Type
      : 'integer'                                               { Language.TInteger }
      | 'boolean'                                               { Language.TBoolean }
      -- | '(' Param ',' Param ')'                                 { Language.TTuple $2 $4 } -- TODO

Params 
      : Param                                                   { [$1] }
      | Param ',' Params                                        { $1:$3 }

Param
      : Type 'name'                                             { Language.Arg $1 $2 }

-- Applications de fonction;
FuncApp
      : 'name' '(' FuncArgs ')'                                 { Language.EApp $1 $3 }

FuncArgs
      : Expr                                                    { [$1] }
      | Expr ',' FuncArgs                                       { $1:$3 }

-- Expressions case-of sans gardes avec motifs universel, variable, littéraux;            
CaseOfPatterns
      : CaseOfPattern                                           { [$1] }               
      | CaseOfPattern CaseOfPatterns                            { $1:$2 }

CaseOfPattern
      : '(' Pattern  '->' Expr ')'                              { ($2, $4) }

Pattern
      : Value                                                   { Language.PValue $1 }
      | 'name'                                                  { Language.PVar $1 }
      | '_'                                                     { Language.PUniversal }

-- Opérations unaires, binaires.
UnaryOp
      : '-'                                                     { Language.Operator Language.Arithmetic "-" }
      | '!'                                                     { Language.Operator Language.Logical "!" } 
      | '++'                                                    { Language.Operator Language.Arithmetic "++" }
      | '--'                                                    { Language.Operator Language.Arithmetic "--" }

BinaryOp 
      : '+'                                                     { Language.Operator Language.Arithmetic "+" }
      | '-'                                                     { Language.Operator Language.Arithmetic "-" }
      | '*'                                                     { Language.Operator Language.Arithmetic "*" }
      | '/'                                                     { Language.Operator Language.Arithmetic "/" }
      | '%'                                                     { Language.Operator Language.Arithmetic "%" }
      | '>'                                                     { Language.Operator Language.Relational ">" }
      | '<'                                                     { Language.Operator Language.Relational "<" }
      | '>='                                                    { Language.Operator Language.Relational ">=" }
      | '<='                                                    { Language.Operator Language.Relational "<=" }
      | '=='                                                    { Language.Operator Language.Comparison "==" }
      | '!='                                                    { Language.Operator Language.Comparison "!=" }
      | '&&'                                                    { Language.Operator Language.Logical "&&" }
      | '||'                                                    { Language.Operator Language.Logical "||" }

{
parseError :: [Token] -> a
parseError x = error ("Parse error: " ++ show x)
}
