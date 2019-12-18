# EDL Resumo

## Pattern Matching ("Correspondência de Padrões")
É uma construção sintática. Consiste de especificar padrões, para o qual alguns dados devem corresponder e então checar para ver se correspndem e ir desconstruindo o dado de acordo com este padrão.

Ao definir funções é possível definir separadamente corpos de funções para diferentes padrões.
Quando se chama uma função, os padrões serã checados de cima para baixo e quando o input correpsonder a um dos padrões a função será usada. 
O Corpo de função sempre executará assim que o primeiro padrão corresponder.
Os padrões são importantes para recursãi, lembrando sempre de colocar o caso base.
Caso não encontre um padrão correspondente será gerada uma exceção Non-Excha...

## Listas
 fst ou snd retornam o primeiro e o segundo elemento de uma lista respectivamente.
 _ (underline) diz que aquela variável não importa.
 let xs = [(1,2), (4,3),(2,4)] [a+b | (a,b) <-xs], retornará [4,7,6]

 [] indica uma lista vazia
 x:xs associa ao head da lista xs o elemento x. Esse padrão é muito utilizado em funções recursivas. S
 Se quiser por exemplo restringir aos 3 primeiros elementos de uma lista as variáveis e o restante a outra variável, 
 pode fazer algo do tipo x:y:z:zs, isso fará com que só aceite a lista com pelo menos 3 elementos. 

 # O símbolo "=>"
 Indica um type class constraints, isto é, o que vai a direita deve satisfazer as condições do tipo a esquerda de "=>"
 É importante entender o sistema de tipos em Haskell. O tipo é um label que toda a expressão possui, que nos diz em qual categoria de coisas aquela expressão base está;
 O Símbolo :: pode ser lido como : "a variável a esquerda do símbolo :: tem o tipo de"
 Em uma função não há uma forma clara do que é atributo de entrada ou sáida, a forma mais fácil é que o último -> indica a saída. 

 ## INTEGER 
 É diferente de INT, pois aceita números muito grandes e também é mais eficiente. 
 Os tipos são escritos com letra maiúscula. Se definirmos um tipo, como qualquer letra, ele será um tipo variável, isto é, pode ser qualquer tipo. É parecido com 
 o "generics" em outras linguagens. Em Haskell isso é muito poderoso para escrever funções gerais que não possuem comportamento específico de um tipo.
 As funções deste tipo são chamados de polimórfica.

 ## TYPECLASS 101: O Type class é uma espécie de interface que define algum comportamento. Não seria uma classe de LOO, mas a interface de Java por exemplo.

 ## Tudo antes do símbolo "=>" é chamado de class constraint, que no Ex: (==) :: (Eq a) => a -> a -> Bool, pode ser lido como:
 "a função igualdade pega qualquer um dos dois valores que são do mesmo tipo e retorna um Booleano". O tipo desses dois valores devem ser um membro do Eq Class.
 O typleclass EQ provê uma interface para teste de igualdade. 

 ## Tipos básicos de TYPECLASS:
    - Eq: Tipos que suportam teste de comparação "==" ou "=/"
    - Ord: Tipos que tem ordenação, permite comparação >,<,>=,<=
    - Show: pode ser representado como STRING. A função "show", por exemplo, pega um valor cujo tipo pernce a classe "Show" e o apresenta na forma de STRING.
    - Read: é a espécie de classe oposta ao "Show", pega um STRING e retorna um tipo membro de Read. Ex read "5" :: int
    - Enum: tipos sequencilamente ordenáveis, que podem ser  enumeráveis. A principal vantagem é usar esses tipos em listas. Podem ser definidos sucessores e precessores, conseguidos com as funções
    succ e perd. Ex.: ["a".. "e"]
    - Bounded: possuem limite inferior e superior. Todas as tuplas são bounded por exemplo.
    - Num: é um typleclass numérico. Seus membros tem a propriedade de atuar como números. Todos os números são constantes polimórficas. 
    Eles podem atuar como qualquer tipo que seja do Typeclass Num.
    - Integral: é um tipo numérico.
    - Floatgin: inclui apenas números de ponto flutuante.


## Podemos implementar a função sum' da seguinte forma:
    sum' :: (Num a) =: [a] -> a
    sum'[] = 0
    sum'(x:xs) = x + sum' xs

## Patterns (Padrões)
É uma maneira prática de separar algo de acordo com um padrão e vinculá-los a nomes, mantendo uma referêcnia a tudo. Para fazer isso coloca-se um nome e um @ anteso do pattern. Por exemplo:
xs@(x:y:ys). Terá o mesmo resultado do que x:y:ys, mas é mais fácil de listar toda lista usando xs ao in´ves de repetir x:y:ys no corpo da função novamente. 
Ex: capital :: String -> String
    capital "" = "Empty"
    capital all@(x:xs) = "The first letter off" ++ all ++ "is" ++ [x]

Normalmente utiliza-se patter para não repetir quando está se comparando com um pattern grande, e temos que usar toda ela no corpo da função.

Os patterns são similar aos IFs. Verificam se as propriedades dos valores e são uteis quando há muitas condições. 

EX: 
DizIMC :: (Real Float a) => a -> String
DizIMC imc
    |imc <= 18.5 = "Está abaixo do peso !"
    |imc <= 25.0 = "Está no peso normal !"
    |imc <= 30.0 = "Está acima do peso !"
    | otherwise = "Está uma baleia, parbéns !"

## Guards
Os "guards" são indicados pelos "pipes" "|", que seguem o nome da função e seus parâmetros. O guard é basicamente uma expressão boleana, 
Se for Trye,a  função correspondente é usado, caso seja False segue para o próximo Guard. O Otherwise sever para encaixar caso nenhum dos cases anteriores tenham sido satisfeitos. 
Os Guards são como o "case" ou uma série de if's aninhados. 

DizIMC :: (Real Float a) => a -> a -> String
DizIMC peso altura
    |peso/altura^2 <= 18.5 = "Está abaixo do peso !"
    |peso/altura^2 <= 25.0 = "Está no peso normal !"
    |peso/altura^2 <= 30.0 = "Está acima do peso !"
    | otherwise = "Está uma baleia, parbéns !"

## WHERE
No que no exemplo anterior foi repetido três vezes a equação da fução peso/altura, o ideal é que ela fosse calculada apenas uma vez, para não ficar repetindo código. 
Logo poderíamos escrever o ex, da seguinte forma. 
Ex:

DizIMC :: (Real Float a) => a -> a -> String
DizIMC peos altura
    |imc <= 18.5 = "Está abaixo do peso !"
    |imc <= 25.0 = "Está no peso normal !"
    |imc <= 30.0 = "Está acima do peso !"
    | otherwise = "Está uma baleia, parbéns !" Where
                                                imc = peso/altura^2

Nós colocamos a keyword WHERE depois dos guards, e então definimos a nova função. Os nomes são visíveis através dos guards e nos dá a vantagem de não ficar repetindo.
E se resolvermos mudar a forma com que calculamos IMC, só fazemos isso uma única vez.

Os nome definidos no "Where" de uma função são apenas visíveis nela, logo não precisamos nos preocupar com nomes repetidos. Se não alinhar bem os nomes o haskell pode confundir entre os blocos.

As ligações do WHERE não são compartilhadas através dos corpos das funções de diferentes padrões. Se quiser vários Patterns de uma função acessar algum nome ele deverá ser definido globalmente. 

Pode se usar o "where" para ligar o patterns matches.
Ex: 
    where imc = peso/altura^2 
    (magro, normal, gordo) = (18.5, 25.0, 30.0)

Ex2: 
    initials :: String -> String -> String
    initials firstname lastname = [f]++". "++[l]++"."
            where   (f:_) = firstname
                    (l:_) = lastname

Além de constantes é possível definir funções no bloco do "WHERE"

Ex: 
    calcImc :: (Real FLoat a) => [(a,a)] -> [a]
    calcImc xs = [imc p a | (p,a) <- xs ]
        where imc peso altura = peso/altura^2

Neste caso a função imc não será calculada apenas uma vez, mas sim para cada par de peso e altura presente na lista. O "where" ainda pode ser aninhado.

## LET
É similar ao "WHERE", mas se diferencia por NÃO definir a variável ou função por todo o corpo da função, ser bem local, se restrigindo a um guard. O Let serve também como pattern Matching.

Ex: 
cilindro :: (RealFloat a) => a -> a -> a
cilindro rh = 
                let arealateral = 2*pi*r*h
                    areacima = pi*r^2
                in arealateral + 2*topArea

A forma é: let <binglings> in <expressao>

Outra diferença entre let e o where, é que o let é uma expressão por si só e o where uma construção sintática, logo o let pode ser chamado praticamente em qualquer lugar. 

Ex: 4*(let a = 9 in a+1) + 2
    :42
Ex2: [let square x = x*x in (square 5, square 3, square 2)]
    :[(25,9,4)]

O let também é útil para separar tuplas em componentes e vinculálas a nomes e coisas do gênero. 
Ex: (let(a,b,c) = (1,2,3) in a+b+c)*100

É possível omitir a parte do in no let, quando usa-se uma lista de compreensão, pois a visibilidade dos nomes já está pré-definida. 
No entanto podemos usar o let in vinculado a um predicado e o nome definido será visível apenas ao predicado.

Ex: let zoot xyz = x*y*zoot
zoot 3 9 2 

## CASE

Em haskell esse conceito é aprimorado, são expressões que podem avaliar possíveis casos de valor da variável e também fazer correspondência de padrões.
Pega uma variável, faz a correspondência de padrão e executa o código de acordo com esses valores. 
Ex: describeList :: [a] -> String   
    describeList xs = "Essa lista eh " ++ case xs of 
                                                [] -> "Vazia"   
                                                [x] -> "Unitaria"
                                                xs -> "Longa"

O case é útil para correspondencia de padrão em algo no meio da expressão.

A função lambda é uma função abstrata, onde em uma única linha é possível criar uma função.
Ex:
    dobralista ls = map (\x -> 2*x) ls

O operador "\\" elimina elementos iguais em duas listas.

`elem` retorna true se tiver um elemento em uma lista.

N-uplas, possuem tamanho fixo e podem conter diversos tipos de valores.

## Listas: 
Pode ser incrementada, mas só pode ser de um único valor.
Para inserir em uma lista basta colocar "valor:lista". 
Para recuperar dados de uma lista: fst, snd, head, tail.
O head pega o primeiro elemento e o tail todos exceto o primeiro, mas se for uma lista vazia retorna erro. 

O operador !! retorna o valor de uma posição n de uma lista.
Ex:
a = [9,8,7,6]
a !! 0
    :9
