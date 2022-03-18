-- ---------------------------
-- Exercice 1
-- ---------------------------

module GestionPersonnes where

import Data.Char (toUpper)

data Personne = Personne
  { prenom :: String,
    nom :: String,
    age :: Int,
    taille :: Float
  }
  deriving (Show)

initiales Personne {prenom = p, nom = n}
  | null p = "X. " ++ initiale n
  | null n = initiale p ++ " X."
  | otherwise = initiale p ++ " " ++ initiale n
  where
    initiale (c : _) = toUpper c : ['.']
    initiale _ = []

-- pour tester: initiales Personne {nom = "nom", prenom = "prenom", age = 2, taille = 2.0}

-- Effectuez une recherche dans une liste de personnes à l’aide de filter.
personnes =
  [ Personne {nom = "John", prenom = "Doe", age = 20, taille = 2.0},
    Personne {nom = "Jeanne", prenom = "Doe", age = 35, taille = 1.5},
    Personne {nom = "Joe", prenom = "Smith", age = 12, taille = 1.2}
  ]

filtrerPersonnes :: (Personne -> Bool) -> [Personne] -> [Personne]
filtrerPersonnes = filter

-- ex d'appel: filtrerPersonnes (\Personne{age = a} -> a > 24) personnes

-- Vieillissez les personnes d’une liste d’une année avec map.
vieillirPersonnes :: [Personne] -> [Personne]
vieillirPersonnes = map (\(Personne p n a t) -> Personne p n (a + 1) t)

-- Calculez la moyenne d’âge des personnes dans une liste avec rien d’autres qu’un pliage
moyenneAge :: Foldable t => t Personne -> Int
moyenneAge xs = foldl (\acc (Personne p n a t) -> acc + a) 0 xs `div` length xs
