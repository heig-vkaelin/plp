-- 3. Haskell / Higher-order functions
-- 11.03.2022

{-
: lambda (fonction anyonyme)
-}

increment :: Num a => a -> a
increment = \x -> x + 1

triplet :: a -> b -> c -> (a, b, c)
triplet = \x y z -> (x, y, z)

swap :: (a, b) -> (b, a)
swap = \(a, b) -> (b, a)

first :: [a] -> a
first = \(x:_) -> x

{-
: currying
-}

triplet' :: a -> b -> c -> (a, b, c)
triplet' x y z = (x, y, z)

triplet'' :: a -> b -> c -> (a, b, c)
triplet'' = \x -> \y -> \z -> (x, y, z)

{-
: partial application
-}

partialTriplet :: b -> c -> (Integer, b, c)
partialTriplet = triplet 1

partialTriplet' :: c -> (Integer, Bool, c)
partialTriplet' = triplet 1 True

partialPlus :: Integer -> Integer
partialPlus = (+) 1 -- <=> \x -> x + 1

{-
: high-order function
-}

hasMultipleOf3 :: Integral a => [a] -> Bool
hasMultipleOf3 [] = False
hasMultipleOf3 (x:xs)
  | x `mod` 3 == 0 = True
  | otherwise = hasMultipleOf3 xs

hasMultipleOf _ [] = False
hasMultipleOf n (x:xs)
  | x `mod` n == 0 = True
  | otherwise = hasMultipleOf n xs

some :: (a -> Bool) -> [a] -> Bool
some _ [] = False
some f (x:xs)
  | f x = True
  | otherwise = some f xs


{-
: map :: (a -> b) -> [a] -> [b]
-}

stringify :: Show a => [a] -> [String]
stringify [] = []
stringify (x:xs) = show x : stringify xs

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs 

{-
: filter :: (a -> Bool) -> [a] -> [a]
-}

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
  | f x       = x : filter' f xs
  | otherwise = filter' f xs

{-
: zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
-}

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
zipWith' _ _ _ = []

{-
: foldl :: Foldable t => (b -> t -> b) -> b -> t -> b
-}

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f acc [] = acc
foldl' f acc (x:xs) = foldl' f (f acc x) xs

-- Version O(n^2) sans fold
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- Version O(n)
reverse'' xs = reverseAcc xs []
  where 
    reverseAcc [] acc = acc
    reverseAcc (x:xs) acc = reverseAcc xs (x:acc)

{-
: foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
-}

foldr' :: (a -> b -> b) -> b -> [a] -> b 
foldr' f acc [] = acc
foldr' f acc (x:xs) = f x (foldr' f acc xs)

{-
: flip :: (a -> b -> c) -> b -> a -> c
-}

flip' :: (a -> b -> c) -> b -> a -> c
flip' f = \x -> \y -> f y x

{-
: ($) application
-}

application =
  let 
    _ = sqrt (1 + 2 + 3)
    _ = sqrt $ 1 + 2 + 3 -- pareil que la ligne du dessus
  in
    ()

{-
: function composition
-}

f x = 2 * x
g x = x + 1
fog x = f (g x)
fog' x = (f . g) x -- opérateur . = composition de fonction

compose :: (a -> b) -> (c -> a) -> (c -> b)
compose f g = \x -> f (g x)

fog'' = compose f g

len [] = 0
len (_:xs) = 1 + len xs

len' [] = 0
len' xs = 1 + len' (tail xs)

len'' [] = 0
len'' xs = succ (len'' (tail xs))

len''' [] = 0
len''' xs = (succ . len''') (tail xs)

len'''' [] = 0
len'''' xs = (succ . len'''' . tail) xs

len''''' [] = 0
len''''' xs = succ . len''''' . tail $ xs

{-
: infinite list
-}

infiniteList = [1..]

{-
: lazy evaluation
-}

lazy1 =
  let
    f x y = if True then x else y
    g x = g x
  in
    f 5 (g 10)-- n'appelle jamais (g 10) car f retourne directement x

lazy2 =
  let 
    f (x:y:z:_) = (x, y, z)
    g x = x : g x
  in
    f (g 5) -- s'arrête dès que le pattern est ok => 3 éléments
