data Exp = Num Int
        | Add Exp Exp
        | Sub Exp Exp
        | Var String 
    deriving Show

data Cmd = Atr String Exp
            | Seq Cmd Cmd
            | Cnd Exp Cmd Cmd
            | Rep Exp Cmd
    deriving Show   

consulta :: String -> Int
consulta id = 1

avalia :: Exp -> Int
avalia (Num x) = x
avalia (Add e1 e2) = (avalia e1) + (avalia e2)
avalia (Sub e1 e2) = (avalia e1) - (avalia e2)
avalia (Var id) = consulta id

Seq ()
    --5 + i
e1 = Add (Num 5) (Var "i")

c1 = Atr("i" (Num 2))

main = print e1