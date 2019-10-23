data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
         | Mul Exp Exp
         | Div Exp Exp
    deriving Show
--

imprime :: Exp -> String
imprime (Num x) = show x
imprime (Add e0 e1) = (imprime e0)++ " + " ++ (imprime e1) 
imprime (Sub e0 e1) = (imprime e0)++ " - " ++ (imprime e1)
imprime (Mul e0 e1) = (imprime e0)++ " * " ++ (imprime e1) 
imprime (Div e0 e1) = (imprime e0)++ " / " ++ (imprime e1)


avalia :: Exp -> Int
avalia(Num x) = x
avalia(Add e0 e1) = avalia e0 + avalia e1
avalia(Sub e0 e1) = avalia e0 - avalia e1
avalia(Mul e0 e1) = avalia e0 * avalia e1
avalia(Div e0 e1) = avalia e0 `div` avalia e1

avalia' :: Exp -> Exp
avalia' (Num x) = Num x
avalia' (Add e0 e1) = Num((avalia e0)+(avalia e1))
avalia' (Sub e0 e1) = Num((avalia e0)-(avalia e1))
avalia' (Mul e0 e1) = Num((avalia e0)*(avalia e1))
avalia' (Div e0 e1) = Num((avalia e0) `div` (avalia e1))


--1
e0 = Num 1

--1 + 10 - 20
e1 =  Sub (Add (Num 1) (Num 10)) (Num 20)

--1 + (10 - 20)
e2 = Add (Num 1) (Sub (Num 10) (Num 20)) 

--(5 + 5) - (5 - 5)
e3 = Sub (Add (Num 5) (Num 5)) (Sub (Num 5) (Num 5))

eTeste = Div (Mul (Num 5) (Num 5)) (Num 5)
-- Quando for criar a expressáo "escrita" colocar o = a resultado no final

main = print $ (e0, e1, e2, e3, imprime e2, avalia eTeste, avalia' eTeste)
