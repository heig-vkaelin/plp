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



-- Exemples de la doc
-- Exp   : 'let' var '=' Exp in Exp  { Let $2 $4 $6 }
--       | Exp1                    { Exp1 $1 }

-- Exp1  : Exp1 '+' Term           { Plus $1 $3 }
--       | Exp1 '-' Term           { Minus $1 $3 }
--       | Term                    { Term $1 }

-- Term  : Term '*' Factor         { Times $1 $3 }
--       | Term '/' Factor         { Div $1 $3 }
--       | Factor                  { Factor $1 }

-- Factor  : int                   { Int $1 }
--         | var                   { Var $1 }
--         | '(' Exp ')'           { Brack $2 }



-- Custom depuis ici
Statements  : Statement                                         { $1 }
            | Statements Statement                              { $1 }

Statement : Expr                                                { Language.Expr $1 }                      
          | Def                                                 { Language.Def $1 }

Expr  : FuncApp                                                 { $1 }
      | 'let' Defs 'in' Expr                                    { Language.ELet $2 $4 }
      | 'name'                                                  { Language.EVar $1 }
      | Value                                                   { $1 }
      | CaseOf                                                  { $1 }
      | UnaryOp Expr                                            { Language.EUnary $1 $2 }
      | Expr BinaryOp Expr                                      { Language.EBinary $2 $1 $3 }


Value : 'int'                                                   { Language.VInt $1 }
      | 'bool'                                                  { Language.VBool $1 }
      | '(' Expr ',' Expr ')'                                   { Language.VTuple $2 $4 }

-- Définition globale
Defs : Def                                                      { $1 }
     | Defs Def                                                 { $1:$2 }
      
Def : VarDef                                                    { $1 }
    | FuncDef                                                   { $1 }

-- définition de variables;
VarDef : 'var' 'name' '=' Expr                                  { Language.EVar $2 }

Type  : 'int'                                                   { Language.TInt }
      | 'bool'                                                  { Language.TBool }
      | TypedTuple                                              { Language.TTuple } -- TODO: params ??

-- Définition de fonctions (non-récursives); 
FuncDef : 'func' 'name' '(' Params ')' '=' Expr                 { Language.Def $2 $4 $7 } 
        | 'func' 'name' '(' ')' '=' Expr                        { Language.Def $2 [] $6 }

Params  : Param                                                 { $1 }
        | Params ',' Param                                      { $1:$2 }

Param : Type 'name'                                             { $1 }
      | TypedTuple 'name'                                       { $1:$2 }

TypedTuple : '(' Param ',' Param ')'                            { Language.TTuple $2 $4 }

-- applications de fonction;
FuncApp : 'name' '(' FuncArgs ')'                               { Language.EApp $1 $3 }
        | 'name' '(' ')'                                        { Language.EApp $1 [] }

FuncArgs  : Expr                                                { $1 }
          | FuncArgs ',' Expr                                   { $1:$2 }

-- expressions case-of sans gardes avec motifs universel, variable, littéraux;
CaseOf : 'case' Expr 'of' CasesOfPatterns                       { Language.ECaseOf $2 $4 }
CasesOfPatterns : CaseOfPatterns                                { $1 }               
                | CasesOfPatterns CaseOfPatterns                { $1:$2 }
CaseOfPatterns : '(' CaseOfPattern  '->' Expr ')'               { $1 }
CaseOfPattern : Value                                           { Language.PValue $1 }
              | 'var'                                           { Language.PVar $1 }
              | '_'                                             { Language.PUniversal }

-- opérations unaires, binaires.
UnaryOp   : '-'                                                 { Language.Operator Language.Arithmetic $1 }
          | '!'                                                 { Language.Operator Language.Logical $1 } 
          | '++'                                                { Language.Operator Language.Arithmetic $1 }
          | '--'                                                { Language.Operator Language.Arithmetic $1 }
BinaryOp  : '+'                                                 { Language.Operator Language.Arithmetic $1 }
          | '-'                                                 { Language.Operator Language.Arithmetic $1 }
          | '*'                                                 { Language.Operator Language.Arithmetic $1 }
          | '/'                                                 { Language.Operator Language.Arithmetic $1 }
          | '%'                                                 { Language.Operator Language.Arithmetic $1 }
          | '>'                                                 { Language.Operator Language.Relational $1 }
          | '<'                                                 { Language.Operator Language.Relational $1 }
          | '>='                                                { Language.Operator Language.Relational $1 }
          | '<='                                                { Language.Operator Language.Relational $1 }
          | '=='                                                { Language.Operator Language.Comparison $1 }
          | '!='                                                { Language.Operator Language.Comparison $1 }
          | '&&'                                                { Language.Operator Language.Logical $1 }
          | '||'                                                { Language.Operator Language.Logical $1 }

-- Point d'entrée du programme
App : Statements                                                { Language.Statement }

{
parseError :: [Token] -> a
parseError _ = error "Parse error test"
}
