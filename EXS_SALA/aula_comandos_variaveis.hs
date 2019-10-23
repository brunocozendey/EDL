-- Aula 16/10/2019
data Exp = Num Int | Add Exp Exp | Sub Exp Exp | Var String
    deriving Show

consulta :: String -> Int
consulta id = -- retorna o valor de ID 

avalia :: Exp -> Int
avalia (Num v) = v
avalia ()

-- 5 + i 
e1 = Add (Num 5) (Var "i")

main = print e1