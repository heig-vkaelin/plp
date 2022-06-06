import Text.Printf (printf)

-- Programme qui implémente une boucle de lecture-évaluation-impression (REPL).
-- Une entrée utilisateur donnée doit valider toutes les phases d’analyse avant
-- de pouvoir évaluer le terme qui en découle. De plus, le programme doit maintenir à jour
-- un environnement global.
-- Auteurs: Jonathan Friedli et Valentin Kaelin
-- Date de dernière modification: 06 juin 2022

-- Fonction principale du programme
main :: IO ()
main = do
    putStrLn startingMessage
    getInput

-- Récupération de l'input
getInput :: IO ()
getInput = do
  s <- getLine
  if s == ":q"
    then putStrLn "Au revoir"
    else do
    checkInput s
    getInput

-- Vérification de l'input
checkInput :: String -> IO ()
checkInput input
  | input == ":{" = putStrLn ":{"
  | input == ":}" = putStrLn ":}"
  | input == ":r" = putStrLn ":r"
  | input == ":t" = putStrLn ":t"
  | input == ":e" = putStrLn ":e"
  | input == ":h" = help
  | otherwise = putStrLn "Input invalide"

-- Affiche l'aide
help :: IO ()
help = do
  putStrLn "---------------------------------------------------------------------------------"
  putStrLn "Voici la liste des commandes :"
  printf "%-11s %s" ":{" "Activer l'édition multi-ligne ( :} pour la désactiver)\n"
  printf "%-11s %s" ":r" "Réinitialiser l'état de l'interpréteur\n"
  printf "%-11s %s" ":t <expr>" "afficher le type d'une expression\n"
  printf "%-11s %s" ":e" "afficher l'environnement\n"
  printf "%-11s %s" ":h" "Afficher l'aide\n"
  printf "%-11s %s" ":q" "Quitter le programme\n"
  putStrLn "---------------------------------------------------------------------------------"

-- Message d'accueil
startingMessage :: [Char]
startingMessage = "Bienvenue dans l'interpréteur de notre langage !\nTapez :h pour afficher l'aide."