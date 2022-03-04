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
--  alors le type de f x est:
-- TODO: here
-- a. Char -> Char -> Char
-- b. x->x->x->x
-- c. a->a->a
-- d. a->a->a->Char

-- ---------------------------
-- Exercice 7
-- ---------------------------



-- ---------------------------
-- Exercice 8
-- ---------------------------



-- ---------------------------
-- Exercice 9
-- ---------------------------



-- ---------------------------
-- Exercice 10
-- ---------------------------
