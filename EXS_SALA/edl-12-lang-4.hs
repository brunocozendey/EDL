
data Exp = Alg | Log
    deriving Show 
    
data Alg = Num Int
         | Add Alg Alg
         | Sub Alg Alg
    deriving Show

data Log = Res Bool
         | Or Log Log
         | And Log Log
         | Not Log
    deriving Show

imprime :: Exp -> String
imprime (Num x) = show x
imprime (Add e0 e1) = (imprime e0)++ " + " ++ (imprime e1) 
imprime (Sub e0 e1) = (imprime e0)++ " - " ++ (imprime e1)
imprime (And e0 e1) = (imprime e0)++ " and " ++ (imprime e1)
imprime (Or e0 e1) = (imprime e0)++ " or " ++ (imprime e1)
imprime (Not e0) = "not " ++ (imprime e0)

avalia :: Exp -> Int
avalia(Num x) = x
avalia(Add e0 e1) = (avalia e0) + (avalia e1)
avalia(Sub e0 e1) = (avalia e0) - (avalia e1)
avalia(And e0 e1) = (avalia e0 && avalia e1)
avalia(Or e0 e1) = (avalia e0 || avalia e1)
--avalia(Not e0) = 

avalia' :: Exp -> Exp
avalia' (Num x) = Num x
avalia' (Add e0 e1) = Num((avalia e0)+(avalia e1))
avalia' (Sub e0 e1) = Num((avalia e0)-(avalia e1))


--1
--e0 = Num 1

--1 + 10 - 20
--e1 =  Sub (Add (Num 1) (Num 10)) (Num 20)

--1 + (10 - 20)
--e2 = Add (Num 1) (Sub (Num 10) (Num 20)) 

--(5 + 5) - (5 - 5)
--e3 = Sub (Add (Num 5) (Num 5)) (Sub (Num 5) (Num 5))

e1 = Add (Add (Add (Num 1) (Num 2)) (Num 3)) (Num 4)
e2 = Add (Num 1) (Add (Num 2) (Add (Num 3) (Num 4)))
e3 = Sub (Sub (Sub (Num 1) (Num 2)) (Num 3)) (Num 4)
e4 = Sub (Num 1) (Sub (Num 2) (Sub (Num 3) (Num 4)))
e5 = Sub (Sub (Num 1) (Num 2)) (Sub (Num 3) (Num 4))


-- Quando for criar a expressáo "escrita" colocar o = a resultado no final

--main = print $ (imprime e1,  avalia e1, imprime e2,  avalia e2, imprime e3,  avalia e3, imprime e4,  avalia e4,imprime e5,  avalia e5, imprime e6, avalia e6)
main = print (imprime e1)