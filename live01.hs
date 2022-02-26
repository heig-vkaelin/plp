-- 1. Haskell / Syntax
-- 25.02.2022

{-
: variable
-}

myInt = 5
pi' = 3.14
a = 'a'
str = "hello"
true = True -- commence par une majuscule

{-
: expression
-}

arithmetic = ((1 + 2) * (4 `mod` 5) `div` 6)^2
floating = 1.2 + 3.4 * 5.6 / 7.8
logic = True && False || not False
conditional = if 4 > 5 then "whoohoo" else "wtf"
notEquals = 5 /= 3

{-
: function
-}

identity x = x
square x = x * x
perimiter x y = 2*x + 2*y

{-
: application
-}

id5 = identity 5
square10 :: Integer
square10 = square 10
perimiter4with5 :: Integer
perimiter4with5 = perimiter 4 5

{-
: infix
-}

myInfixDiv = 5 `div` 2
myPrefixDiv = div 5 2
myInfixAdd = 5 + 2 
myPrefixAdd  = (+) 5 2
myMin x y = if x < y then x else y 
-- application: myMin 4 5 ou alors 4 `myMin` 5

{-
: recursion
-}

-- 0 + 1 + 2 + ... + n
total n = if n == 0 then 0 else n + total (n - 1)
fact n = if n < 1 then 1 else n * fact (n - 1)

{-
: list
-}

myEmptyList = []
my3List = [square 1, identity 2, 3 + 2]
myConcatenatedList = [1] ++ [2, 3]
myConstructedList = 1 : 2 : [3, 4] -- ajoute au début
myHeadList = head [1, 2, 3] -- 1er élément
myTailList = tail [1, 2, 3] -- tout sauf le 1er élément
myInitList = init [1, 2, 3] -- tout sauf le dernier élément
myLastElem = last [1, 2, 3] -- dernier élément
myListLength = length [1, 2, 3]
myReversedList = reverse [1, 2, 3]
myNthElem = [1, 2, 3] !! 2 -- en prefix: (!!) [1, 2, 3] 2

{-
: string
-}

myString = "abc"
myString' = 'a' : 'b' : 'c' : []
myStringLength = length "abc"
myReversedString = reverse "abc"

{-
: tuple
-}

my0Tuple = ()
-- tuple à 1 élément existe pas car c'est une expression entre parenthèses
my1Tuple = (1)
my3Tuple = ("foo", 123, True)
my2Tuple = (1, "foo")
myFirstElem = fst (1, "foo") -- fst et snd dispos que sur les tuples de 2 éléments
mySecondElem = snd (1, "foo")
-- crée une liste de tuples à 2 éléments, de la plus petite taille des listes
myZippedList = zip [1, 2, 3] ["foo", "bar", "baz", "ignored"]

{-
: list comprehension
{1 .. 10} -> liste en extension
{n : n appartient à N, n est un multiple de 2 } -> liste en compréhension
-}

myExtensionList = [1 .. 10] -- valeurs de 1 à 10 comprises
mySteppedExtensionList = [0,2 .. 10] -- que les valeurs paires
myListComprehension = [ n | n <- [0..10], n `mod` 2 == 0 ]
myListComprehension' =
  [n + m | n <- [0..10], m <- [0..10] ] -- toutes les valeurs possibles de n + m


{-
: let
-}

increment n = n + 1
increment' n =
  let
    m = n + 1
  in
    m

-- séparation des variables par ; ou \n
greeting name =
  let message = "hello "; point = "." in
    message ++ name ++ point

{-
: guard
-}

-- version sans guard
fibo n = 
  if n == 0 then 0
  else if n == 1 then 1
  else fibo (n - 1) + fibo (n - 2)

-- otherwise ou True c'est pareil, dans le cas par défaut
fibo' n
  | n == 0    = 0
  | n == 1    = 1
  | otherwise = fibo (n - 1) + fibo (n - 2)

-- crée une liste de n fois l'élément x
replicate' n x
  | n == 0 = []
  | True   = x : replicate' (n - 1) x

-- exception si x == y
myCompare x y 
  | x > y = "greater"
  | x < y = "lower"

{-
: pattern matching
-}

myLength xs = if null xs then 0 else 1 + myLength (tail xs)
-- version avec guard
myLength' xs
  | null xs   = 0
  | otherwise = 1 + myLength' (tail xs)
-- version avec pattern matching
-- plusieurs définitions de la fonction, un motif par déf
myLength''[] = 0 -- si le paramètre est une liste vide, on rentre dans cette déf.
myLength''(_:xs) = 1 + myLength'' xs -- la liste contient au moins 1 élément, on ignore sa tête

-- vérifie si un élément se trouve dans la liste (function elem)
myElement x [] = False
myElement x (y:ys)
  | x == y = True
  | otherwise = myElement x ys

{-
: pattern
-}

-- Si 1: True, autre valeur: crash
pliteral 1 = True
-- Accepte tout le temps
puniverse _ = "puniverse" 
pemptyList [] = False 
plist (1:x:_:[]) = 1.5 -- liste de 3 éléments
plist' [1, x, _] = 'a' -- liste de 3 éléments + test de chaque valeur
ptuple ("foo", True, x, _, []) = 10 -- Tuple de 5 éléments
palias xs@(_:ys) = "ok" -- utiliser xs en entier dans la fonction

my3ListSum [x, y, z] = x + y + z
mySwap (a, b) = (b, a)

{-
: pattern usage
-}

function _ = "f"
lett = let (_, b) = (1, 2) in b
lcomp = [x | (x:_) <- [[1, 2], [3], [4, 5, 6]]]

{-
: case
-}

-- liste des max de chaque tuple
myMax xs =
  case xs of 
    ((a, b):ys) ->
      if a > b
      then a : myMax ys
      else b : myMax ys
    _ -> []

myMax' xs =
  case xs of 
    ((a, b):ys)
      | a > b -> a : myMax ys
      | otherwise -> b : myMax ys 
    _ -> []