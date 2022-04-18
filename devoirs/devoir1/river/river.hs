import Text.Printf (printf)
data Passenger = Cabbage | Goat | Wolf | Fisherman

instance Show Passenger where 
    show Cabbage = "choux"
    show Goat = "chevre"
    show Wolf = "loup"
    show Fisherman = "pecheur"

data BoatSide = LeftSide | RightSide

instance Show BoatSide where
    show LeftSide  = " |<__> ~ ~ ~ riviere ~ ~ ~     | "
    show RightSide = " |     ~ ~ ~ riviere ~ ~ ~ <__>| "

data State = State {
    leftPpl  :: [Passenger],
    bSide    :: BoatSide, 
    rightPpl :: [Passenger] 
}

instance Show State where
    show (State lxs bSide rxs) = displayList lxs ++ show bSide ++ displayList rxs

startingState = State [Wolf, Goat, Cabbage, Fisherman] LeftSide []

displayList [] = ""
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