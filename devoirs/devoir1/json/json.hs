import Data.Char
import System.Environment (getArgs, getProgName)
import System.IO (IOMode (ReadMode), hGetContents, openFile)

data Token
  = JNull
  | JBool Bool
  | JString String
  | JNumber String
  | JLeftArray
  | JRightArray
  | JLeftObject
  | JRightObject
  | JComma
  | JColon
  deriving (Eq)

instance Show Token where
  show JNull = " 'null' "
  show (JBool True) = " 'true' "
  show (JBool False) = " 'false' "
  show (JString s) = " '" ++ s ++ "' "
  show (JNumber s) = " '" ++ s ++ "' "
  show JLeftArray = " '[' "
  show JRightArray = " ']' "
  show JLeftObject = " '{' "
  show JRightObject = " '}' "
  show JComma = " ',' "
  show JColon = " ':' "

createToken :: ([Char] -> Token) -> (Char -> Bool) -> Bool -> [Char] -> [Token]
createToken constructor filter keepLast cs = constructor token : lexer (if keepLast then rest else tail rest)
  where
    (token, rest) = span filter cs

lexer :: [Char] -> [Token]
lexer [] = []
lexer ('{' : cs) = JLeftObject : lexer cs
lexer ('}' : cs) = JRightObject : lexer cs
lexer ('[' : cs) = JLeftArray : lexer cs
lexer (']' : cs) = JRightArray : lexer cs
lexer (':' : cs) = JColon : lexer cs
lexer (',' : cs) = JComma : lexer cs
lexer ('n' : 'u' : 'l' : 'l' : cs) = JNull : lexer cs
lexer ('t' : 'r' : 'u' : 'e' : cs) = JBool True : lexer cs
lexer ('f' : 'a' : 'l' : 's' : 'e' : cs) = JBool False : lexer cs
lexer ('"' : cs) = createToken JString (/= '"') False cs
lexer (c : cs)
  | isSpace c = lexer cs
  | isNumber c = createToken JNumber isNumber True (c : cs)
  | otherwise = error ("Unknown character: " ++ [c])

main :: IO ()
main =
  do
    args <- getArgs
    if length args /= 1
      then do
        progName <- getProgName
        usage progName
      else do
        file <- openFile (head args) ReadMode
        contents <- hGetContents file
        print $ lexer contents

usage :: String -> IO ()
usage name =
  do
    putStr "usage: ./"
    putStr name
    putStrLn " <json file>"
    putStrLn "Il faut 1 fichier JSON"
