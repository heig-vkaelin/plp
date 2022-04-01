-- ---------------------------
-- Exercice 5
-- ---------------------------

import Control.Exception

data MyException = NotFound
  deriving (Show)

instance Exception MyException

nieme n [] = throw NotFound
nieme n (x : xs)
  | n == 0 = x
  | otherwise = nieme (n - 1) xs

nieme' n [] = Nothing
nieme' n (x : xs)
  | n == 0 = Just x
  | otherwise = nieme' (n - 1) xs
