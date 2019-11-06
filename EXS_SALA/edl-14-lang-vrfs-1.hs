data Cmd = Atr String Exp   -- atribuicao, ex.: x=1
         | Seq Cmd Cmd      -- sequencia,  ex.: x=1 ; y=x
         | Dcl String       -- declaracao, ex.: int x

data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
         | Var String


         
verificaExp :: [String] -> Exp -> Bool
verificaExp _ (Num _) = True
verificaExp mems (Add e0 e1) = if verificaExp mems e0 then
                                    verificaExp mems e1
                                else False

verificaExp mems (Sub e0 e1) = if verificaExp mems e0 then
                                    verificaExp mems e1
                                else False
verificaExp [] (Var _) = False

verificaExp (m:mems) (Var var) = if (var == m) then
                                    True
                                else 
                                    verificaExp mems (Var var)
 
                            
verificaCmd :: [String] -> Cmd -> ([String],Bool)
verificaCmd mems (Dcl _) = (mems, True)
verificaCmd mems (Seq cmd0 cmd1) = if cmd0stats then
                                        verificaCmd mems' cmd1
                                    else 
                                        (mems', False)
                                    where (mems', cmd0stats) = verificaCmd mems cmd0 
verificaCmd [] (Atr var _) = ([],False) 
verificaCmd (m:mems) (Atr var e0) = if (m == var) then
                                        if verificaExp mems e0 then
                                            (mems,True)
                                        else
                                            (mems,False)
                                    else 
                                        verificaCmd mems (Atr var e0)

cmd0 = Atr "x" (Num 1)
exp0 = Var "x"
mem0 = ["x"]

main = print $ ( verificaExp mem0 exp0, verificaCmd mem0 cmd0)
