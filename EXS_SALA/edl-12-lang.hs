data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
    deriving Show
--


--1
e0 = Num 1

--1 + 10 - 20
e1 =  Sub (Add (Num 1) (Num 10)) (Num 20)

--1 + (10 - 20)
e2 = Add (Num 1) (Sub (Num 10) (Num 20)) 

--(5 + 5) - (5 - 5)
e3 = Sub (Add (Num 5) (Num 5)) (Sub (Num 5) (Num 5))

-- Quando for criar a expressáo "escrita" colocar o = a resultado no final

main = print $ (e0, e1, e2, e3)
