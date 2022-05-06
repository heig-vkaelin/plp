-- Ex 2
data Expr
  = Cst Bool
  | Neg Expr
  | And Expr Expr
  | Or Expr Expr
  deriving (Show)

eval :: Expr -> Bool
eval (Cst v) = v
eval (Neg v) = not (eval v)
eval (And x y) = eval x && eval y
eval (Or x y) = eval x || eval y


-- Ex 3
data Bit = Zero | One
data Direction = NigLeft | NigRight
data Bitwise
  = Cst [Bit]
  | Compl Bitwise
  | And Bitwise Bitwise
  | Or Bitwise Bitwise
  | Xor Bitwise Bitwise
  | LShift Direction Bitwise
  | CShift Direction Bitwise

invert:: Bit -> Bit
invert Zero = One
invert One = Zero

and':: Bit -> Bit -> Bit
and' One One = One
and' _ _ = Zero

or':: Bit -> Bit -> Bit
or' Zero Zero = Zero
or' _ _ = One

xor':: Bit -> Bit -> Bit
xor' Zero Zero = Zero
xor' One One = Zero
xor' _ _ = One

lshift:: Direction -> [Bit] -> [Bit]
lshift NigLeft = reverse . drop 1 . reverse
lshift NigRight = drop 1

cshift :: Direction -> [Bit] -> [Bit]
cshift NigLeft x = tail x ++ [head x]
cshift NigRight x = last x : init x

{- map on two arrays at the same time -}
map2 :: (a -> b -> c) -> [a] -> [b] -> [c]
map2 f xs ys = [f x y | (x, y) <- zip xs ys]

eval :: Bitwise -> [Bit]
eval (Cst x) = x
eval (Compl x) = map invert (eval x)
eval (And x y) = map2 and' (eval x) (eval y)
eval (Or x y) = map2 or' (eval x) (eval y)
eval (Xor x y) = map2 xor' (eval x) (eval y)
eval (LShift d x) = lshift d $ eval x
eval (CShift d x) = cshift d $ eval x
