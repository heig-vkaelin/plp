-- 4. Haskell / User-defined types
-- 18.03.2022

{-
: algebraic data type
-}

-- sum     = Type | Type | Type ... Type
-- product = Type * Type * Type ... Type

{-
: sum
-}

data Null = Nul

data Boolean = Truthy | Falsy

data Shape
  = Circle Double
  | Square Double
  | Rectangle Double Double

{-
: application
-}

application =
  let r = Rectangle
      r' = Rectangle 1.5
   in ()

{-
: deriving
-}

data Bit = Zero | One
  deriving (Show, Eq)

{-
: pattern matching
-}

data Op = Or | And
  deriving (Show, Eq)

truth :: Op -> Bit -> Bit -> Bit
truth Or Zero Zero = Zero
truth Or _ _ = One
truth And One One = One
truth And _ _ = Zero

-- l'air des "Shape"
area :: Shape -> Double
area (Circle r) = pi * r * r
area (Square s) = s * s
area (Rectangle w h) = w * h

{-
: product
-}

data House = Lannister | Stark | Targaryen
  deriving (Show)

data Character = Character
  { name :: String,
    house :: House
  }
  deriving (Show)

-- Pour redéfinir l'ordre des valeurs:
-- daenerys = Character { house = Targaryen, name = "daenerys" }
-- On peut utiliser "name" ou "house" afin d'avoir la valeur d'un Character
-- (comme un getter) / name daenerys

application' =
  let _ = Character "John" Stark
      arya = Character {house = Stark, name = "Arya"}
      _ = house arya
      Character {house = h} = arya
      Character h' _ = arya
   in ()

houseOf :: Character -> House
houseOf Character {house = h} = h

{-
: newType (on s'en blc un peu)
-}

data T = T Int

newtype U = U Int

{-
: parametric type
-}

-- Either
eitherUsage =
  let _ = Left "foo"
      _ = Right True
   in ()

data MyEither a b
  = MyLeft a
  | MyRight b
  deriving (Show, Eq)

-- MyEither f g (MyLeft x) = f x
-- MyEither f g (MyRight x) = g x

-- pad "foo" (MyLeft "   ") -> "   foo" / 3 espaces
-- pad "foo" (MyRight 5)    -> "     foo" / 5 espaces
pad :: String -> MyEither String Int -> String
pad s (MyLeft p) = p ++ s
pad s (MyRight n) = replicate n ' ' ++ s

{-
: type
-}

indexOf c cs = indexOf' c cs 0
  where
    indexOf' _ [] _ = -1
    indexOf' x (y : ys) idx
      | x == y = idx
      | otherwise = indexOf' x ys (idx + 1)

{-
: maybe
-}

data MyMaybe a
  = MyNothing
  | MyJust a
  deriving (Eq, Show)

find'' :: (a -> Bool) -> [a] -> Maybe a
find'' _ [] = Nothing
find'' f (x : xs)
  | f x = Just x
  | otherwise = find'' f xs

{-
: recursive type
-}

data MyList a
  = Nil
  | Cons a (MyList a)
  deriving (Eq, Show)

myHead :: MyList a -> a
myHead (Cons h _) = h

myLength Nil = 0
myLength (Cons h t) = 1 + myLength t

-- pour tester: myLength (Cons 1 (Cons 2 (Cons 3 Nil)))

myTail :: MyList a -> MyList a
myTail (Cons _ t) = t

{-
: type class instance
-}

data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun

instance Show Day where
  show Mon = "Monday"
  show Tue = "Tuesday"
  show _ = "..."

-- instance Enum Day where
--   succ Mon = Tue
--   succ Tue = Wed
--   succ Wed = Thu
--   succ Thu = Fri
--   succ Fri = Sat
--   succ Sat = Sun
--   succ Sun = Mon

data Tuple a b = Tuple a b -- 2e "Tuple" = nom du constructeur
-- deriving (Show) -- version qui print tout en dur, ex: "Tuple 1 2"

instance (Show a, Show b) => Show (Tuple a b) where
  show (Tuple x y) = "(" ++ show x ++ "," ++ show y ++ ")"

{-
: type class definition
-}

class MyEq a where
  (===) :: a -> a -> Bool
  (/==) :: a -> a -> Bool

instance MyEq Boolean where
  (===) Truthy Truthy = True
  (===) Falsy Falsy = True
  (===) _ _ = False
  (/==) x y = not (x === y)

class YesNo a where
  yesno :: a -> Bool

instance YesNo Int where
  yesno 0 = False
  yesno _ = True

instance YesNo [a] where
  yesno [] = False
  yesno _ = True

instance YesNo Boolean where
  yesno Falsy = False
  yesno Truthy = True

{-
: functor
-}

class MyFunctor f where
  myFmap :: (a -> b) -> f a -> f b

fmapUsage =
  let _ = map succ [1 .. 10]
      _ = fmap succ [1 .. 10]
   in ()

-- pour tester: fmap succ (Just 1)

instance MyFunctor MyMaybe where
  myFmap f MyNothing = MyNothing
  myFmap f (MyJust x) = MyJust (f x)

-- pour tester: myFmap succ (MyJust 1)
