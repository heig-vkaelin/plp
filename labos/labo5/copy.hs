-- ---------------------------
-- Exercice 4
-- ---------------------------

import Control.Monad
import System.Directory
import System.Environment

main = do
  args <- getArgs
  unless (length args /= 2) $ do
    let (src : dst : _) = args
    copyFile src dst

-- V2 avec une copie manuelle

mainV2 = do
  args <- getArgs
  unless (length args /= 2) $ do
    let (src : dst : _) = args
    contents <- readFile src
    writeFile dst contents
