-- ---------------------------
-- Exercices 4 et 5
-- ---------------------------

module Arbre where

-- Définissez un type Arbre que vous exposerez via un module et créez une fonction d'insertion,
-- ce qui vous permettra de créer aisément un arbre à partir d'une liste d'éléments.

data Arbre a
  = Nil
  | Node a (Arbre a) (Arbre a)
  deriving (Show)

insert :: Ord a => a -> Arbre a -> Arbre a
insert e (Node a left right)
  | e > a = Node a left (insert e right)
  | e < a = Node a (insert e left) right
  | otherwise = Node a left right
insert e Nil = Node e Nil Nil

fromList :: (Foldable t, Ord a) => t a -> Arbre a
fromList = foldr insert Nil

testArbre :: Arbre Integer
testArbre = fromList [1, 2, 3, 4]

testArbre2 :: Arbre Integer
testArbre2 = fromList [5, 2, 6, 4]

testArbre3 :: Arbre Integer
testArbre3 = insert 13 $ insert 7 $ insert 4 $ insert 14 $ insert 6 $ insert 1 $ insert 10 $ insert 3 $ insert 8 Nil

-- [13,7,4,14,6,1,10,3,8]

-- Ajoutez ensuite une opération de test d'appartenance :
contient :: Ord a => a -> Arbre a -> Bool
contient e (Node a left right)
  | e > a = contient e right
  | e < a = contient e left
  | otherwise = True
contient e Nil = False

-- Quelle est la contrainte de classe sur le type des éléments ?
-- Ord ou Eq selon l'implémentation

-- Créez une fonction qui aplatit un arbre et rend la liste des éléments :
aplatir :: Arbre a -> [a]
aplatir (Node a left right) = a : aplatir left ++ aplatir right -- parcours pré-ordre
aplatir Nil = []

-- Dérivez votre type Arbre de la classe de type Functor.
-- Testez le fonctionnement de votre dérivation en appliquant une fonction aux éléments de l'arbre.
instance Functor Arbre where
  fmap _ Nil = Nil
  fmap f (Node a left right) = Node (f a) (fmap f left) (fmap f right)

-- Vérifiez que les propriétés attendues soient respectées :
-- fmap id = id
-- fmap f . fmap g = fmap f . g

arbreIncremente :: Arbre Integer
arbreIncremente = fmap succ testArbre3

-- Exo 5:

-- Définissez une fonction qui permet de déterminer si un arbre est symétrique, c.-à-d. si ses
-- deux sous-arbres gauche et droit sont en miroir (on ne se préoccupe pas de la valeur des noeuds,
-- uniquement de la structure).

-- TODO
