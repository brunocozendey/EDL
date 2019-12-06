x = 1 + 2
Atr "x" (Add (Num 1) (Num 2))

def soma(v):
    if v==0: return 0
    else: return v + soma(v-1)

print(soma(10))


seq f app where
    f = Fun "soma"
        (Ret (Soma (Var "arg")
                    App "soma")
                    (Sub (Var "arg") (Num 1))
        )

    app = Ret (App "soma" (Num 10))

{-
# Funçãoes - Dificuldade da aula de hoje

Como relacionar (App "soma" ...) com (Fun "soma" ..) ?
Difrente da atribuição que náo quer guardar a expressao sem avalia-la. A funcao voce náo quer executar a função assin que a declara. 
Neste caso, contrario com a atribuição você quer guardar o comando para ser executado quando ele for chamado. 

Não da para guardar os comandos junto com as memórias, é necessário um outro epaço para armazenar funçoes. 
Por isso o avaliaEXP e avaliaCMD precisa manipular um outro tipo de memoria. 


-}

type Mem = [ (String, Int) ]
type Cod = [ (String, Cmd) ]

escreve :: [(String, a)] -> String -> a -> [(String, a)] -- Nesse caso abstrai o valor seguinte podendo ser um Inteiro ou um CMD, dessa forma usa uma função só para o dois casos, pois náo tem que fazer nenhuma operacao com  o V
escreve l id v = (id,v):l

consulta :: [(String, a)] -> String -> a
consulta []             id = undefined -- Undefined em haskel é um valor especial, que é um erro de execução e tem em qualquer lugar. É um tipo bottom que é subtipo de qualquer tipo _|_ e existe o top que é super tipo de todos T
consulta ((id',v'):l)   id = if id == id' then
                                v'
                            else 
                                consulta l id
                                
                                
-- O ambiente é a junção da memória de variável com a memória de código. 

type Env = (Mem, Cod)

avaliaExp :: Env -> Exp -> Int
avaliaExp _         (Num v) = v
avaliaExp env       (Add e1 e2) = (avaliaExp env e1) + (avaliaExp env e2)
avaliaExp env       (Sub e1 e2) = (avaliaExp env e1) - (avaliaExp env e2)
avaliaExp (mem, _)  (Var id) = consulta mem id
avaliaExp (mem,cod) (App id e) = ret where
                                    ret = consulta mem'' "ret" -- aqui definimos um protocolo como será feito o armazenamento da memória ao chamar um função. 
                                    (mem'', _) avaliaCmd(mem', cod) fun -- aqui está ignorando os fatos de poder ser chamada de fora, ela só funciona em contexto local
                                    mem' = escreve mem "arg" arg
                                    arg = avaliaExp (mem, cod) e    
                                    fun = consulta cod id -- Isso executa o comando. 


-- Em linguagem dinamica faz sentido avaliar primeiro a expressao pois náo depende da funcao, diferente do contrario que a funcao depende da expressao. 


-- Esse codigo abaixo ainda está com o Bug que o segundo ret é exeutado ao invés de retornar o primeiro que seria o correto. 
avaliaCmd :: Env -> Cmd -> Env
avaliaCmd (mem, cod)    (Atr id exp)        = (escreve mem id v, cod) where 
                                                v = avaliaExp (mem, cod) exp
avaliaCmd env           (Seq (Ret e) c2)    = avaliaCmd env(Ret e)
avaliaCmd env           (Seq c1 c2)         = avaliaCmd env' c2 where
                                                env' = avaliaCmd env c1
avaliaCmd env           (Cnd exp c1 c2)     = if (avaliaExp env exp) = 0 then
                                                avaliaCmd env c1
                                            else 
                                                avaliaCmd env c2
avaliaCmd (mem, cod)    (Fun id c)          = (mem, escreve cod id c)
avaliaCmd (mem, cod)    (Ret e)             = (escreve mem "ret" v, cod) where
                                                v = avaliaExp (mem, cod) e