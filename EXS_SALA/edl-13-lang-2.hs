type Mem = [(String,Int)]
    -- Associa um identificador a um valor inteiro
    -- O valor mais recente é adicionado no início

data Cmd = Atr String Exp   -- atribuicao, ex.: x=1
         | Seq Cmd Cmd      -- sequencia,  ex.: x=1 ; y=x
         deriving Show

data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
         | Var String
         deriving Show

consultaMem :: Mem -> String -> Int
consultaMem []                  id = 0
consultaMem ((id', val'):mem)   id = if id == id' then
                                        val'
                                    else
                                        consultaMem mem id

escreveMem :: Mem -> String -> Int -> Mem
escreveMem mem id val = (id,val):mem

imprimeExp :: Exp -> String
imprimeExp (Num x) = show x
imprimeExp (Add e0 e1) = imprimeExp e0 ++ " + " ++ imprimeExp e1
imprimeExp (Sub e0 e1) = imprimeExp e0 ++ " - " ++ imprimeExp e1
imprimeExp (Var var) = var


imprimeCmd ::  Cmd -> String
imprimeCmd (Atr x e0) = x ++ " = " ++ imprimeExp e0
imprimeCmd (Seq cmd0 cmd1) = imprimeCmd cmd0 ++ "; " ++ imprimeCmd cmd1 ++ ";" 

avaliaExp :: Mem -> Exp -> Int
avaliaExp mem (Num x) = x
avaliaExp mem (Add e0 e1) = avaliaExp mem e0 + avaliaExp mem e1
avaliaExp mem (Sub e0 e1) = avaliaExp mem e0 - avaliaExp mem e1
avaliaExp mem (Var var) = consultaMem mem var
                            

avaliaCmd :: Mem -> Cmd -> Mem
avaliaCmd mem (Atr id e0) = escreveMem mem id (avaliaExp mem e0)
avaliaCmd mem (Seq cmd0 cmd1) = avaliaCmd mem' cmd1
                                    where mem' = avaliaCmd mem cmd0


avaliaProg :: Cmd -> Int
avaliaProg (Atr id e0) = consultaMem id mem'
                                where mem' = avaliaExp [] e0
--avaliaProg (Seq cmd0 cmd1)  = avaliaCmd mem' cmd1 where mem' avaliaCmd cmd0


amb0 = []
amb1 = [("x", 1), ("y", 2)]                                    
amb2 = [("x", 10), ("y", 20)]

-- x = 1
c0 = Atr "x" (Num 1)

--x = 1 + x - 20
c1 = Atr "x" (Add (Num 1) (Sub (Var "x") (Num 20)) )

--x = 1 ; y = 2 ; z = x+y
c2 = Seq (Atr "x" (Num 1)) (Seq (Atr "y" (Num 2)) (Atr "z" (Add (Var "x") (Var "y"))))

--Resposta: x = 1 + 2 -- (valor final x=3)
c3 = Atr "x" (Add (Num 1) (Num 2))

c4 = Seq (Atr "x" (Num 10)) (Atr "x" (Num 1))

c5 = Seq (Atr "x" (Num 1)) (Seq (Atr "y" (Add (Var "x") (Num 1))) (Atr "x" (Var "y")))

--main = print $ (avaliaCmd amb0 c0, avaliaCmd amb0 c1, avaliaCmd amb0 c2, avaliaCmd amb0 c3, avaliaCmd amb0 c4, avaliaCmd amb0 c5,avaliaCmd amb1 c0, avaliaCmd amb1 c1, avaliaCmd amb1 c2, avaliaCmd amb1 c3, avaliaCmd amb1 c4, avaliaCmd amb1 c5,avaliaCmd amb2 c0, avaliaCmd amb2 c1, avaliaCmd amb2 c2, avaliaCmd amb2 c3, avaliaCmd amb2 c4, avaliaCmd amb2 c5 )
main = print $ (avaliaCmd amb0 c0, avaliaCmd amb1 c1, avaliaCmd amb2 c2, avaliaCmd amb0 c3, avaliaCmd amb1 c4, avaliaCmd amb2 c5)
