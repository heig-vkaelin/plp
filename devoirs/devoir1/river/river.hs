--import Control.Monad
import Data.String
import Text.Printf (printf)

data Passenger
  = Cabbage
  | Goat
  | Wolf
  deriving (Eq)

instance Show Passenger where
  show Cabbage = "Choux"
  show Goat = "Chevre"
  show Wolf = "Loup"

data BoatSide
  = LeftSide
  | RightSide
  deriving (Eq)

instance Show BoatSide where
  -- show LeftSide  = " |<__> ~ ~ ~ riviere ~ ~ ~     | "
  -- show RightSide = " |     ~ ~ ~ riviere ~ ~ ~ <__>| "
  show LeftSide = "gauche"
  show RightSide = "droite"

data Boat = Boat
  { side :: BoatSide,
    passenger :: [Passenger]
  }

instance Show Boat where
  show (Boat side pass) = "Rive " ++ show side ++ " et contient: " ++ show pass

data State = State
  { leftPpl :: [Passenger],
    boat :: Boat,
    rightPpl :: [Passenger]
  }

instance Show State where
  show (State lxs boat rxs) =
    do
      printf "%s\n%13s" separation "Rive gauche: " ++ displayPassengers lxs ++ "\n"
      ++ printf "%13s" "Bateau: "
      ++ show boat
      ++ "\n"
      ++ printf "%13s" "Rive droite: "
      ++ displayPassengers rxs
      ++ "\n"
      ++ separation

separation :: String
separation = "---------------------------------------------------------------------------------"

impossible :: IO ()
impossible = putStrLn "Opération impossible"

finished :: State -> IO ()
finished state = putStrLn (show state ++ "\nVous avez fini ! Tapez :r pour recommencer ou :q pour quitter")

startingState :: State
startingState = State [Wolf, Goat, Cabbage] (Boat LeftSide []) []

main :: IO ()
main = getInput startingState

getInput :: State -> IO ()
getInput state = do
  s <- getLine
  if s == ":q"
    then putStrLn "Au revoir"
    else do
      let current = checkInput s state
      snd current
      getInput $ fst current

checkInput :: [Char] -> State -> (State, IO ())
checkInput input state
  | input == ":p" = (state, print state)
  | input == ":l Goat" = if isStateValid (fst gState) && snd gState then (fst gState, return ()) else (state, impossible)
  | input == ":l Cabbage" = if isStateValid (fst cState) && snd cState then (fst cState, return ()) else (state, impossible)
  | input == ":l Wolf" = if isStateValid (fst wState) && snd wState then (fst wState, return ()) else (state, impossible)
  | input == ":u" = if isFinished uState then (uState, finished uState) else (uState, return ())
  | input == ":m" = if isStateValid mState then (mState, return ()) else (state, impossible)
  | input == ":r" = (startingState, return ())
  | input == ":h" = (state, help)
  | otherwise = (state, putStrLn "Input invalide, tapez :h pour l'aide")
  where
    gState = load Goat state
    cState = load Cabbage state
    wState = load Wolf state
    uState = unload state
    mState = move state

-- Move the boat to the other side if the fishermann is in it. Otherwise does nothing
move :: State -> State
move state = State (leftPpl state) (changeSide (boat state)) (rightPpl state)

-- Small function that create a state similar to the one we give in parameters but the riverside is changed
-- Its used in the move function
changeSide :: Boat -> Boat
changeSide boat
  | side boat == LeftSide = Boat RightSide (passenger boat)
  | otherwise = Boat LeftSide (passenger boat)

load :: Passenger -> State -> (State, Bool)
load pass state
  -- Bateau deja plein, on ne fait rien
  | length (passenger (boat state)) == 1 = (state, False)
  -- Si le bateau est sur la rive gauche et que que le passager qu'on veut load est aussi sur cette rive
  | bSide == LeftSide && pass `elem` leftPpl state =
    ( State
        (removePassenger pass (leftPpl state))
        (Boat bSide (pass : passenger (boat state)))
        (rightPpl state),
      True
    )
  -- Si le bateau est sur la rive droite et que que le passager qu'on veut load est aussi sur cette rive
  | bSide == RightSide && pass `elem` rightPpl state =
    ( State
        (leftPpl state)
        (Boat bSide (pass : passenger (boat state)))
        (removePassenger pass (rightPpl state)),
      True
    )
  | otherwise = (state, False)
  where
    bSide = side (boat state)

-- Remove a passenger from a list of passenger. As there is only 1 passenger of every type,
-- if we find that passenger we dont need to finish the recursion
removePassenger :: Passenger -> [Passenger] -> [Passenger]
removePassenger _ [] = []
removePassenger pass (x : xs)
  | pass == x = xs
  | otherwise = x : removePassenger pass xs

-- Unload the passenger from the boat. If the boat is already empty it does nothing
unload :: State -> State
unload state
  | null (passenger (boat state)) = state
  | side (boat state) == LeftSide = State (leftPpl state ++ passenger b) (Boat (side b) []) (rightPpl state)
  | otherwise = State (leftPpl state) (Boat (side b) []) (rightPpl state ++ passenger b)
  where
    b = boat state

isStateValid :: State -> Bool
isStateValid state
  | side (boat state) == LeftSide = notElem Goat rPpl || length rPpl == 1
  | otherwise = notElem Goat lPpl || length lPpl == 1
  where
    rPpl = rightPpl state
    lPpl = leftPpl state

isFinished :: State -> Bool
isFinished state = length (rightPpl state) == 3

displayPassengers :: [Passenger] -> [Char]
displayPassengers [] = "[]"
displayPassengers (x : xs)
  | null xs = show x
  | otherwise = show x ++ " " ++ displayPassengers xs

-- Show all the command we can use
help :: IO ()
help = do
  putStrLn "---------------------------------------------------------------------------------"
  putStrLn "Voici la liste des commandes :"
  printf "%-15s %s" ":p" "Afficher l'état du jeu\n"
  printf "%-15s %s" ":l <passager>" "Charger le bateau\n"
  printf "%-15s %s" ":u" "Décharger le bateau\n"
  printf "%-15s %s" ":m" "Bouger le bateau\n"
  printf "%-15s %s" ":r" "Restart le jeu\n"
  printf "%-15s %s" ":q" "Quitter le jeu\n"
  printf "%-15s %s" ":h" "Afficher l'aide\n"
  putStrLn "---------------------------------------------------------------------------------"
