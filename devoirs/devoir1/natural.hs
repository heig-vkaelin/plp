module Natural where

data Nat
  = Z
  | S Nat
  deriving (Show)

add :: Nat -> Nat -> Nat
add Z n = n
add n Z = n
add (S n) (S m) = S $ S $ add n m

sub :: Nat -> Nat -> Nat
sub Z n = Z
sub n Z = n
sub (S n) (S m) = sub n m

mult :: Nat -> Nat -> Nat
mult Z n = Z
mult n Z = Z
mult (S n) m = add m (mult n m)

pow :: (Eq t, Num t) => Nat -> t -> Nat
pow x 0 = S Z
pow x 1 = x
pow x n = mult x (pow x (n - 1))

eq :: Nat -> Nat -> Bool
eq Z Z = True
eq Z _ = False
eq _ Z = False
eq (S n) (S m) = eq n m

notEq :: Nat -> Nat -> Bool
notEq x y = not $ eq x y

lt :: Nat -> Nat -> Bool
lt Z Z = False
lt Z _ = True
lt _ Z = False
lt (S n) (S m) = lt n m

lte :: Nat -> Nat -> Bool
lte x y = eq x y || lt x y

gt :: Nat -> Nat -> Bool
gt x y = not $ lte x y

gte :: Nat -> Nat -> Bool
gte x y = eq x y || gt x y

fromInt :: (Num t, Ord t) => t -> Nat
fromInt 0 = Z
fromInt x
  | x <= 0 = Z
  | otherwise = S $ fromInt $ x - 1

toInt :: Num p => Nat -> p
toInt Z = 0
toInt (S x) = 1 + toInt x

toString :: Nat -> String
toString Z = "Z"
toString (S x) = "S(" ++ toString x ++ ")"

zero :: Nat
zero = Z

isZero :: Nat -> Bool
isZero Z = True
isZero _ = False

successor :: Nat -> Nat
successor = S

predecessor :: Nat -> Nat
predecessor Z = Z
predecessor (S x) = x
