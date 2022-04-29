import Text.Printf (printf)

-- Programme qui permet de jouer au fameux jeu de raisonnement mathématique 
-- le loup, la chèvre et les choux
-- Auteurs: Jonathan Friedli et Valentin Kaelin


-- Créations des différentes structures de données
-- Ici nous avons choisi de ne pas modéliser le fermier. 
-- Nous considérons que le fermier sera toujours au même endroit que le bateau
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
  show LeftSide = "gauche"
  show RightSide = "droite"

data Boat = Boat
  { side :: BoatSide,
    passenger :: [Passenger]
  }

instance Show Boat where
  show (Boat side pass) = "Rive " ++ show side ++ " et contient: " ++ show pass

-- Un état du jeu est représenté par liste des passagers sur la rive gauche, une liste pour la rive droite
-- et un boat.
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

startingMessage :: String
startingMessage = "Bienvenue au jeu de la rivière ! Tapez \":h\" pour obtenir de l'aide.\n" ++ show startingState

startingState :: State
startingState = State [Wolf, Goat, Cabbage] (Boat LeftSide []) []

-- Fonction main affichant le message de bienvenue et récupère l'input
main :: IO ()
main = do
    putStrLn startingMessage
    getInput startingState


-- Récupère l'input de l'utilisateur.
-- Si l'input est ":q" nous quittons le programme
-- Sinon nous utilisons la fonction checkInput 
getInput :: State -> IO ()
getInput state = do
  s <- getLine
  if s == ":q"
    then putStrLn "Au revoir"
    else do
      let current = checkInput s state
      snd current
      getInput $ fst current

-- La fonction checkInput permet de vérifier si l'input utilisateur correspond à une fonction.
-- Cette fonction renvoie un tuple contenant un état du jeu et un potentiel message d'erreur
-- Par exemple, si nous tentons de
checkInput :: [Char] -> State -> (State, IO ())
checkInput input state
  | input == ":p" = (state, print state)
  -- Nous vérifions si il est possible de charger la chèvre. Si c'est impossible nous renvoyons un message d'erreur
  | input == ":l Goat" = if snd gState then (fst gState, return ()) else (state, impossible)
  -- Idem que pour la chèvre
  | input == ":l Cabbage" = if snd cState then (fst cState, return ()) else (state, impossible)
  -- Idem que pour la chèvre
  | input == ":l Wolf" = if snd wState then (fst wState, return ()) else (state, impossible)
  -- Nous vérifions à chaque unload si le jeu est terminé. Si oui, nous affichons un message
  | input == ":u" = if isFinished uState then (uState, finished uState) else (uState, return ())
  -- Nous vérifions s'il est possible de bouger le bateau. (ex: il est impossible de bouger le bateau si il ne reste que la chèvre et le loup sur la rive)
  | input == ":m" = if isStateValid mState then (mState, return ()) else (state, impossible)
  | input == ":r" = (startingState, return ())
  | input == ":h" = (state, help)
  -- Si la commande ne correspond à aucun pattern testé, retourne un message d'erreur
  | otherwise = (state, putStrLn "Input invalide, tapez :h pour l'aide")
  where
    gState = load Goat state
    cState = load Cabbage state
    wState = load Wolf state
    uState = unload state
    mState = move state

-- Bouge le bateau sur l'autre rive
move :: State -> State
move state = State (leftPpl state) (changeSide (boat state)) (rightPpl state)

-- Fonction permettant de changer le côté du bateau.
-- est utilisé dans la fonction move
changeSide :: Boat -> Boat
changeSide boat
  | side boat == LeftSide = Boat RightSide (passenger boat)
  | otherwise = Boat LeftSide (passenger boat)

-- Permet de charger un passager sur le bateau
-- Retourne un tuple contenant un état du jeu et un bool disant si l'on peut load ce passager
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

-- Enlève un passager d'une liste de passager.
-- Vu qu'il n'existe qu'une seule instance pour chaque passager, dès que nous le trouvons dans la liste nous pouvons arrêter la récursion
removePassenger :: Passenger -> [Passenger] -> [Passenger]
removePassenger _ [] = []
removePassenger pass (x : xs)
  | pass == x = xs
  | otherwise = x : removePassenger pass xs

-- Décharge le passager du bateau. Si le bateau est vide, cette fonction ne fait rien
unload :: State -> State
unload state
  | null (passenger (boat state)) = state
  | side (boat state) == LeftSide = State (leftPpl state ++ passenger b) (Boat (side b) []) (rightPpl state)
  | otherwise = State (leftPpl state) (Boat (side b) []) (rightPpl state ++ passenger b)
  where
    b = boat state

-- Vérifie si un état de jeu est valide ou non
isStateValid :: State -> Bool
isStateValid state
  | side (boat state) == LeftSide = notElem Goat rPpl || length rPpl == 1
  | otherwise = notElem Goat lPpl || length lPpl == 1
  where
    rPpl = rightPpl state
    lPpl = leftPpl state

-- Vérifie si le jeu est terminé
isFinished :: State -> Bool
isFinished state = length (rightPpl state) == 3

-- Permet d'afficher tous les passagers d'une liste de passagers
displayPassengers :: [Passenger] -> [Char]
displayPassengers [] = "[]"
displayPassengers (x : xs)
  | null xs = show x
  | otherwise = show x ++ " " ++ displayPassengers xs

-- Affiche l'aide
help :: IO ()
help = do
  putStrLn "---------------------------------------------------------------------------------"
  putStrLn "Voici la liste des commandes :"
  printf "%-15s %s" ":p" "Afficher l'état du jeu\n"
  printf "%-15s %s" ":l <passager>" "Charger le bateau (exemple: \":l Goat\")\n"
  printf "%-15s %s" ":u" "Décharger le bateau\n"
  printf "%-15s %s" ":m" "Bouger le bateau\n"
  printf "%-15s %s" ":r" "Restart le jeu\n"
  printf "%-15s %s" ":q" "Quitter le jeu\n"
  printf "%-15s %s" ":h" "Afficher l'aide\n"
  putStrLn "---------------------------------------------------------------------------------"