import Control.Monad (unless, when)

-- 5. Haskell /IO
-- 25.03.2022

{-
: main
-}

main :: IO ()
main = putStrLn "Hello, world"

{-
: compilation
-}

-- ghc <file>

{-
: IO action
-}

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

-- TODO: get code from teacher

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
: return
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

