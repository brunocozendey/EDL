import Debug.Trace  -- para fazer a função print. Funções para traçar e monitorar execuções. útil para investigar bugs ou problemas de 
                    --performance. Não recomendado usar em produção.    
                    -- O trace.show Mostra o argumento já convertido em string.Show a => a -> b -> b


type Cod = [(String, Cmd)]
type Mem = [(String, Int)]
type Amb =  (Mem, Cod) -- Define um ambiente pode ser, uma variável de string através de uma Mem ou então um comando, registrado através de um ID associado a um comando.
    -- Associa um identificador (string) a um valor inteiro
    -- O valor mais recente é adicionado no início da lista
    -- O type só coloca algo como se fosse um Label. Ao invés de ficar escrevendo a lista de Srtring,Int escreve-se Mem
    -- Várias memórias são gravadas como se fosse uma lista de par ordenado, (Id,Numero)

         

data Cmd = Atr String Exp   -- Atribuicao, ex.: x=1
        | Seq Cmd Cmd       -- Sequencia,  ex.: x=1 ; y=x
        | Dcl String        -- Declaracao, ex.: int x
        | Cnd Exp Cmd Cmd   -- Condição IF
        | Nop               -- No operation, comando que não executa nenhuma operação.
        | Prt Exp           -- Imprime na tela
        | Fun String String Cmd    -- Declara uma funçãov
        | Fun2 String (String,String) Cmd  -- 2 parametros
    deriving Show

data Exp = Num Int          -- Declara um tipo inteiro em uma Expressão Airtimética
         | Add Exp Exp      -- Adicionar duas epressões que podem ser 2 Num por exemplo.
         | Sub Exp Exp      -- Subtrai duas expressões, que podem ser 2 Num por exemplo.
         | Var String       -- Declara uma variável como uma String, um nome, ex 'i'
         | App String Exp   -- Executa a aplicação principal
         | App2 String (Exp,Exp)            -- 2 argumentos
    deriving Show

-----------------------------------------------------------------------------------------
-- Alocação Ambiente
-----------------------------------------------------------------------------------------
consulta :: [(String, a)] -> String -> a            -- Agora serve tanto para alimentar a pilha de memoria como de codigos de comando.
consulta []                     id = undefined         -- Variável ad própria linguagem que retorna um valor não definido.
consulta ((id', val'):list)     id = if id == id' then
                                        val'
                                    else
                                        consulta list id
         
escreve :: [(String, a)] -> String -> a -> [(String,a)]
escreve list id val = (id,val):list
          

-----------------------------------------------------------------------------------------
-- Comandos
-----------------------------------------------------------------------------------------
avaliaCmd :: Amb -> Cmd -> Amb -- Avalia o comando gravado na memória
avaliaCmd amb       (Prt exp)     = traceShow (avaliaExp amb exp) amb
avaliaCmd (mem,cod) (Atr id exp)  = (escreve mem id val,cod) where -- Se o comando for uma atribuição, ele escreve na memoria e no id o valor
                                        val = avaliaExp (mem,cod) exp -- como o valor será uma expressão ele verifica o valor desta. 
avaliaCmd amb (Seq Nop cmd1)      = avaliaCmd amb cmd1 
avaliaCmd amb (Seq cmd0 Nop)      = avaliaCmd amb cmd0
avaliaCmd amb (Seq cmd0 cmd1)     = avaliaCmd amb' cmd1 where -- Se o comando for uma sequencia ele vai avalia o primeiro comando de acordo com a memória já modificado, pois o segundo comando pode utilizar uma memória atualizada pelo primeiro comando.
                                        amb' = avaliaCmd amb cmd0 -- Avalia se a memória é afetada pelo comando
avaliaCmd amb (Nop)               = amb
avaliaCmd amb (Cnd exp cmd0 cmd1) = if (avaliaExp amb exp) /= 0 then
                                        avaliaCmd amb cmd0
                                    else
                                        avaliaCmd amb cmd1   
avaliaCmd (mem,cod) (Fun id x cmd)  = (mem', escreve cod id cmd') where
                                            cmd' = Seq (Atr x (Var "arg")) cmd 
                                            mem' = escreve mem "arg" 0

avaliaCmd (mem,cod) (Fun2 id (x,y) cmd)  = (mem'', escreve cod id cmd'') where
                                            cmd'' = Seq (Atr y (Var "arg2")) cmd' 
                                            cmd' = Seq (Atr x (Var "arg")) cmd
                                            mem'' = escreve mem' "arg2" 0
                                            mem' = escreve mem "arg" 0


eliminaDcl :: Cmd -> Cmd
eliminaDcl (Atr s e)        = Atr s e 
eliminaDcl (Seq cmd0 cmd1)  = Seq (eliminaDcl cmd0) (eliminaDcl cmd1)    
eliminaDcl (Dcl _)          = Nop    
-----------------------------------------------------------------------------------------
-- Expressões
-----------------------------------------------------------------------------------------

avaliaExp :: Amb -> Exp -> Int -- Função que avalia a expressão
avaliaExp _         (Num val)     = val -- Se a expresão for apenas o número retorna ele.
avaliaExp amb       (Add e0 e1) = (avaliaExp amb e0) + (avaliaExp amb e1) -- Se a expressão for uma adição retorna a adição aritimética das expressões
avaliaExp amb       (Sub e0 e1) = (avaliaExp amb e0) - (avaliaExp amb e1) -- Se a expressão for uma subtração retorna a subtração aritimética das expressões
avaliaExp (mem,_)   (Var id)    = consulta mem id -- Retorna o valor que estiver associado ao Id "chamado"
avaliaExp (mem,cod) (App id exp)  = ret where
                                    ret         = consulta mem'' "ret"
                                    (mem'', _)  = avaliaCmd (mem', cod) fun
                                    mem'        = escreve mem "arg" arg
                                    arg         = avaliaExp (mem, cod) exp
                                    fun         = consulta cod id

avaliaExp (mem,cod) (App2 id (exp0,exp1))  = ret where
                                    ret         = consulta memf "ret"
                                    (memf, _)  = avaliaCmd (mem'', cod) fun
                                    mem''       = escreve mem' "arg2" arg2
                                    mem'        = escreve mem "arg" arg1
                                    arg2         = avaliaExp (mem, cod) exp1
                                    arg1         = avaliaExp (mem, cod) exp0
                                    fun         = consulta cod id

                                    
-----------------------------------------------------------------------------------------
-- Execução
-----------------------------------------------------------------------------------------

{-
def soma (x,y):
    return x+y

print(soma(20,10)) /30
-}

p1 = Seq
        (Fun2 "soma" ("x","y")
            (Atr "ret"  
                (Add (Var "x") (Var "y"))
            )
        )
        (Prt (App2 "soma" ((Num 20),(Num 10)) ))
        

main = print $ (avaliaCmd ([],[]) p1)

{-
O comportamento se manteve o mesmo que o Python?
R: Sim os dois mantiveram o mesmo resultado. 20/20/10

Baseado na implementação de avaliaCmd e avaliaExp, explique porque o valor de y exibido dentro e fora de f são diferentes.
R: Como dentro da função, a execução é feita de forma recursiva, o valor não é armazenado na variável "y", ele é atribuído apenas ao variável
"ret" e desta forma o últim valor armazenado na mem de fato é o valor incial, logo o que está fora e depois da função, permanece com o valor
declarado inicialmente. 

Que mudanças teriam que ser feitas na implementação da linguagem para que o y atribuído dentro da função se mantivesse ao retornar?
R: Teria que de alguma forma declará-lo como Global, de tal forma que fosse escrito na pilha de memória. 

-}
