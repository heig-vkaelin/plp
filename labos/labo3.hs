import Data.Char

-- ---------------------------
-- Exercice 1
-- ---------------------------

-- Montrer comment la liste en compréhension [f x | x <- xs, p x]
-- peut être exprimée à partir des fonctions d'ordre supérieur map et filter.

f = succ

p = even

list xs = [f x | x <- xs, p x]

list' xs = map f $ filter p xs

-- ---------------------------
-- Exercice 2
-- ---------------------------

-- Définir la fonction check qui permet de construire la liste :
-- check f [(x1, y1) ... (xn, yn) ]-> [(x1, y1, f x1 y1) ... (xn, yn, f xn yn)].

check _ [] = []
check f ((x1, y1) : xs) = (x1, y1, f x1 y1) : check f xs

-- pour tester: check (\x -> \y -> x + y) [(1, 2), (3, 4)]

-- ---------------------------
-- Exercice 3
-- ---------------------------

-- Écrire une fonction fmap prenant une liste de fonctions et une valeur,
-- et qui applique chaque fonction à la valeur passée comme paramètre :
-- Prelude > fmap [ succ , pred ] 2
-- [3, 1]

fmap' [] _ = []
fmap' (f : fs) a = f a : fmap' fs a

-- ---------------------------
-- Exercice 4
-- ---------------------------

-- Écrire une fonction qui transforme une liste d'éléments en liste de listes :
-- Prelude> listes [1, 2, 3]
-- [[1] , [2] , [3]]

-- Pour la fonction précédente, vous avez probablement défini une fonction
-- anonyme qui transforme un élément en liste.
-- Instancier partiellement ( : ) pour définir listes sans cette fonction anonyme.

listes [] = []
listes (x : xs) = [x] : listes xs

listes' = map (: []) -- <=> (\x -> x : [])

-- ---------------------------
-- Exercice 5
-- ---------------------------

-- Écrire une fonction qui calcule la liste des carrés d'une liste de nombres :
-- carres [x1, x2 ... xn]-> [x1^2, x2^2 ... xn^2]

carres = map (^ 2)

-- ---------------------------
-- Exercice 6
-- ---------------------------

-- Écrire la fonction précédente sans fonction auxiliaire
-- (utiliser l'opérateur qui élève à la puissance et flip).

carres' [] = []
carres' (x : xs) = flip (^) 2 x : carres' xs

-- ---------------------------
-- Exercice 7
-- ---------------------------

-- Écrire une fonction positiveAttitude qui prend la valeur absolue
-- des nombres d'une liste :
-- Prelude> positiveAttitude [-1,2,5,-3,0]
-- [1,2,5,3,0]

positiveAttitude = map abs

-- ---------------------------
-- Exercice 8
-- ---------------------------

-- Écrire une fonction qui prend une liste de chaînes de caractères et
-- ne retient que les 5 premiers caractères de chaque chaîne.

substring = map (take 5)

-- ---------------------------
-- Exercice 9
-- ---------------------------

-- Écrire une fonction qui transforme tous les caractères d'une chaîne
-- en minuscules, sauf le premier :

-- Prelude> minuscules "Ceci N'est Pas Un Titre."
-- "Ceci n'est pas un titre."

minuscules [] = []
minuscules (head : tail) = toUpper head : map toLower tail

-- ---------------------------
-- Exercice 10
-- ---------------------------

-- Écrire une fonction qui filtre les éléments pairs ou impairs d'une liste.

evenElem = filter even

oddElem = filter odd

-- ---------------------------
-- Exercice 11
-- ---------------------------

-- Écrire une fonction qui filtre les éléments d'une liste
-- qui sont supérieurs ou inférieurs à une valeur donnée.

biggerThan x = filter (> x)

smallerThan x = filter (< x)

-- ---------------------------
-- Exercice 12
-- ---------------------------

-- Écrire une fonction qui cherche le premier élément
-- dans une liste qui satisfait un prédicat :
-- Prelude > cherche (>3) [1, 2, 3, 4, 5, 6]
-- 4

cherche f xs = head (filter f xs)

-- ---------------------------
-- Exercice 13
-- ---------------------------

-- Utiliser un pliage pour écrire la fonction existe qui
-- correspond au quantificateur existentiel :

-- existe :: ... => [t] -> (t -> Bool) -> Bool

existe f = foldr ((||) . f) False

-- ---------------------------
-- Exercice 14
-- ---------------------------

-- Utiliser un pliage pour écrire la fonction tous qui
-- correspond au quantificateur universel :

-- tous :: ... => [t] -> (t -> Bool) -> Bool

tous f xs = foldr (&&) True (map f xs)

tous' f = foldr ((&&) . f) True

-- ---------------------------
-- Exercice 15
-- ---------------------------

-- Donner une version alternative des fonctions des deux derniers
-- exercices sans définir de fonction auxiliaire pour le pliage,
-- en utilisant map pour transformer la liste [t] en [Bool].

-- Déjà fait ?

-- ---------------------------
-- Exercice 16
-- ---------------------------

-- Une chaîne de Collatz est la liste de nombres [xi, xi + 1, xi + 2, ..., 1] tels que:

-- * xi + 1 = xi * 3 + 1 si xi impair

-- * xi + 1 = xi/2 si xi pair

-- Exemple: La chaîne de Collatz de 3 est: [3, 10, 5, 16, 8, 4, 2, 1]

-- Ecrire une fonction pour calculer ces chaînees.
-- Quelle est la longueur de la chaîne de Collatz de 156159 ? 383

collatz n
  | even n = n `div` 2
  | otherwise = n * 3 + 1

collatzList n
  | n <= 0 = error "n must be positive"
  | n == 1 = [1]
  | otherwise = n : collatzList (collatz n)

-- ---------------------------
-- Exercice 17
-- ---------------------------

-- La mémoïsation consiste à optimiser le calcul d'une fonction récursive
-- à l'aide d'un tableau qui mémorise les valeurs calculées précédemment.

-- Écrire une fonction qui permet de calculer ces valeurs avec une fonction récursive.
-- Appliquer la mémoïsation au calcul de la série de Fibonacci.
-- Comparer les performances de ces deux solutions.

-- Challenge : Appliquer le principe de la mémoïsation au calcul de la fonction d'Ackermann.

-- Afficher le temps d'exécution dans ghci -> :set +s

-- Avec memoization
-- fib 100 -> 0.00s
-- fib 10'000 -> 0.37s
fib = (map fib' [0 ..] !!)
  where
    fib' 0 = 0
    fib' 1 = 1
    fib' 2 = 1
    fib' n = fib (n - 2) + fib (n - 1)

-- Sans memoization
-- fib'' 30 -> 1.46s
-- fib'' 35 -> 16.73s (pas fait +)
fib'' n = map fib''' [0 ..] !! n
  where
    fib''' 0 = 0
    fib''' 1 = 1
    fib''' 2 = 1
    fib''' n = fib'' (n - 2) + fib'' (n - 1)

-- Version qui retourne le tableau
-- fib'''' = zipWith (+) (0 : (1 : fib'''')) (1 : fib'''')

-- Source: https://stackoverflow.com/questions/11466284/how-is-this-fibonacci-function-memoized

-- J'ai pas tout capté $ cette question je l'avoue
