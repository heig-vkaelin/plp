-- ---------------------------
-- Exercice 1
-- ---------------------------

-- Donnez une expression pour chacun des types suivants :

-- [[[ Integer ]]]
exp1 = [[[42]]]

-- [(Integer, Char)]
exp2 = [(1, "a"), (2, "b")]

-- (Double , [[ Integer ]])
exp3 = (1.2, [[1, 2, 3], [4, 5, 6]])

-- ((Integer , Integer), [Bool], Double)
exp4 = ((1, 2), [True, False, False], 4.2)

-- ---------------------------
-- Exercice 2
-- ---------------------------

-- Inférez le type des expressions ci-dessous :

-- (* 9) 6
-- Num a => a

-- head [(0, "doge"),(1, " kitteh ")]
-- Num a => (a, [Char])

-- head [(0 :: Integer ,"doge"),(1," kitteh ")]
-- (Integer, [Char])

-- if False then True else False
-- Bool

-- length [1, 2, 3, 4, 5]
-- Int

-- (length [1, 2, 3, 4]) > (length "TACOCAT")
-- Bool

-- ---------------------------
-- Exercice 3
-- ---------------------------

-- Inférez le type des expressions ci-dessous :

-- 3 * pi
-- Floating a => a

-- (1.5 , "3")
-- Fractional a => (a, [Char])

-- head ("Hello " ++ "World !")
-- Char (des parenthèses ont été ajoutées car autrement cela ne run pas)

-- [[1 ,2] ,[]]
-- Num a => [[a]]

-- [('a', 1), ('b', 2)]
-- Num b => [(Char, b)]

-- ---------------------------
-- Exercice 4
-- ---------------------------

-- Inférez le type des fonctions ci-dessous :

second :: [a] -> a
second xs = head (tail xs)

swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)

pair :: a -> b -> (a, b)
pair x y = (x, y)

double :: Num a => a -> a
double x = x * 2

palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

twice :: (a -> a) -> a -> a
twice f x = f (f x)

-- ---------------------------
-- Exercice 5
-- ---------------------------

-- Faites correspondre chaque fonction à sa signature de type.

-- Fonctions :
-- a. not     -> 5.
-- b. length  -> 3.
-- c. concat  -> 2.
-- d. head    -> 1.
-- e. (<)     -> 4.

-- Signatures de type :
-- 1. _ :: [a] -> a
-- 2. _ :: [[a]] -> [a]
-- 3. _ :: [a] -> Int
-- 4. _ :: Ord a => a -> a -> Bool
-- 5. _ :: Bool -> Bool

-- ---------------------------
-- Exercice 6
-- ---------------------------

-- 1. Si le type de f est a -> a -> a -> a et le type de x est Char,
-- alors le type de f x est:
-- a. Char -> Char -> Char

-- 2. Si le type de g est a -> b -> c -> b,
-- alors le type de g 0 ’c’ "woot" est :
-- d. Char

-- 3. Si le type de h est (Num a, Num b) => a -> b -> b,
-- alors le type de h 1.0 2 est :
-- b. Integer

-- 4. Si le type de h est (Num a, Num b) => a -> b -> b,
-- alors le type de h 1 (5.5 :: Double) est :
-- c. Double

-- 5. Si le type de j est (Ord a, Eq b) => a -> b -> a,
-- alors le type de j "keyboard" "has the word jackal in it" est :
-- a. [Char]

-- 6. Si le type de j est (Ord a, Eq b) => a -> b -> a,
-- alors le type de j "keyboard" est :
-- e. Eq b => b -> [Char]

-- 7. Si le type de k est (Ord a, Num b) => a -> b -> a,
-- alors le type de k 1 2 est :
-- a. Integer

-- 8. Si le type de k est (Ord a, Num b) => a -> b -> a,
-- alors le type de k 1 (2 :: Integer) est :
-- f. Integer

-- 9. Si le type de k est (Ord a, Num b) => a -> b -> a,
-- alors le type de k (1 :: Integer) 2 est :
-- c. Integer

-- ---------------------------
-- Exercice 7
-- ---------------------------

-- 1. Une valeur de type [a] est
-- c. une liste où les éléments sont tous de type a

-- 2. Une fonction de type [[a]] -> [a] peut
-- a. prendre une liste de chaînes de caractères en argument

-- 3. Une fonction de type [a] -> Int -> a
-- b. retourne un élément de type a de la liste

-- 4. Une fonction de type (a, b) -> a
-- c. prend un tuple en argument et retourne la première valeur

-- ---------------------------
-- Exercice 8
-- ---------------------------

-- 1. Sachant
-- x = 5
-- y = x + 5
-- w = y * 10
-- Quel est le type de w ? Integer

-- 2. Sachant
-- x = 5
-- y = x + 5
-- z y = y * 10
-- Quel est le type de z ? Num a => a -> a

-- 3. Sachant
-- x = 5
-- y = x + 5
-- f = 4 / y
-- Quel est le type de f ? Double

-- 4. Sachant
-- x = "Julie"
-- y = " <3 "
-- z = " Haskell "
-- f = x ++ y ++ z
-- Quel est le type de f ? [Char]

-- 5. Sachant
-- x = 3.14
-- y = x + 5
-- z = show y
-- Quel est le type de z ? String

-- ---------------------------
-- Exercice 9
-- ---------------------------

-- On souhaite modéliser des ensembles à travers des listes Haskell.
-- Décrivez les signatures des fonctions de manipulation d’ensembles suivantes
-- et donnez leurs implémentations.

-- Insertion d’un élément x
insert :: Ord a => a -> [a] -> [a]
insert y [] = [y]
insert y l@(x : xs)
  | x < y = x : insert y xs
  | x == y = l
  | otherwise = y : l

-- Suppression d'un élément x
delete :: Ord a => a -> [a] -> [a]
delete _ [] = []
delete y l@(x : xs)
  | x < y = x : delete y xs
  | x == y = xs
  | otherwise = l

-- Appartenance d'un élément x
exist :: Eq a => a -> [a] -> Bool
exist _ [] = False
exist x (y : ys)
  | x == y = True
  | otherwise = exist x ys

-- Union de deux ensembles s1 et s2
union :: Eq a => [a] -> [a] -> [a]
union xs [] = xs
union [] ys = ys
union xs (y : ys)
  | exist y xs = union xs ys
  | otherwise = y : union xs ys

-- Version du prof
union_v2 :: Ord a => [a] -> [a] -> [a]
union_v2 [] ys = ys
union_v2 (x : xs) ys = union_v2 xs (insert x ys)

-- Différence de deux ensembles s1 et s2
diff :: Ord a => [a] -> [a] -> [a]
diff xs [] = xs
diff [] ys = []
diff xs (y : ys)
  | exist y xs = diff (delete y xs) ys
  | otherwise = diff xs ys

-- Intersection de deux ensembles s1 et s2
intersect :: Ord a => [a] -> [a] -> [a]
intersect [] _ = []
intersect _ [] = []
intersect l1@(x : xs) l2@(y : ys)
  | x < y = intersect xs l2
  | x == y = x : intersect xs ys
  | otherwise = intersect l1 ys

-- ---------------------------
-- Exercice 10
-- ---------------------------

-- Inférez le type des fonctions d et d'.

d :: Eq a => ([a], [(a, a)]) -> a -> [a]
d (v, e) n
  | null [] = []
  | otherwise = d' (v, e) [n]

d' :: Eq a => ([a], [(a, a)]) -> [a] -> [a]
d' ([], _) _ = []
d' (_, _) [] = []
d' (v, e) (t : r)
  | [x | x <- v, x == t] == [] = d' (n, e) r
  | otherwise = t : d' (n, e) (a ++ r)
  where
    a = [x | (x, y) <- e, y == t] ++ [x | (y, x) <- e, y == t]
    n = [x | x <- v, x /= t]
