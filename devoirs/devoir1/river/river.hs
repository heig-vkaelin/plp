import Text.Printf (printf)
import Control.Monad
import Data.ByteString (isInfixOf)
import Data.String
data Passenger = Cabbage | Goat | Wolf | Fisherman

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

startingState = State [Wolf, Goat, Cabbage, Fisherman] (Boat LeftSide []) []
test = State [Wolf, Cabbage] (Boat RightSide [Goat, Fisherman]) []
test2 = State [Wolf, Cabbage] (Boat RightSide []) [Goat, Fisherman]

main = getInput test

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
                

checkInput input state
     | input == ":p" = state
--     | fromString ":l" `isInfixOf` fromString input = putStrLn "Load"
     | input == ":u" = unload state
     | input == ":m" = move state
     | input == ":r" = startingState
--     | input == ":h" = help 
     | otherwise = error "Input invalide"

move :: State -> State
move state = State (leftPpl state) (changeSide (boat state)) (rightPpl state)

changeSide boat
    | side boat == LeftSide = Boat RightSide (passengers boat) 
    | otherwise =Boat LeftSide (passengers boat)

unload state
    | null (passengers (boat state)) = state
    | side (boat state) == LeftSide = State (leftPpl state ++ passengers b) (Boat (side b) []) (rightPpl state)
    | otherwise = State (leftPpl state) (Boat (side b) []) (rightPpl state ++ passengers b)
    where b = boat state

displayList [] = "[]"
displayList (x:xs)
 | null xs = show x
 | otherwise = show x ++ " " ++ displayList xs

help = do
    putStrLn "Voici la liste des commandes :"
    printf "%-15s %s" ":p" "Afficher l'état du jeu\n"
    printf "%-15s %s" ":l <passager>" "Charger le bateau\n"
    printf "%-15s %s" ":u" "Décharger le bateau\n"
    printf "%-15s %s" ":m" "Bouger le bateau\n"
    printf "%-15s %s" ":r" "Restart le jeu\n"
    printf "%-15s %s" ":q" "Quitter le jeu\n"