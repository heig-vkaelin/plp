import Text.Printf (printf)
import Control.Monad
import Data.ByteString (isInfixOf)
import Data.String
data Passenger = Cabbage | Goat | Wolf | Fisherman deriving (Eq)

instance Show Passenger where 
    show Cabbage = "Choux"
    show Goat = "Chevre"
    show Wolf = "Loup"
    show Fisherman = "Pecheur"

data BoatSide = LeftSide | RightSide deriving (Eq)

instance Show BoatSide where
    -- show LeftSide  = " |<__> ~ ~ ~ riviere ~ ~ ~     | "
    -- show RightSide = " |     ~ ~ ~ riviere ~ ~ ~ <__>| "
    show LeftSide  = "gauche"
    show RightSide = "droite"

data Boat = Boat{
    side :: BoatSide,
    passengers :: [Passenger]
}

instance Show Boat where
    show (Boat side pass) = "Rive " ++ show side ++ " et contient: " ++ displayList pass

data State = State {
    leftPpl  :: [Passenger],
    boat    :: Boat, 
    rightPpl :: [Passenger] 
}

instance Show State where
    show (State lxs boat rxs) = 
        do 
            printf "%13s" "Rive gauche: " ++ displayList lxs ++ "\n" 
            ++ printf "%13s" "Bateau: " ++ show boat ++ "\n" 
            ++ printf "%13s" "Rive droite: " ++ displayList rxs
            ++ "\n---------------------------------------------------------------------------------"

startingState = State [Wolf, Goat, Cabbage, Fisherman] (Boat LeftSide []) []
test = State [Wolf, Cabbage] (Boat RightSide [Goat, Fisherman]) []
test2 = State [] (Boat RightSide [Goat, Fisherman]) [Wolf, Cabbage]

main = getInput test2

getInput :: State -> IO ()
getInput state = do
    s <- getLine
    -- Le check ferait plus de sens dans la méthode checkInput mais ça duplique le "getInput" partout sauf pour ":q"
    if s == ":q" 
        then putStrLn "Au revoir"
        else 
            do 
                let current = checkInput s state
                print current
                getInput current
                
-- TODO: refactor la condtion (j'ai rarement fait un truc aussi sale)
checkInput input state
     | input == ":p" = state
--     | fromString ":l" `isInfixOf` fromString input = putStrLn "Load"
     | input == ":l Fisherman" = if isStateValid fState then fState else state
     | input == ":l Goat" = if isStateValid gState then gState else state
     | input == ":l Cabbage" = if isStateValid cState then cState else state
     | input == ":l Wolf" = if isStateValid wState then wState else state
     | input == ":u" = if isFinished uState then error "FINI !" else uState
     | input == ":m" = move state
     | input == ":r" = startingState
--     | input == ":h" = help 
     | otherwise = error "Input invalide"
     where 
        fState = load Fisherman state
        gState = load Goat state
        cState = load Cabbage state
        wState = load Wolf state
        uState = unload state

-- Move the boat to the other side if the fishermann is in it. Otherwise does nothing
move :: State -> State
move state
    | Fisherman `elem` passengers (boat state) = State (leftPpl state) (changeSide (boat state)) (rightPpl state)
    | otherwise = state

-- Small function that create a state similar to the one we give in parameters but the riverside is changed
-- Its used in the move function
changeSide :: Boat -> Boat
changeSide boat
    | side boat == LeftSide = Boat RightSide (passengers boat) 
    | otherwise = Boat LeftSide (passengers boat)

load :: Passenger -> State -> State 
load pass state
    | length(passengers (boat state)) == 2 = state
    | s == LeftSide && pass `elem` leftPpl state = State (removePassenger pass (leftPpl state)) 
                                                    (Boat s (pass :passengers(boat state))) (rightPpl state)
    | s == RightSide && pass `elem` rightPpl state = State (leftPpl state) (Boat s (pass :passengers(boat state))) 
                                                    (removePassenger pass (rightPpl state))
    | otherwise = state 
    where s = side (boat state)

-- Remove a passenger from a list of passenger. As there is only 1 passenger of every type, 
-- if we find that passenger we dont need to finish the recursion
removePassenger :: Passenger -> [Passenger] -> [Passenger]
removePassenger _  [] = []
removePassenger pass (x:xs)
    | pass == x = xs
    | otherwise = x: removePassenger pass xs

-- Unload all passengers from the boat. If the boat is already empty it does nothing
unload :: State -> State
unload state
    | null (passengers (boat state)) = state
    | side (boat state) == LeftSide = State (leftPpl state ++ passengers b) (Boat (side b) []) (rightPpl state)
    | otherwise = State (leftPpl state) (Boat (side b) []) (rightPpl state ++ passengers b)
    where b = boat state

-- Say if a list of passanger is illegal
-- TODO: Refactor la condition ?
isListValid :: [Passenger] -> Bool
isListValid xs = Fisherman `elem` xs || (not (Goat `elem` xs && Wolf `elem` xs) && not (Goat `elem` xs && Cabbage `elem` xs))

isStateValid state = isListValid (leftPpl state) && isListValid (rightPpl state) && isListValid (passengers(boat state))

isFinished state = length (rightPpl state) == 4

-- Display a list of Passenger
displayList :: [Passenger] -> [Char]
displayList [] = "[]"
displayList (x:xs)
 | null xs = show x
 | otherwise = show x ++ " " ++ displayList xs

-- Show all the command we can use
help :: IO ()
help = do
    putStrLn "Voici la liste des commandes :"
    printf "%-15s %s" ":p" "Afficher l'état du jeu\n"
    printf "%-15s %s" ":l <passager>" "Charger le bateau\n"
    printf "%-15s %s" ":u" "Décharger le bateau\n"
    printf "%-15s %s" ":m" "Bouger le bateau\n"
    printf "%-15s %s" ":r" "Restart le jeu\n"
    printf "%-15s %s" ":q" "Quitter le jeu\n"