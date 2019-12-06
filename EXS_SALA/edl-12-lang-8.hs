type Mem = [(String, Int)]
    -- Associa um identificador (string) a um valor inteiro
    -- O valor mais recente é adicionado no início da lista
    -- O type só coloca algo como se fosse um Label. Ao invés de ficar escrevendo a lista de Srtring,Int escreve-se Mem
    -- Várias memórias são gravadas como se fosse uma lista de par ordenado, (Id,Numero)

data Cmd = Atr String Exp   -- atribuicao:= Atribui a um id um inteiro - ex.: x=1
         | Seq Cmd Cmd      -- sequencia:= Coloca uma sequencia de comandos, como duas atribuições por  ex.: x=1 ; y=x
         deriving Show -- O show é utilizado para que se possa imprimir na tela diretamente. 

data Exp = Num Int -- Declara um tipo inteiro em uma Expressão Airtimética
         | Add Exp Exp -- Adicionar duas epressões que podem ser 2 Num por exemplo.
         | Sub Exp Exp -- Subtrai duas expressões, que podem ser 2 Num por exemplo.
         | Var String -- Declara uma variável como uma String, um nome, ex 'i'
         deriving Show


imprimeCmd :: Cmd -> String -- Função que vai receber um comando e imprimí-lo na tela. 
imprimeCmd (Atr v e) = v ++ " = " ++ (imprimeExp e) -- ++ "--(valor final x="++ show (avaliaExp e) ++")"
imprimeCmd (Seq c1 c2) = (imprimeCmd c1) ++ "; " ++ (imprimeCmd c2) -- Comando sequencia, imprime o que está escrito no comando 1 em sequencia no comando 2

imprimeExp :: Exp -> String -- Imprime as expressões, entra uma expressão e sai uma string
imprimeExp (Num x) = show x -- Imprime o número inteiro, o comando show faz a transformaçao de Int -> String
imprimeExp (Var id) = id -- Imprime o Id da variável que já é um string
imprimeExp (Add e0 e1) = (imprimeExp e0)++ " + " ++ (imprimeExp e1) -- Imprime a soma na forma aritmética
imprimeExp (Sub e0 e1) = (imprimeExp e0)++ " - " ++ (imprimeExp e1) -- Imprime a subtração na forma aritmética

ler :: Mem -> String -> Int -- Recebe uma memória que é uma lista e retorna um inteiro, "Armazenado na memória"
ler [] id = 0 -- Caso a memória esteja vazia, exibe 0
ler ((id',v'):l) id = if id == id' then -- O : chama o início da lista, e compara com o Id procurado, se for igual retorna
                        v'
                    else ler l id -- caso o ide não tenha sido encontrado, ele vai chamar de forma recursiva todos os elementos da lista "Memória"

escreve :: Mem -> String -> Int -> Mem -- Função para escrever uma memória na lista de memórias, entra com uma memória, insere um Id e o número e retorna com a lista de memória
escreve mem id v = (id,v):mem -- Insere o par de valores (id,v) no início da lista


avaliaExp :: Mem -> Exp -> Int -- Função que avalia a expressão
avaliaExp mem (Num x) = x -- Se a expresão for apenas o número retorna ele.
avaliaExp mem (Add e0 e1) = (avaliaExp mem e0) + (avaliaExp mem e1) -- Se a expressão for uma adição retorna a adição aritimética das expressões
avaliaExp mem (Sub e0 e1) = (avaliaExp mem e0) - (avaliaExp mem e1) -- Se a expressão for uma subtração retorna a subtração aritimética das expressões
avaliaExp mem (Var id) = ler mem id -- Retorna o valor que estiver associado ao Id "chamado"

avaliaCmd :: Mem -> Cmd -> Mem -- Avalia o comando gravado na memória
avaliaCmd mem (Atr id exp) = escreve mem id v where -- Se o comando for uma atribuição, ele escreve na memoria e no id o valor
                                v = avaliaExp mem exp -- como o valor será uma expressão ele verifica o valor desta. 
avaliaCmd mem (Seq c1 c2) = avaliaCmd mem' c2 where -- Se o comando for uma sequencia ele vai avalia o primeiro comando de acordo com a memória já modificado, pois o segundo comando pode utilizar uma memória atualizada pelo primeiro comando.
                                mem' = avaliaCmd mem c1 -- Avalia se a memória é afetada pelo comando

avaliaProg :: Cmd -> Int -- recebe um comando e retorna o valor final da variável "ret". Assumindo por padrão que a variável de entrada sem valor retorna 0
avaliaProg (Atr id exp) = ler mem01 id
avaliaProg (Seq c1 c2) = avaliaProg c1 
                        | avaliaProg c2 

e00 = Add (Num 1) (Var "y")
e01 = Add (Sub (Var "y") (Var "x")) (Num 50)
e03 = Sub e01 e00

c00 = Atr "x" e00
c01 = Seq (Atr "x" (Num 10)) (Atr "x" (Num 1))
c02 = Seq (Atr "x" (Num 1)) (Seq (Atr "y" (Add (Var "x") (Num 1))) (Atr "x" (Var "y")))


mem00 = []
mem01 = [("x",1),("y",20)]
mem02 = [("x",1),("y",2)]

--main = print $ (avaliaExp mem00 e00,avaliaExp mem01 e00,avaliaExp mem01 e01,avaliaExp mem02 e01, avaliaExp mem02 e03)
--main = print $ (avaliaCmd mem01 c00, avaliaCmd mem02 c00,avaliaCmd mem01 c01, avaliaCmd mem02 c01,avaliaCmd mem01 c02, avaliaCmd mem02 c02,avaliaExp mem00 e00,avaliaExp mem01 e00,avaliaExp mem01 e01,avaliaExp mem02 e01, avaliaExp mem02 e03)
main = print $ (avaliaProg c01)