import Control.Exception
import Control.Monad
import Data.Char
import System.Environment

-- 5. Haskell /IO
-- 25.03.2022

{-
: main
-}

-- main :: IO ()
-- main = putStrLn "Hello, world"

{-
: compilation
-}

-- ghc <file>

{-
: putStr
-}

println :: String -> IO ()
println s = putStr (s ++ "\n")

{-
: putChar
-}

printc :: Char -> IO ()
printc c = putChar c

{-
: print
-}

data Boolean = Thruthy | Falsy
  deriving (Show)

{-
: getLine
-}

readln :: IO String
readln = getLine

{-
: getChar
-}

getc :: IO Char
getc = getChar

{-
: do
-}

echo0 :: IO ()
echo0 =
  do
    getLine
    putStrLn "foo"

{-
: <-
-}

echo1 :: IO ()
echo1 =
  do
    s <- getLine
    putStrLn $ "read " ++ s

{-
: loop
-}

echo2 =
  do
    s <- getLine
    putStrLn s
    echo2

{-
: return :: a -> IO a
-}

echo3 :: IO ()
echo3 =
  do
    s <- getLine
    putStrLn s
    if null s
      then return ()
      else echo3

{-
: when -> import Control.Monad (when)
-}

echo4 :: IO ()
echo4 =
  do
    s <- getLine
    when (not (null s)) $
      do
        putStrLn s
        echo4

{-
: unless :: Bool -> IO a -> IO b
-}

echo5 :: IO ()
echo5 =
  do
    s <- getLine
    unless (null s) $
      do
        putStrLn s
        echo5

{-
: let <definition>
-}

echo6 =
  do
    firstname <- getLine
    lastname <- getLine
    let fullname = firstname ++ " " ++ lastname
        greeting = "Hello"
    putStrLn (greeting ++ " " ++ fullname)

{-
: getArgs -> import System.Environment
-}

usage = putStrLn "Usage: live05 <sentence>"

-- import Data.Char pour ord
-- ord trouve la valeur ascii d'un char
-- chr trouve le char correspondant à une valeur ascii
encode xs = map ord xs

main =
  do
    args <- getArgs
    if length args /= 1
      then usage
      else do
        let sentence = head args
            cipher = encode sentence
        print cipher

-- ---------------------------------------
--  Changement de sujet
-- ---------------------------------------

{-
: maybe
-}

search k ((k', v) : kvs)
  | k == k' = Just v
  | otherwise = search k kvs
search _ [] = Nothing

{-
:
-}
search' k ((k', v) : kvs)
  | k == k' = v
  | otherwise = search' k kvs
search' _ [] = error "Penis"

{-
: exception -> import Control.Exception
-}

data BiteException = BiteNotFound
  deriving (Show)

instance Exception BiteException

{-
: throw
-}

search'' k ((k', v) : kvs)
  | k == k' = v
  | otherwise = search'' k kvs
search'' _ [] = throw BiteNotFound

-- pour tester: test = search'' 'c' [('a',1),('b',2)]

{-
: catch
-}

data OkException = GotOne | GotZero
  deriving (Show)

instance Exception OkException

dangerous n = catch (something n) catcher
  where
    something 0 = throw GotZero
    something 1 = throw GotOne
    something _ = putStrLn "Everything's fine"

    catcher GotZero = putStrLn "Error: got 0 "
    catcher GotOne = putStrLn "Error: got 1 "
