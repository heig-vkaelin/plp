import Data.Char

-- ---------------------------
-- Exercice 1
-- ---------------------------

-- a. 'Z' < 'a'
-- True car les caractère ASCII majuscules se trouvent avant les minuscules

-- b. "abc" <= "ab"
-- False car il compare caractère par caractère et le 'c' est plus grand que les caractères "ab"

-- c. if 2 < 3 then 3
-- Erreur car l'expression doit renvoyer une valeur dans tous les cas
-- (j'ai remplacé la typo du f en if)

-- d. [1,3,3,6] < [1,3,4]
-- True car il compare élément par élément et le 3ème élément 3 est plus petit que 4

-- e. 4. + 3.5
-- Erreur, il faut écrire 4 ou alors 4.0

-- f. 5.0 - 4.2 / 2.1
-- 3.0 car le langage respecte la priorité des opérations

-- g. if 4 > 4.5 then 3.0 else 'a'
-- Erreur car l'expression doit toujours renvoyer le même type

-- h. 3 > 4 || 5 < 6 && not (7 /= 8)
-- False, la priorité des comparaisons est la même que dans d'autres langages (&& avant ||)

-- i. if 6 < 10 then 6.0 else 10.0
-- 6.0

-- ---------------------------
-- Exercice 2
-- ---------------------------

-- a. [1,2,3] !! ([1,2,3] !! 1)
-- 3 car il va prendre le 2ème élément de [1, 2, 3] : 2 et va donc à l'index 2 de la 1ère liste

-- b. head []
-- Erreur, on ne peut pas appeller la fonction head sur une liste vide

-- c. tail [1,2,3]
-- [2, 3] enlève le 1er élément de la liste

-- d. "a":["b","c"]
-- ["a","b","c"] ajoute "a" au début de la liste

-- e. "abc" ++ "d"
-- "abcd" concaténation des string

-- f. tail "abc" ++ "d"
-- "bcd" enlève le 1er élément de la string et concatène le reste à "d"

-- g. [1] : [2,3,4]
-- Erreur, pas les bons types.
-- Il faudrait utiliser une des syntaxes suivantes 1 : [2,3,4] ou [1] ++ [2,3,4]

-- h. ([1,2,3] !! 2 : []) ++ [3,4]
-- [3,3,4], ajoute le 3ème élément de la liste à la liste vide puis la concatène à la liste [3,4]

-- i. [3,2] ++ [1,2,3] !! head [1,2] : []
-- [3,2,2] car l'opérateur d'accès indexé est plus prioritaire que la concaténation

-- ---------------------------
-- Exercice 3
-- ---------------------------

-- Définissez les listes suivantes :

-- a. Les nombres impairs de 1 à 20 (en extension)
odd = [1,3 .. 20]

-- b. Les nombres pairs de 1 à 20 (en compréhension)
even = [n | n <- [0..20], n `mod` 2 == 0]

-- c. Les carrés parfaits entre 1 et 100
squares = [n*n | n <- [1..], n*n < 100]

-- d. Les paires (x, y) telles que x<7, y<7, x<y.
pairs = [(x, y) | x <- [1..7], y <- [1..7], x < y]

-- e. Améliorez la solution précédente pour ne pas répéter [1..7].
pairs' = [(x, y) | let values = [1..7], x <- values, y <- values, x < y]

-- f. Les triplets (x, y, z) d’entiers inférieurs à 100 qui 
-- représentent la longueur des trois côtés d’un triangle rectangle.
triplets = [(x, y, z) | let values = [1..99],
  x <- values,
  y <- values,
  z <- values, z^2 == x^2 + y^2]

-- ---------------------------
-- Exercice 4
-- ---------------------------

-- Définissez et testez les fonctions suivantes :

-- somme x y z − Somme de x , y et z.
somme x y z = x + y + z

-- carre x − Calcul de x au carre.
carre x = x^2

-- triangles n −− Triplets de l’ exercice précédent.
triangles n = [(x, y, z) | let values = [1..n],
  x <- values,
  y <- values,
  z <- values, z^2 == x^2 + y^2]

-- ou p q −− Le ou logique.
ou p q = p || q

-- et p q − Le et logique.
et p q = p && q

-- ---------------------------
-- Exercice 5
-- ---------------------------

-- Utilisez les listes en compréhension pour lister la
-- table de vérité de vos fonctions or et and (sous forme de triplets).

truthTableOr = [(x, y, z) | let r = [False, True], x <- r, y <- r, z <- [ou x y]]
truthTableAnd = [(x, y, z) | let r = [False, True], x <- r, y <- r, z <- [et x y]]

-- Corrigé:
truthOr =
  let
    xs = [False, True]
  in
    [(p, q, ou p q) | p <- xs, q <- xs]

-- ---------------------------
-- Exercice 6
-- ---------------------------

-- Les fonctions drop et take permettent respectivement d’éliminer ou de 
-- retenir les n premiers éléments d’une liste.
-- Comment utiliser ces fonctions pour supprimer le mot Hello au début 
-- d’une chaîne? Tester si la chaîne commence par Hello ?

deleteHello xs = if take 5 xs == "Hello" then drop 5 xs else xs

-- ---------------------------
-- Exercice 7
-- ---------------------------

-- Ecrivez une fonction clean s qui supprime le mot Hello s’il figure au début de la chaîne s.

-- La phrase résultante manque de majuscule, pouvez vous corriger ça?

clean [] = []
clean s =
  let
    res = deleteHello s
  in
    toUpper (head res) : tail res

-- ---------------------------
-- Exercice 8
-- ---------------------------

-- Écrivez une fonction tuple qui retourne un triplet avec les carrés de n, n + 1, n + 2.

tuple n = (n^2, (n+1)^2, (n+2)^2)

-- ---------------------------
-- Exercice 9
-- ---------------------------

-- On construit une liste avec des tuples contenant un nom et un âge.
-- Écrivez une fonction qui donne l’âge en fonction du nom.
-- Que se passe-t-il si le nom n’est pas dans la liste?

dataEx9 = [("Valentin", 24), ("Alex", 12), ("Bob", 69)]

getAge nameToFind [] = error "Nom introuvable"
getAge nameToFind ((name,age):list) = if nameToFind == name then age else getAge nameToFind list

-- ---------------------------
-- Exercice 10
-- ---------------------------

-- Familiariser vous avec les fonctions suivantes :

listEx10 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
lengthList = length listEx10
headList = head listEx10
fourthElemList = (!!) listEx10 3 
lastElem = last listEx10
tailList = tail listEx10
initList = init listEx10
first3Elems = take 3 listEx10
listWithout3FirstElems = drop 3 listEx10
secondList = [10, 11, 12]
concatList = listEx10 ++ secondList

-- ---------------------------
-- Exercice 11
-- ---------------------------

-- Définissez une fonction slice qui, à l’aide d’une expression de liste en compréhension, 
-- extrait les ième au jème éléments d’une liste :

-- Prelude > slice "Hello world!" 6 10
-- "world"

slice str i j = [str !! x | x <- [i..j]]

-- Version récursive:
slice' str i j
  | i < 0 = slice str ((length str)+i) j 
  | j < 0 = slice str i ((length str)+j)
  | otherwise = slice (tail str) (i-1) (j-1)

-- ---------------------------
-- Exercice 12
-- ---------------------------

-- Écrivez une fonction insert qui insère un élément x à la position n d’une liste :

-- Prelude > insert 'd' 4 "abcef"
-- "abcdef"

insert x n list = take (n - 1) list ++ [x] ++ drop (n - 1) list

-- ---------------------------
-- Exercice 13
-- ---------------------------

-- Écrivez une fonction sieve qui, à l’aide d’une expression de liste en compréhension, 
-- supprime d’une liste xs tous les multiples de n :

-- Prelude > sieve 2 [1..9]
-- [1,3,5,7,9]

sieve n xs = [x | x <- xs, x `mod` n /= 0]

-- ---------------------------
-- Exercice 14
-- ---------------------------

-- A l’aide d’une expression de liste en compréhension, écrivez un prédicat 
-- qui vérifie si un nombre n positif est premier :

-- Prelude > prime 12
-- false

-- Indication : Définissez des alternatives pour les cas triviaux (1 et 2 ne sont pas considérés comme premiers).

prime 1 = False
prime 2 = False
prime n = null [x | x <- [2 .. n - 1], n `mod` x == 0]

-- ---------------------------
-- Exercice 15
-- ---------------------------

-- Écrivez une fonction parts, à l’aide d’une expression de liste en compréhension, 
-- qui liste les paires de nombres premiers dont la somme est égale à n :

-- Prelude > parts 14
-- [(3,11), (7,7), (11,3)]

parts n = [(x, y) | let values = [2..(n-1)], x <- values, y <- values, x + y == n, prime x, prime y]

-- ---------------------------
-- Exercice 16
-- ---------------------------

-- Écrire une fonction add d’addition de vecteurs, représentés
-- par des paires (tuple de deux éléments) en utilisant des motifs.

add (x1,x2) (y1,y2) = (x1 + y1, x2 + y2)

-- ---------------------------
-- Exercice 17
-- ---------------------------

-- Définissez une fonction prod de produit scalaire de deux vecteurs dans l’espace (triplets).

prod (x1,x2,x3) (y1,y2,y3) = x1*y1 + x2*y2 + x3*y3

-- ---------------------------
-- Exercice 18
-- ---------------------------

-- Récrivez les fonctions add et prod sur une liste à l’aide de motifs.

add' xs =
  case xs of 
    [v1@(a, b), v2@(c, d)] -> add v1 v2
    (v1@(a, b) : ys) -> add v1 (add' ys) 
    _ -> (0, 0)

prod' xs =
  let
    product [(a, b, c)] = (a, b, c)
    product [(a, b, c), (d, e, f)] = (a * d, b * e, c * f)
    product (v@(a, b, c) : ys) = product [v, product ys]
    product [] = (0, 0, 0)
    (a, b, c) = product xs
  in
    a + b + c

-- ---------------------------
-- Exercice 19
-- ---------------------------

-- Définir les fonctions head’ et tail’ à l’aide de motifs.

head' [] = error "Liste vide"
head' (x:_) = x
tail' [] = error "Liste vide"
tail' (_:x) = x

-- ---------------------------
-- Exercice 20
-- ---------------------------

-- Trouvez le cinquième élément d’une liste à l’aide d’un motif.
findFifthElem (_:_:_:_:x:_) = x
findFifthElem _ = error "Liste invalide"

-- ---------------------------
-- Exercice 21
-- ---------------------------

-- Définissez la fonction pgcd qui calcule le plus grand commun diviseur de deux nombres.

pgcd x y
  | x > y     = pgcd (x-y) y
  | x < y     = pgcd x (y-x)
  | otherwise = x

-- ---------------------------
-- Exercice 22
-- ---------------------------

-- Écrivez une fonction secToHMS qui transforme des secondes en heures, 
-- minutes et secondes sans utiliser de division ni modulo.

secToHMS sec =
  let 
    hms (h, m, s)
      | s >= 3600 = hms (h + 1, m, s - 3600)
      | s >= 60   = hms (h, m + 1, s - 60)
      | otherwise = (h, m, s)
  in
    hms (0, 0, sec) 

-- Corrigé
secToHMSV2 sec
  | sec >= 3600 = let (h , m, s) = secToHMS (sec - 3600) in (h + 1 , m, s)
  | sec >= 60 = let (h , m, s) = secToHMS (sec - 60) in (h, m + 1, s)
  | otherwise = (0 , 0, sec)

-- ---------------------------
-- Exercice 23
-- ---------------------------

-- Inventez une forme géométrique composée de formes élémentaires et 
-- définissez une fonction pour calculer sa surface avec un where 
-- comme pour l’exemple du cylindre donné dans les transparents du cours.

-- Triangle au-dessus d'un carré
maison cote hauteur = mur + toit
  where
    mur = cote * cote
    toit = cote * hauteur / 2

-- ---------------------------
-- Exercice 24
-- ---------------------------

-- Écrivez une fonction qui trie par insertion une liste.

insertSorted e liste = [x | x <- liste, x < e] ++ e : [x | x <- liste, x >= e]
tri liste = foldr insertSorted [] liste
