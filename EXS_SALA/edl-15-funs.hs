type Mem = [(String, Int)]
    -- Associa um identificador (string) a um valor inteiro
    -- O valor mais recente é adicionado no início da lista
    -- O type só coloca algo como se fosse um Label. Ao invés de ficar escrevendo a lista de Srtring,Int escreve-se Mem
    -- Várias memórias são gravadas como se fosse uma lista de par ordenado, (Id,Numero)

data Cmd = Atr String Exp   -- atribuicao, ex.: x=1
        | Seq Cmd Cmd      -- sequencia,  ex.: x=1 ; y=x
        | Dcl String       -- declaracao, ex.: int x
        | Cnd Exp Cmd Cmd
        | Nop
        | Prt Exp
        | Fun String Cmd

data Exp = Num Int -- Declara um tipo inteiro em uma Expressão Airtimética
         | Add Exp Exp -- Adicionar duas epressões que podem ser 2 Num por exemplo.
         | Sub Exp Exp -- Subtrai duas expressões, que podem ser 2 Num por exemplo.
         | Var String -- Declara uma variável como uma String, um nome, ex 'i'
         | App String Exp
    deriving Show


consultaMem :: Mem -> String -> Int
consultaMem []                  id = 0
consultaMem ((id', val'):mem)   id = if id == id' then
                                        val'
                                    else
                                        consultaMem mem id
         
escreveMem :: Mem -> String -> Int -> Mem
escreveMem mem id val = (id,val):mem
          

imprimeCmd :: Cmd -> String -- Função que vai receber um comando e imprimí-lo na tela. 
imprimeCmd (Atr id exp)         = id ++ " = " ++ (imprimeExp exp) -- ++ "--(valor final x="++ show (avaliaExp e) ++")"
imprimeCmd (Seq cmd0 cmd1)      = (imprimeCmd cmd0) ++ "; " ++ (imprimeCmd cmd1) -- Comando sequencia, imprime o que está escrito no comando 1 em sequencia no comando 2
imprimeCmd (Nop) = "NOP"
imprimeCmd (Cnd exp cmd0 cmd1)  = if verificaExp [] exp then
                                    imprimeCmd cmd0
                                else 
                                    imprimeCmd cmd1

imprimeExp :: Exp -> String -- Imprime as expressões, entra uma expressão e sai uma string
imprimeExp (Num x)      = show x -- Imprime o número inteiro, o comando show faz a transformaçao de Int -> String
imprimeExp (Var id)     = id -- Imprime o Id da variável que já é um string
imprimeExp (Add e0 e1)  = (imprimeExp e0)++ " + " ++ (imprimeExp e1) -- Imprime a soma na forma aritmética
imprimeExp (Sub e0 e1)  = (imprimeExp e0)++ " - " ++ (imprimeExp e1) -- Imprime a subtração na forma aritmética


avaliaExp :: Mem -> Exp -> Int -- Função que avalia a expressão
avaliaExp mem       (Num x)     = x -- Se a expresão for apenas o número retorna ele.
avaliaExp mem       (Add e0 e1) = (avaliaExp mem e0) + (avaliaExp mem e1) -- Se a expressão for uma adição retorna a adição aritimética das expressões
avaliaExp mem       (Sub e0 e1) = (avaliaExp mem e0) - (avaliaExp mem e1) -- Se a expressão for uma subtração retorna a subtração aritimética das expressões
avaliaExp mem   (Var id)    = consultaMem mem id -- Retorna o valor que estiver associado ao Id "chamado"
avaliaExp (mem,cod) (App id e)  = ret where
                                    ret         = consultaMem mem'' "ret"
                                    (mem'', _)  = avaliaCmd (mem', cod) fun
                                    mem'        = escreve mem "arg" arg
                                    arg         = avaliaExp (mem, cod) e
                                    fun         = consultaMem cod id


avaliaCmd :: Mem -> Cmd -> Mem -- Avalia o comando gravado na memória
avaliaCmd mem (Atr id exp)      = escreveMem mem id val where -- Se o comando for uma atribuição, ele escreve na memoria e no id o valor
                                    val = avaliaExp mem exp -- como o valor será uma expressão ele verifica o valor desta. 
avaliaCmd mem (Seq Nop cmd1)    = avaliaCmd mem cmd1 
avaliaCmd mem (Seq cmd0 Nop)    = avaliaCmd mem cmd0
avaliaCmd mem (Seq cmd0 cmd1)   =    avaliaCmd mem' cmd1 where -- Se o comando for uma sequencia ele vai avalia o primeiro comando de acordo com a memória já modificado, pois o segundo comando pode utilizar uma memória atualizada pelo primeiro comando.
                                        mem' = avaliaCmd mem cmd0 -- Avalia se a memória é afetada pelo comando
avaliaCmd mem (Nop) = mem
--avaliaCmd (Cnd exp cmd0 cmd1) = 


verificaExp :: [String] -> Exp -> Bool
verificaExp _ (Num _)           = True
verificaExp mems (Add e0 e1)    = if verificaExp mems e0 then
                                    verificaExp mems e1
                                else False

verificaExp mems (Sub e0 e1)    = if verificaExp mems e0 then
                                    verificaExp mems e1
                                else False
verificaExp [] (Var _)          = False
verificaExp (m:mems) (Var var)  = if (var == m) then
                                    True
                                else 
                                    verificaExp mems (Var var)
 
                            
verificaCmd :: [String] -> Cmd -> ([String],Bool)
verificaCmd mems (Dcl x)            = (x:mems, True)
verificaCmd mems (Seq cmd0 cmd1)    = if cmd0stats then
                                        verificaCmd mems' cmd1
                                    else 
                                        (mems', False)
                                    where (mems', cmd0stats) = verificaCmd mems cmd0 
verificaCmd [] (Atr var _)          = ([],False) 
verificaCmd (m:mems) (Atr var e0)   = if (m == var) then
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
--avaliaProg (Atr id _)          = consultaMem [] id 
--avaliaProg (Seq cmd0 cmd1)  = (avaliaProg cmd0) && (avaliaProg cmd1)
avaliaProg cmd0 = if verificaProg cmd0 then
                    Just ret
                else 
                    Nothing
                where ret = 1


eliminaDcl :: Cmd -> Cmd
eliminaDcl (Atr s e)        = Atr s e 
eliminaDcl (Seq cmd0 cmd1)  = Seq (eliminaDcl cmd0) (eliminaDcl cmd1)    
eliminaDcl (Dcl _)          = Nop     


--------------------------------------------------------------------------
--------------------------------------------------------------------------

type Cod = [(String, Cmd)]
type Env = (Mem, Cod)


prt :: Exp -> String
prt x = imprimeExp x
-- Exemplos de comando
--Prt (Num 10)

-- x = 1
-- y = 2
-- print(x+y)


--e0 = Add(Atr 'x' (Num 1)) (Atr 'y' (Num 2))
--cmd0 = Seq (Dcl 'x') (Seq (Dcl 'y') Nop)



main = print $ (prt (Num 10))