module Natural where

-- https://hackage.haskell.org/package/number-0.1.1.0/docs/src/Data-Number-Peano.html
-- http://cmsc-16100.cs.uchicago.edu/2014/Lectures/Lecture-02/NaturalNumber.hs

data Nat
  = Z
  | S Nat
  deriving (Show)

deux = S $ S Z

trois = S $ S $ S Z

trois' = S $ S $ S Z

-- instance Num Nat where
--   (+) Z n = n
--   (+) n Z = n
--   (+) (S n) (S m) = S $ S $ (+) n m

--   (*) Z n = Z
--   (*) n Z = Z
--   (*) (S n) (S m) = S Z + n + m + (n * m)

--   abs = id

--   signum _ = S Z

--   fromInteger i
--     | i <= 0 = Z
--     | otherwise = S $ fromInteger $ i - 1

--   (-) Z n = Z
--   (-) n Z = n
--   (-) (S n) (S m) = n - m

instance Eq Nat where
  Z == Z = True
  Z == S _ = False
  S _ == Z = False
  S x == S y = x == y

instance Ord Nat where
  compare Z Z = EQ
  compare Z (S _) = LT
  compare (S _) Z = GT
  compare (S n) (S m) = compare n m

toPeano :: (Num t, Ord t) => t -> Nat
toPeano 0 = Z
toPeano x
  | x < 0 = Z
  | otherwise = S $ toPeano $ x - 1

fromPeano :: Num p => Nat -> p
fromPeano Z = 0
fromPeano (S x) = 1 + fromPeano x

-- TODO:
-- arithmétiques: +, -, *, ^
-- fonctions: zero, succ, pred, isZero
