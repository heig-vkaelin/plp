-- ---------------------------
-- Exercice 4
-- ---------------------------

data State = Q0 | Q1 | Q2 | Q3

f :: State -> String -> State
f Q0 ('0' : xs) = f Q2 xs
f Q0 ('1' : xs) = f Q1 xs
f Q1 ('0' : xs) = f Q3 xs
f Q1 ('1' : xs) = f Q1 xs
f Q2 (_ : xs) = f Q2 xs
f Q3 ('0' : xs) = f Q3 xs
f Q3 ('1' : xs) = f Q1 xs
f x _ = x
