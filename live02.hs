-- 1. Haskell / Type system
-- 04.03.2022

{-
: basic types
-}

int :: Int
int = 123

-- Entier infini
integer :: Integer
integer = 323232323^10

double :: Double
double = 3.14

boolean :: Bool
boolean = True

char :: Char
char = 'a'

-- Type String = alias sur une liste de char: [Char]
string :: String
string = "hello"

{-
: expression
-}

arithmetic :: Integer -- car utilisation de l'opérateur ^
arithmetic = (1 + 2) * (3 `div` 4) `mod` 5 - 6^7

floating :: Double
floating = 1.0 + 2.0 * 3.0 / 4.0

logic :: Bool
logic = True || not False

relational :: Bool
relational = 1 < 2 || 3 >= 4

conditional :: Bool
conditional = if "abc" < "ABC" then True else False

{-
: function type
-}

constant :: Int -> Int
constant n = n

add :: Int -> Int -> Int
add n m = n + m

choose :: Char -> String 
choose c 
  | c == 'y' = "Yes"
  | otherwise = "No"

isTrue :: Bool -> Bool
isTrue True = True
isTrue _ = False

isFalse :: Bool -> Bool
isFalse b = b'
  where b' = not (isTrue b)

{-
: type variable
-}

identity :: p -> p -- p: variable de type (générique)
identity x = x

ignore :: a -> b -> a -- 2 lettres pour ne pas forcer au même type entre x et y
ignore x y = x

{-
: list type
-}

emptyList :: [a]
emptyList = []

list2 :: a -> a -> [a]
list2 x y = [x, y]

listInteger :: [Int]
listInteger = [1, 2, 3]

string' :: String
string' = "Hello"

string'' :: [Char]
string'' = "Hello"

{-
: tuple type
-}

emptyTuple :: ()
emptyTuple = ()

tuple2 :: a -> b -> (a, b)
tuple2 x y = (x, y)

tuple3 :: a -> b -> c -> (a, b, c)
tuple3 x y z = (x, y, z)

tupleCharBool :: (Char, Bool)
tupleCharBool = ('a', False)

myZip :: [a] -> [b] -> [(a, b)]
-- myZip [] _ = []
-- myZip _ [] = []
myZip (x:xs) (y:ys) = (x, y) : myZip xs ys
myZip _ _ = [] -- remplace les 2 cas commentés plus

{-
: list comprehension
-}

-- comprehension =
--   let 
--     xs :: [a]
--     p :: a -> Bool
--     f :: a -> b
--   in
--     [f x | x <- xs, p x] -- [b]
-- --   ^^^   ^    ^^  ^^^
-- --   b     a    [a] Bool

{-
: type constraint
-}

add' :: Num a => a -> a -> a
add' x y = x + y

{-
: type class
-}

-- Num
-- Integral
-- Fractional
-- Eq
-- Ord
-- Show
-- Read
-- Enum

{-
: Num (+, -, *, abs)
-}

sum' :: Num a => a -> a -> a
sum' x y = x + y

diff :: Num a => a -> a -> a
diff x y = x - y

total :: Num a => [a] -> a
total [x] = x
total (x:xs) = x + total xs

{-
: Integral (`div`, `mod`)
-}

division :: Integral a => a -> a -> a
division x y = x `div` y

modulo :: Integral a => a -> a -> a
modulo x y = x `mod` y

{-
: Eq (==, /=)
-}

equal :: Eq a => a -> a -> Bool
equal x y = x == y

different :: Eq a => a -> a -> Bool
different x y = x /= y

exist :: Eq a => a -> [a] -> Bool 
exist _ [] = False
exist x (y:ys)
  | x == y    = True
  | otherwise = exist x ys

{-
: Ord (>, >=, <, <=, min, max, compare)
-}

greater :: Ord a => a -> a -> Bool 
greater x y = x > y

min' :: Ord a => a -> a -> a
min' x y = min x y

min'' :: Ord a => a -> a -> a
min'' x y = if x < y then x else y

-- Ordering: LT, GT, EQ
compare' :: Ord a => a -> a -> Ordering
compare' x y = compare x y

compare'' :: Ord a => a -> a -> Ordering
compare'' x y
  | x < y     = LT
  | x > y     = GT
  | otherwise = EQ

sorted :: Ord a => [a] -> Bool
sorted (x:y:zs)
  | x <= y    = sorted(y:zs)
  | otherwise = False
sorted _ = True

{-
: Show (show)
-}

toString :: Show a => a -> String 
toString x = show x

{-
: Read (read)
-}

fromString :: Read a => String -> a
fromString x = read x

{-
: :: type specification/assertion/coercion
-}

{-
: type signature
-}

-- symbol :: type constraint => symbol type

dummy :: (Num a, Eq b) => (a, b, b, c) -> (a, Bool)
dummy (x, y, z, _) = (x + 1, y == z)


{-
: type inference
-}

zero :: [Int] -- type inféré
zero = 0 : []

ternary :: Bool -> a -> a -> a -- type inféré
ternary x y z = if x then y else z

first :: (a, b) -> a -- type inféré
first t = fst t
