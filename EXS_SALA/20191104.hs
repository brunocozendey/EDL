data Exp = Num Int
         | Or Exp Exp
         | And Exp Exp
         | Not Exp
         | Add Exp Exp
         | Sub Exp Exp
    deriving Show

data Cmd = Atr String Exp
            |Seq Cmd Cmd
            |Dcl String

verificaCmd :: [String] -> Cmd -> ([String], Bool)
verificaCmd var (Dcl id) = (id:var, True)  
verificaCmd var (Seq cmd0 cmd1) = if res then
                                    verificaCmd var' cmd1 
                                else
                                    (var', False)
                                where (var',res) = verificaCmd var cmd0
                                 
verificaCmd (id':var) (Atr id v) = if id' == id then
                                        (var, True)
                                    else if var == [] then
                                        (var,False)
                                    else 
                                        verificaCmd var (Atr id v)        -- Rever esse comando, ele precisa executar e retornar uma lista e false, se nao encotnrar ningueém.


c1 = Atr "x" (Num 1)
c2 = Seq (Dcl "x") c1


main = print $ (verificaCmd  [] c1)