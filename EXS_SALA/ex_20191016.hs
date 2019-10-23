data Cmd = Atr String Exp
    | Seq Cmd Cmd
    | Cnd Exp Cmd Cmd
    | Rep Exp Cmd
    deriving Show

c1 = Seq [Atr "x" (Num 10), Atr "y" (Var "x")]

main = print c1