import Control.Exception
import Eval
import Language
import Lexer
import Parser
import Semantics
import Text.Printf (printf)

-- Programme qui implémente une boucle de lecture-évaluation-impression (REPL).
-- Une entrée utilisateur donnée doit valider toutes les phases d’analyse avant
-- de pouvoir évaluer le terme qui en découle. De plus, le programme maintient à jour
-- un environnement global.
-- Auteurs: Jonathan Friedli et Valentin Kaelin
-- Date de dernière modification: 06 juin 2022

-- Environnement
data State
  = ValidState TEnv Env
  | InvalidState TEnv Env String

initEnv :: State
initEnv = ValidState [] []

-- Fonction principale du programme
main :: IO ()
main = do
  putStrLn startingMessage
  repl initEnv

repl :: State -> IO ()
repl (InvalidState oldTEnv oldEnv msg) = putStrLn msg >> repl (ValidState oldTEnv oldEnv)
repl state@(ValidState tEnv env) = do
  line <- getLine
  case line of
    ":q" -> putStrLn "Au revoir"
    ":r" -> repl initEnv
    ":{" -> putStrLn ":{" >> repl state -- TODO
    ":}" -> putStrLn ":}" >> repl state -- TODO
    (':' : 't' : ' ' : rest) -> tryTypeOf rest tEnv >> repl state
    ":e" -> print env >> print tEnv >> repl state
    ":h" -> help >> repl state
    _ ->
      case semantic `seq` eval stmt env of -- utilisation de seq pour forcer le typeOf avant l'evaluation
        Left env' -> repl (ValidState tEnv' env')
        Right value -> print value >> repl state
      where
        stmt = parseStmt line
        semantic@(tEnv', t) = typeof stmt tEnv

parseStmt :: String -> Statement
parseStmt stmt = parser $ lexer stmt

tryTypeOf :: String -> TEnv -> IO ()
tryTypeOf str tEnv = catch (print $ snd (typeof (parseStmt str) tEnv)) handler

handler :: SomeException -> IO ()
handler = print

-- Affichage de l'aide
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
