-- Tratar o Bool como um inteiro, como no C.
data Exp = Num Int
         | Or Exp Exp
         | And Exp Exp
         | Not Exp
         | Add Exp Exp
         | Sub Exp Exp
    deriving Show

imprime :: Exp -> String
imprime (Num x) = show x
imprime (Add e0 e1) = (imprime e0)++ " + " ++ (imprime e1)
imprime (Sub e0 e1) = (imprime e0)++ " - " ++ (imprime e1)
imprime (And e0 e1) = (imprime e0)++ " and " ++ (imprime e1)
imprime (Or e0 e1) = (imprime e0)++ " or " ++ (imprime e1)
imprime (Not e0) = "not " ++ (imprime e0)

avalia :: Exp -> Int -- Verificar o uso do Typeclass nessa função pode ser interessante (Eq a) => a -> Int
avalia(Num x) = x
avalia(Add e0 e1) = (avalia e0) + (avalia e1)
avalia(Sub e0 e1) = (avalia e0) - (avalia e1)
avalia(And e0 e1) = if (avalia e0 == 0 || avalia e0 == 1) && (avalia e1 == 0 || avalia e1 == 1)  then
                        (avalia e0) * (avalia e1)                
                    else 
                        error "Operador *AND* só aceita 0 ou 1 como input" 

avalia(Or e0 e1) = if (avalia e0 == 0 || avalia e0 == 1) && (avalia e1 == 0 || avalia e1 == 1) then
                        if ((avalia e0) + (avalia e1)) > 1 then
                            0
                        else 
                            1

                    else 
                        error "Operador *OR* só aceita 0 ou 1 como input"

avalia(Not e0) = if (avalia e0 == 0 || avalia e0 == 1) && (avalia e1 == 0 || avalia e1 == 1) then
                    if (avalia e0 == 0) then
                        1
                    else 
                        0
                else 
                    error "Operador *NOT* só aceita 0 ou 1 como input"

{- Esse está funcionando mas não aceita parte lógica misturado com aritmética e o Not não funciona com outro Not.
avalia :: Exp -> Int
avalia(Num x) = x
avalia(Add e0 e1) = (avalia e0) + (avalia e1)
avalia(Sub e0 e1) = (avalia e0) - (avalia e1)
avalia(And e0 e1) = (avalia' e0) * (avalia' e1)
avalia(Or e0 e1) = (avalia' e0) + (avalia' e1)
avalia(Not e0) = if (avalia' e0 == 0 || avalia' e0 == 1) then
                    if (avalia' e0 == 0) then
                        1
                    else 
                        0
                else 
                    avalia' e0


avalia' :: Exp -> Int
avalia'(Num x) = if (x == 1) then
                        1
                else 
                    0
avalia'(And e0 e1) = (avalia' e0) * (avalia' e1) 
avalia'(Or e0 e1) = (avalia' e0) + (avalia' e1) 
avalia'(Not e0) = if (avalia' e0 == 0 || avalia' e0 == 1) then
                    if (avalia' e0 == 0) then
                        1
                    else 
                        0
                else 
                    avalia' e0
-}

e0 = And (Num 1) (Num 0)
e1 = Or (Num 1) (Num 0)
e2 = Not (Add(Num 1) (Num 0))
e3 = Not (Not (Num 1))
e4 = And (Or (Num 1) (Num 1))

-- Quando for criar a expressáo "escrita" colocar o = a resultado no final
main = print $ (imprime e0, imprime e1, imprime e2,imprime e3, avalia e0, avalia e1, avalia e2, avalia e3)