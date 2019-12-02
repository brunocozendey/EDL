type Mem = [(String,Int)]
type Cod = [(String,Cmd)]
type Env = (Mem,Cod)
data Exp = App String 

data Cmd = Fun String Cmd 
            | Num int

avaliaCmd :: Env -> Cmd -> Env
avaliaCmd (mem,cod) (Fun id c) = (mem, (id,c):cod)


--avaliaExp :: Env -> Exp -> Int
--avaliaExp (mem,cod) (App id e) = 

amb0 = []

cmd1 = Fun "x"
main = print $ (avaliaCmd amb0 cmd1  )