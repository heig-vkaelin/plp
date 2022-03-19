-- ---------------------------
-- Exercices 4 et 5
-- ---------------------------

-- Définissez un type Arbre que vous exposerez via un module et créez une fonction d'insertion,
-- ce qui vous permettra de créer aisément un arbre à partir d'une liste d'éléments.

-- Ajoutez ensuite une opération de test d'appartenance :
-- contient :: ... => Arbre t -> t -> Bool

-- Quelle est la contrainte de classe sur le type des éléments ?

-- Créez une fonction qui aplatit un arbre et rend la liste des éléments :
-- aplatir :: Arbre t -> [t]

-- Dérivez votre type Arbre de la classe de type Functor.
-- Testez le fonctionnement de votre dérivation en appliquant une fonction aux éléments de l'arbre.

-- Vérifiez que les propriétés attendues soient respectées :
-- fmap id = id
-- fmap f . fmap g = fmap f . g

-- Exo 5:

-- Définissez une fonction qui permet de déterminer si un arbre est symétrique, c.-à-d. si ses
-- deux sous-arbres gauche et droit sont en miroir (on ne se préoccupe pas de la valeur des noeuds,
-- uniquement de la structure).
