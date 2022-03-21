-- ---------------------------
-- Exercice 3
-- ---------------------------

module Liste where

-- Définissez un type Liste que vous exposerez via un module avec les fonctionnalités suivantes :

data Liste a
  = Nil
  | Cons a (Liste a)

testListe :: Liste Integer
testListe = Cons 1 (Cons 3 (Cons 9 Nil))

-- ■ Définissez les opérations d’insertion et suppression sur une liste triée.
insertSorted :: Ord a => a -> Liste a -> Liste a
insertSorted e (Cons h t)
  | e > h = Cons h $ insertSorted e t
  | otherwise = Cons e $ Cons h t
insertSorted e Nil = Cons e Nil

deleteFromList :: Eq t => t -> Liste t -> Liste t
deleteFromList e (Cons h t)
  | e == h = t
  | otherwise = Cons h $ deleteFromList e t
deleteFromList e Nil = Nil

-- ■ Construisez une liste à l’aide d’un pliage et une liste standard.
fromList :: [a] -> Liste a
-- fromList list = foldr (\x acc -> Cons x acc) Nil list
fromList = foldr Cons Nil

-- ■ Dérivez le type Liste de Show en implémentant une fonction show plus lisible que la version automatique de Haskell.
instance (Show a) => Show (Liste a) where
  -- show Nil = []
  -- show (Cons x xs) = show x ++ " " ++ show xs
  show Nil = "[]"
  show (Cons h Nil) = "[" ++ show h ++ "]"
  show (Cons h hs) = "[" ++ show h ++ show' hs
    where
      show' (Cons h hs) = "," ++ show h ++ show' hs
      show' Nil = "]"

-- ■ Implémentez une fonction de recherche qui retourne la liste (de type Liste)
-- des éléments satisfaisant un prédicat.
filterList :: (a -> Bool) -> Liste a -> Liste a
filterList f (Cons h t)
  | f h = Cons h $ filterList f t
  | otherwise = filterList f t
filterList _ Nil = Nil

-- pour tester: filterList (>8) testListe
