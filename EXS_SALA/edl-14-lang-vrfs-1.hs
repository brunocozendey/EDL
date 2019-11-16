data Cmd = Atr String Exp   -- atribuicao, ex.: x=1
         | Seq Cmd Cmd      -- sequencia,  ex.: x=1 ; y=x
         | Dcl String       -- declaracao, ex.: int x
         | Null

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
verificaCmd mems (Dcl x) = (x:mems, True)
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


verificaProg :: Cmd -> Bool
verificaProg cmd0 = x 
                    where (_, x) = verificaCmd [] cmd0

avaliaProg :: Cmd -> Maybe Int
avaliaProg cmd0 = if verificaProg cmd0 then
                    Just ret
                else 
                    Nothing
                where ret = 1 -- modificar, pois só faz sentido com memória, que não foi o caso desse ex.


eliminaDcl :: Cmd -> Cmd
eliminaDcl (Atr s e) = Atr s e 
eliminaDcl (Seq cmd0 cmd1) = Seq (eliminaDcl cmd0) (eliminaDcl cmd1)    
eliminaDcl (Dcl _) = Null     


-- Comando só é válido se antecedido por ATR e VAR : Atribuição e Declaração de variável
-- Comando válido, pois o x na memória ele já foi declarado
exp0 = Var "x"
cmd0 = Atr "x" (Num 1)
mem0 = ["x"]

-- Comando inválido
mem1 = []
exp1 = Var "x"
cmd1 = Atr "x" (Num 1)
    
-- Programa válido
exp01 = Add (Num 2) (Num 1)
cmd01 = Dcl "x"
cmd02 = Atr "x" exp01
cmd03 = Seq cmd01 cmd02
prog0 = cmd03

--main = print $ ( verificaExp mem1 exp1, verificaCmd mem1 cmd1)
main = print $ (avaliaProg prog0)
