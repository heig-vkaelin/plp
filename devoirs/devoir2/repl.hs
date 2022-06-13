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
-- Date de dernière modification: 17 juin 2022

-- Environnement
data State
  = ValidState TEnv Env
  | MessageState TEnv Env String

-- Initialise le state avec un environnement vide
initEnv :: State
initEnv = ValidState [] []

-- Fonction principale du programme
main :: IO ()
main = do
  putStrLn startingMessage
  repl initEnv

-- Boucle de "Read-Eval-Print"
repl :: State -> IO ()
repl (MessageState tEnv env msg) = do
  catch (putStrLn msg) handler
  repl (ValidState tEnv env)
  where
    handler :: SomeException -> IO ()
    handler = print
repl state@(ValidState tEnv env) = do
  line <- getLine
  case line of
    ":q" -> putStrLn "Au revoir"
    ":r" -> repl initEnv
    ":{" -> do
      content <- readUntil (== ":}")
      evaluateLineByLine content state
      where
        evaluateLineByLine [] state' = repl state'
        evaluateLineByLine (line : rest) state' = do
          state'' <- applyEvaluate line state'
          evaluateLineByLine rest state''
    (':' : 't' : ' ' : rest) -> repl (MessageState tEnv env (show $ snd (typeof (parseStmt rest) tEnv)))
    ":e" -> repl (MessageState tEnv env (show env ++ "\n" ++ show tEnv))
    ":h" -> help >> repl state
    _ -> do
      state' <- applyEvaluate line state
      repl state'

-- Applique l'évaluation sur une ligne
applyEvaluate :: String -> State -> IO State
applyEvaluate line state@(ValidState tEnv env) = do
  catch
    ( do
        stmt <- evaluate (parseStmt line)
        semantic@(tEnv', t) <- evaluate (typeof stmt tEnv)
        -- astuce pour forcer l'évaluation du typeof avant celle de l'eval
        let tEnv'' = if t == Language.TUniversal then tEnv' else tEnv'
        case tEnv'' `seq` eval stmt env of
          Left env' -> return (ValidState tEnv'' env')
          Right value -> return (MessageState tEnv env (show value))
    )
    handler
  where
    handler :: SomeException -> IO State
    handler error = return (MessageState tEnv env (show error))
applyEvaluate _ _ = error "applyEvaluate: impossible"

-- Parse un statement
parseStmt :: String -> Statement
parseStmt stmt = parser $ lexer stmt

-- Lit les entrées utilisateur jusqu'à la validation de la condition
readUntil :: (String -> Bool) -> IO [String]
readUntil = collectUntil getLine

-- Source: https://stackoverflow.com/a/49968517
collectUntil :: (Monad m) => m a -> (a -> Bool) -> m [a]
collectUntil act f = do
  x <- act
  if f x
    then return []
    else (x :) <$> collectUntil act f

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
