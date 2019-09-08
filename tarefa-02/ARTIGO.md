# Linguagem Elixir

## Introdução

**Elixir** é uma linguagem brasileira, desenvolvida por José Valim (que veio da comunidade Ruby), como resultado de um projeto de Pesquisa da empresa Plataformatec a quel ele é um dos fundadores.

O Elixir éuma linguagem de programação funcional, concorrente, de propósito geral, que tem como objetivo permitir uma maior extensibilidade e produtividade, que é executada dentro de máquina virtual Erlang (BEAM), mantendo a compatibilidade com ferramentas e ecossistema de Erlang.

A plataform de código aberto Erlang foi desenvolvida em 1986, pela Ericsson, pois naquela circustância não encontraram uma linguagem de programação que atendessem de forma produtiva suas necessidades que era de criar aplicações sem falhas, que fossem concorrentes, paralelas e distribuídas e de alta disponibilidade (~31ms de downtime/ano).

Além das capacidades forneceidas pelo o Erlang a Elixir suporta metaprogramação com macros e polimorfismo através de protocolos. E por isso vem ganhando cada vez mais espaço e é usada por empresas como E-MetroTel, Pinterest e Moz. Também é usada para desenvolvimento web, por empresas como Bleacher Report, Discord e Inverse, e para a construção de sistemas embarcados.

O Elixir possui uma boa documentação e um framework web bem maduro chamado Phoenix, que após o conhecimento de alguns conceitos já é possível desenvolver aplicações do mundo real. 


## Resumo das características da linguagem

- Compila para bytecode da máquina virtual Erlang (BEAM)
- Tudo é uma expressão
- Funções de Erlang podem ser chamadas de Elixir, sem impacto no tempo de execução, devido à compilação para o bytecode Erlang, e vice-versa.
- Metaprogramação permitindo a manipulação direta de árvores sintáticas abstratas.
- Suporte para documentação via docstrings tipo Python na linguagem de formatação 
- Polimorfismo via protocolos. Como em Clojure, os protocolos fornecem um mecanismo de ligação dinâmica. 
- Ênfase na recursão e funções de ordem superior.
- Suporte a Unicode e cadeias UTF-8
- Sua aplicação pode responder a requisições independente de quantos clientes estão conectados.
- Nunca quebra. Mesmo que você tenha uma código com erro em alguma linha, o restante da aplicação continua funcionando.
- Código fácil de crescer e manter, implicando em baixo custo.


## Linha do tempo e influência do Elixir

- 1958 - Lisp
- 1986 - Erlang
- 1995 - Ruby
- 2011 - Elixir

![Time line linguagens](https://github.com/brunocozendey/EDL/blob/master/tarefa-02/IMGS/timeline.png)

## Quando escolher Elixir

- Se você quer usar Erlang mas tem dificuldades com sintaxe dessa linguagem.

- Se você está construindo aplicações que precisam ter alta disponibilidade.

- Para construir sistemas altamente distribuídos ou ainda sistemas que rodam em múltiplas CPUs/máquinas.

- Para construir sistemas de chats, por se tratar de uma aplicação de baixa latência.

- Se você precisa de uma aplicação disponível o tempo todo, Elixir é provavelmente sua melhor escolha.

## Quando NÃO escolher Elixir

- Se você precisa construir aplicações que dependam de muito processamento de números. Melhor escolher uma linguagem como C ou C++, que são melhores para cálculos intensivos na CPU.

- Quando precisa de um ecossistema diverso de desenvolvedores. Por exemplo, a quantidade de repositórios para Elixir hoje é de 36.000, enquanto para Ruby é de 1.500.000, e Javascript 5.000.000.

## Códigos com Elixir

### Hello World com Elixir
Executando o comando "Hello World", através do interpretador IEx.

~~~
iex(1)> IO.puts "Hello World!"
Hello World!
:ok
~~~

Abrindo um script elixir (.exs)
~~~
elixir hello.exs 
Hello world from Elixir
~~~

### Tipos básicos no Elixir

- inteiros 
- reais (float)
- booleanos
- atomos
- cadeias (strings)
- listas
- tuplas

A maioria dos tipos básicos já são conhecidos, exceto o *átomo* , que são constantes no qual o valor é seu próprio nome.Algumas outras linguagens o chamam de símbolo. E são úteis para enumerar valores distintos, como por exemplo:

~~~
iex(1)> :apple
:apple
iex(2)> :apple == :apple
true
iex(3)> :apple == :orange
false
iex(4)> :apple == "apple"
false

~~~

Átomos são iguais se seus nomes forem iguais. 

Já as *cadeias* são delimitadas por aspas duplas, e são codificadas com UTF-8.

~~~
iex(1)> "Você pode usar acentuação"
"Você pode usar acentuação"
~~~

O Elixir permite usar interpolação:
~~~
iex(1)> "Hello #{:world}"          
"Hello world"

iex(2)> "Pode fazer um, #{2},#{3}"
"Pode fazer um, 2,3"
~~~

As cadeias são tratadas internamente pelo Elixir, como sequencias binárias de bytes.
~~~
iex(1)> is_binary("Olá!")
true
~~~

Podendo inclusive pegar informações de tamanho de bytes que ocupam.
~~~
iex(10)> byte_size("Olá!")
5
~~~

### Funções Anônimas (Lambda)

O Elixir permite funções anônimas, que permite guardar e passar código executável, como se fosse um inteiro ou cadeia. São delimitados por palavras chave como *fn* e *end*.

~~~
iex(1)> add = fn a, b -> a + b end
#Function<12.99386804/2 in :erl_eval.expr/5>
    
iex(2)> add.(1, 2)
3

iex(3)> is_function(add)
true
~~~

Na função anônima acima, ela recebe dois argumentos (a e b)e retorna como resultado a + b. Os argumentos estão sempre do lado esquerdo do símbolo *->* e o código a ser executado no lado direito. A função anônima é armazenada na variável *add*.

Os argumentos entre parentesis após a chamada da função anonima, indica que, queremos que a função seja executada. O ponto (.) entre as variáveis e os parenteses é necessário para chamar a função anônima, garantido que não haja ambiguidade entre a chamada da função anônima com um nome de variável ou função. O Elixir diferencia funções anônimas e funções nomeadas. 

### Listas

As listas são definidas por colchetes [], podendo ter qualquer valor dentro dela. 
~~~
iex(1)> [1,2,true,3]
[1, 2, true, 3]
iex(2)> length([1,2,true,3])
4
~~~

Duas listas podem ser concatenadas e substraídas usando os operadores *++* e *--*. 
~~~
iex(1)> [1,2,3]++[4,5,6]
[1, 2, 3, 4, 5, 6]
iex(2)> [1, true, 2, false, 3, true]--[true,false]
[1, 2, 3, true]
~~~

No Elixir as listas, nunca são modificadas. Adicionar elementos ou removê-los, retorna uma nova lista inteira. As estruturas no Elixir são imutáveis, pois tem a vantagem de deixar o código mais limpo, sendo possível passar os dados livremente, com a garantia de que nada irá mudá-lo na memória, apenas transformá-lo. 

~~~
iex(1)> [104,101,108,108,111]
'hello'
~~~

Quando o Elixer lida com uma lista de número imprimíveis números ASCII, irá imprimir a lista de caracteres, que é algo comum de ser tratado pela Máquina Virtual Erlang. Qualquer valor no IEx pode ser verificado com o comando i.

~~~
iex(1)> i 'hello'
Term
  'hello'
Data type
  List
Description
  This is a list of integers that is printed as a sequence of characters
  delimited by single quotes because all the integers in it represent valid
  ASCII characters. Conventionally, such lists of integers are referred to as
  "charlists" (more precisely, a charlist is a list of Unicode codepoints,
  and ASCII is a subset of Unicode).
Raw representation
  [104, 101, 108, 108, 111]
Reference modules
  List
~~~

### Comando Ajuda

Para se ter *ajuda* de qualquer comando, função ou variável, basta colocar o h antes.

Ex:
~~~
iex(1)> h round

def round(number)                                

Rounds a number to the nearest integer.

Allowed in guard tests. Inlined by the compiler.

Examples

┃ iex> round(5.6)
┃ 6
┃ iex> round(5.2)
┃ 5
┃ iex> round(-9.9)
┃ -10
~~~

## Programação Concorrente e paralela

Hoje processadores novos não saem mais de fábrica com apenas um núcleo, temos dual-, quad- hexa-, octo- e 12-core, e o uso desta alta capacidade de processamento paralelo é um dos principais desafios que a maioria das linguagens atuais tenta resolver. Pois muitas vezes não é possível, lidar com isso de maneira adequada ou então é muito difícil gerir programação paralela de forma a utilizar todos os cores disponíveis. Como já visto o Elixr como opera sobre um máquina virtual naturalmente projetada para lidar com concorrência, permitindo assim extrair o máximo potencial do hardware onde o programa está sendo executado, tendo vantagem se comparado a outras linguagens.

A concorrência e o paralelismo podem parecer parecer a mesma coisa, mas não são. Vamos as definições:

- PARALELISMO
Acontece quando duas ou mais tarefas são livres para serem executadas, literalmente, ao mesmo tempo. Necessita, obviamente, de um processador com múltiplas cores, ou múltiplos processadores para que mais de um processo ou thread seja executado ao mesmo tempo.
Mas não há necessidade de interromper nenhuma delas par que outras possam prosseguir, salvo em casos em que isso é feito de forma intencional.

- CONCORRÊNCIA
Quando duas ou mais tarefas podem começar a ser executadas e terminar em espaços de tempo que se sobrepõem, não significando que elas precisam estar em execução necessariamente no mesmo instante. 
Em um ambiente com múltiplos CPUs/núcleos, uma tarefa progride ao mesmo tempo que outra. Já no caso de um ambiente single core, duas ou mais tarefas não podem progredir no mesmo exato momento. Mas mais de uma tarefa é processada, sem ficar esperando que uma tarefa termine por completo antes de dar início a outra. 
É a possibilidade do processador executar instruções ao mesmo tempo que outras operações, como, por exemplo I/O, permitindo que tarefas sejam executadas concorrentemente pelo sistema. 
A concorrência é o princípio básico para permitir o projeto e implementação de sistemas multitarefas.

A concorrência está ligada a:
1 - Thread: que é a sequencia de instruções do computador, que pode ser executada independente e normalmente é gerenciada pelo sistema operacional. É importante entender que multi-threads, podem pertencer ao mesmo processo e compartilhar memórias. Elas não são executadas exatamente em paralelo, mas sim com interrupções sequenciais. 

2 - Processos: É algo maior, que tem seu próprio espaço de endereço de memória, que pode ser executado realmente de uma forma paralela, através de arquiteturas multiprocessadas e a comunicação entre elas eles são possíveis apenas usando mecanismos definidos pelo sistema operacional. 


## Processos em Elixir

Em Elixir, todo o código roda dentro de um processo, que são isolados uns dos outros, rodando de forma concorrente entre eles e se comunicando através de mensagens. 

Os processos, não são só a base para a concorrência em Elixir, mas também fornecem a estrutura para construir programas com os principais objetivos da linguagem: distribuidos e tolerante a falha.

Os processos do Elxir não devem ser confundidos com os processos de um sistema operacional. No Elixir eles são extremamentes leves em termos de uso de memória e CPU (mesmo quando comparados com outras linguagens de programação). Por isso, não é incomum ter dezenas ou até mesmo centenas de milhares de processos rodando simultaneamente, dentro de uma VM Erlang.

As principais funções para lidar com processos são:

- *spawn/1* (criar)

Que é o mecanismo básico de criação de um novo processo.
Exemplo:
~~~
iex(1)> spawn fn -> 1 + 2 end
#PID<0.123.0>
~~~
Descrição:
~~~
iex(1)> i spawn fn -> 1 + 2 end
Term
  #PID<0.128.0>
Data type
  PID
Alive
  false
Description
  Use Process.info/1 to get more info about this process
Reference modules
  Process, Node
~~~
A spawn/1 captura a função que será executada em um outro processo e retorna um PID (Process Identifier - Identificador de processo). O processo criado executa a função dada e sai depois que esta for executada. 

Exemplo:
~~~
iex(1)> pid = spawn fn -> 1 + 2 end
#PID<0.130.0>
iex(2)> Process.alive?(pid)
~~~

Exemplo do disparo de 100 processos sequenciais em Elixir:

~~~
iex(1)> for num <- 1..100, do: spawn fn -> IO.puts("#{num * 2}") end 
2
4
6
10
8
12
14
18
16
20
22
24
26
28
30
32
34
36
38
40
42
44
46
48
50
52
54
56
58
60
62
64
66
68
70
72
74
76
78
82
80
84
86
88
90
91
92
94
96
98
100
104
102
106
108
110
112
114
116
118
120
122
124
126
128
130
132
134
136
138
140
144
142
146
148
150
152
154
156
158
160
162
164
166
168
170
172
174
176
178
180
182
184
186
188
190
192
194
196
198
200
[#PID<0.1087.0>, #PID<0.1088.0>, #PID<0.1089.0>, #PID<0.1090.0>, #PID<0.1091.0>,
 #PID<0.1092.0>, #PID<0.1093.0>, #PID<0.1094.0>, #PID<0.1095.0>, #PID<0.1096.0>,
 #PID<0.1097.0>, #PID<0.1098.0>, #PID<0.1099.0>, #PID<0.1100.0>, #PID<0.1101.0>,
 #PID<0.1102.0>, #PID<0.1103.0>, #PID<0.1104.0>, #PID<0.1105.0>, #PID<0.1106.0>,
 #PID<0.1107.0>, #PID<0.1108.0>, #PID<0.1109.0>, #PID<0.1110.0>, #PID<0.1111.0>,
 #PID<0.1112.0>, #PID<0.1113.0>, #PID<0.1114.0>, #PID<0.1115.0>, #PID<0.1116.0>,
 #PID<0.1117.0>, #PID<0.1118.0>, #PID<0.1119.0>, #PID<0.1120.0>, #PID<0.1121.0>,
 #PID<0.1122.0>, #PID<0.1123.0>, #PID<0.1124.0>, #PID<0.1125.0>, #PID<0.1126.0>,
 #PID<0.1127.0>, #PID<0.1128.0>, #PID<0.1129.0>, #PID<0.1130.0>, #PID<0.1131.0>,
 #PID<0.1132.0>, #PID<0.1133.0>, #PID<0.1134.0>, #PID<0.1135.0>, #PID<0.1136.0>,
 ...]

~~~

- *self/0*

Retorna o PID do processo atual. Exemplo:
~~~
iex(1)> self()
#PID<0.83.0>
iex(2)> Process.alive?(self())
true
~~~

- *send/2* e *receive/1*

É possível enviar e receber mensagens para um processo com as funções *send/2* e *receive/1*, respectivamente. 
Exemplo:
~~~
iex(11)> send self(), {:hello, "world"}
{:hello, "world"}
iex(2)> receive do
...(2)> {:hello,msg} -> msg
...(2)> {:world, msg} -> "won't match"
...(2)> end
"world"
~~~

Quando a mensagem é enviada para o processo, ela é armazenada num processo denominado *mailbox*, mas não bloqueia o *send*, continua executando. O send permite também enviar mensagem para o próprio processo emissor.
Já a função *receive*, vai até o processo mailbox atual procurando por uma mensagem que recebeu como argumento. 

O *receive* suporta sentinela e muitas outras funções como o *case/2*.

Se não houver uma mensagem no mailbox combinando com algum dos argumentos, o processo atual irá aguardar até que alguma mensagem bata ou então pode ser especificado um *timeout*. 
Exemplo:
~~~
iex(1)> receive do
...(1)> {:hello, msg} -> msg
...(1)> after 
...(1)>  1_000 -> "nothing after 1s"
...(1)> end
"nothing after 1s"
~~~

Pode ser dado um timeout de 0, quando já se espera que tenha uma mensagem no mailbox.

Agora o exemplo da combinação deles, enviando mensagens entre processos:
~~~
iex(1)> parent = self()
#PID<0.83.0>
iex(2)> spawn fn -> send(parent, {:hello, self()}) end
#PID<0.108.0>
iex(13)> receive do
...(13)>  {hello, pid} -> "Got hello from #{inspect pid}"
...(13)> end
"Got hello from #PID<0.108.0>"
~~~

- *inspect/1* 
É usada para converter representações de estrutura de dados internas em uma string, para que possa ser impressa na tela. Note que quando o *receive block* é executado o processo de envio que é criado já está morto, pois sua única instrução é enviar uma mensagem. 

Por isso, para colocar na tela todas as mensagens do mailbox, pode-se utilizar o *flush/0*, como no exemplo:
~~~
iex(1)> send self(), :hello
:hello
iex(2)> flush()
:hello
:ok
~~~

- *spawn_link/1*
É usado para criamos processos no Elixir, nós os criamos como processos ligados (linked processes).  

Mas antes de executá-lo segue um exemplo do processo com falha:
~~~
iex(1)> pid = spawn fn -> raise "error" end
#PID<0.121.0>
iex(2)> 
$time $metadata[$level] $levelpad$message
~~~

No exemplo anterior, quando executado o erro é exibido na tela, mas o processo pai (shell) continua rodando. Isto ocorre por causa dos processos serem de fato isolados. 
Se quisermos que em caso de falha de um processo, seja propagada para um outro, é preciso ligá-los. E este é o objetivo do *spawn_link/1:*:
~~~
iex(1)> self()
#PID<0.83.0>
iex(2)> spawn_link fn -> raise "erro" end
** (EXIT from #PID<0.83.0>) an exception was raised:
    ** (RuntimeError) erro
        (stdlib) erl_eval.erl:668: :erl_eval.do_apply/6

$time $metadata[$level] $levelpad$message
 
Interactive Elixir (1.3.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> 
~~~

Como isso ao executar o erro, aparece uma mensagem dizendo que o processo pai, que no caso era o shell do Elixir, recebeu um sinal de EXIT e encerrou o shell. Porém outro processo do IEx detecta essa situação e inicia uma nova seção. 

- *link/1*
É a função que faz a ligação manualmente entre os processos.

Processos e ligações, tem um importante papel quando se constrói sistemas tolerante a falhas. Como dito os processos do Elixir são isolados e não compartilham nada por padrão. Portanto uma falha em um processo nunca irá dar crash ou corromper o estado de um outro processo. Os links no entanto, permitem que processos estabeleçam um relacionamento em caso de falha. Por isso, são usados entre processos e processos supervisores que podem detecta quando um processo morre e iniciar um novo no seu lugar. 

Com isso, enquanto outras linguages precisam que lide que faça *catch/handle* em exceções. No Elixir, não há problemas em deixar os processos falharem, pois é esperado que os processos supervisórios os reiniciem. O "falhar rápido" é uma filosofia comum ao desenvolver softwares em Elixir.

- *spawn/1* e *spawn_link/1*

São comandos primitivos e básicos para criar processos no Elixir. Na maioria das vezes vamos usar abstrações que são construídas sobre elas, como por exemplo o chamado *tasks*.

- *tasks*
Ou tarefas, são construídas sobre as funções *spawn* para fornecer um relatório de erro melhor. 
~~~
iex(1)> Task.start fn -> raise "erro" end
{:ok, #PID<0.131.0>}
iex(2)> 
$time $metadata[$level] $levelpad$message

~~~

Ao invés de *spawn/1* e *spawn_link/1*, usa-se o *Task.start/1* e o *Task.start_link/1*, que retornam {:ok, pid}, ao invés de apenas o PID. O que permite as tarefas serem usadas com árvores de supervisão. 

Além disso, *Task* fornece funções convenientes, como *Task.async/1* , o *Task.await/1* e funcionalidades que facilitam a concorrência.

A funcionalidade *state* (estado), é a forma que se tem para construir aplicações que permitem gravar um estado, para manter uma configuração, ou gravar um arquivo em memória. 
É possível criar processos que fiquem em loop infinitamente, mantendo um estado, enviando e recebendo mensagens. 
Por exemplo, é possível criar um módulo que inicia um novo processo que trabalha com o armazenamento de chaves e valores, em um arquivo. 
~~~
iex(3)> defmodule KV do
...(3)>   def start_link do
...(3)>     Task.start_link(fn -> loop(%{}) end)
...(3)>   end
...(3)> 
...(3)>   defp loop(map) do
...(3)>     receive do
...(3)>       {:get, key, caller} ->
...(3)>         send caller, Map.get(map, key)
...(3)>         loop(map)
...(3)>       {:put, key, value} ->
...(3)>         loop(Map.put(map, key, value))
...(3)>     end
...(3)>   end
...(3)> end
{:module, KV,
 <<70, 79, 82, 49, 0, 0, 6, 224, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 133,
   131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115,
   95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>, {:loop, 1}} 
~~~

Neste código, a função start_link, iniciar um novo processo que roda a função *loop/1*, a qual inicia com um mapa vazio. O *loop/1* (private) espera por mensagens e executa a ação correta de acordo com a mensagem. A função *loop/1* é privada, pois usou-se o *defp* ao invés de *def*. 
Caso de receba a mensagem *:get*, ele envia a mensagem de volta para quem está chamando e a função *loop/1* é novamente chamada, esperando uma nova mensagem. 
E a mensagem *:put* chama a *loop/1* com uma nova versão do mapa, com os valores e as chaves armazenadas. 

Rodando a função kv:
~~~
iex(1)> {:ok, pid} = KV.start_link
{:ok, #PID<0.153.0>}
iex(2)> send pid, {:get, :hello, self()}
{:get, :hello, #PID<0.129.0>}
iex(3)> flush()
nil
:okRuby
~~~

Primeiro o processo map não tem chaves e depois envia a mensagem *:get* e descarrega o inbox atual que é "nulo". 
~~~
iex(4)> send pid, {:put, :hello, :world}
{:put, :hello, :world}
iex(5)> send pid, {:get, :hello, self()}
{:get, :hello, #PID<0.129.0>}
iex(6)> flush()
:world
:ok
~~~

Agora é possível ver que o estado é mantido e pode-se pegar e atualizar esse estado enviando mensagens para o processo. De fato, qualquer processo que conheça o PID poderá enviar mensagens e manipular seu estado. 

Também é possível registrar o PID, dado a ele um nome, que permita a qualquer um que o conheça enviar mensagem. 
~~~ 
iex(7)> Process.register(pid, :kv)
true
iex(8)> send :kv, {:get, :hello, self()}
{:get, :hello, #PID<0.129.0>}
iex(9)> flush()
:world
:ok
~~~

Na maiora das vezes, não são implementados manualmente esses padrões, e são usadas algumas abstrações do Elixir. Por exemplo, como a abstração do *state*:

~~~
iex(1)> {:ok, pid} = Agent.start_link(fn ->%{} end)
{:ok, #PID<0.163.0>}
iex(2)> Agent.update(p
pid/1         pid/3         pop_in/1      pop_in/2      put_elem/3    
put_in/2      put_in/3      pwd/0         
iex(3)> Agent.update(pid, fn map -> Map.put(map, :hello, :world) end)
:ok
iex(4)> Agent.get(pid, fn map-> Map.get(map, :hello) end) 
:world
~~~

A opção *:name:* pode ser dada ao *Agent.start_link/2* e será automaticamente registrada em um "agente".


## Demonstração multithread do Elixir

O Elixir, utiliza de artifícios da máquina Erlang para lidar com multithread, onde as threads possuem uma identidade, são indetificadas com um ID ou PID. Isso permite gerenciar essa conexões e analisá-las uma a uma.

A total separação entre as threads, permite que mesmo um processo parado, o sistema continue rodando, sem interrupções e além disso, o Elixir, ainda permite acessaro sistema em tempo de execução, para ser debuggado. Há uma demonstração bem interessante nesse vídeo: 
https://www.youtube.com/watch?v=pO4_Wlq8JeI


## Elixir vs Ruby

Comparada ao Ruby, Elixir oferece uma melhor performance, visto que é uma linguagem compilada, possui melhor escalabilidade e alta disponibilidade, já que o processo nunca para, se não tiver relação com o que apresentou erro. 

O código que você escreve em Elixir é muito explícito, ou seja, é menos mágico, se comparado ao Ruby.

E o principal recurso do Elixir é que ela usa todos do cores da CPU, ou seja, você pode rodar testes realmente em paralelo, e em processos independentes, realmente concorrentes.

Alguns exemplos de código Ruby e Elixir.

Definindo um método em Ruby:
~~~
def hello  "result"end
~~~

Definindo um método em Elixir:
~~~
def hello do  "result"end
~~~

Um Hash em Ruby{a: 1}
~~~
%{a: 1}
~~~

Um array em Ruby
~~~
[1, 2, 3, 4]
~~~

Uma tupla em Elixir
~~~
{1, 2, 3, 4}
~~~

Chamando um método em um objeto em Ruby
~~~
"hello".reverse
~~~

Chamando uma função em Elixir
~~~
String.reverse("hello")
~~~

Uma lambda em Ruby
~~~
 -> x { x * x }
~~~

Uma função anônima em Elixir
~~~
 fn(x) -> x * x end
~~~

Usando uma função each em Ruby
~~~ 
 [1, 2].each { |i| puts i }
~~~

Usando uma função each em Elixir
~~~
iex(1)> Enum.each([1, 2], &(IO.puts &1))
1
2
:ok
~~~

Definindo um módulo em Ruby
~~~
module Example end
~~~

Definindo um módulo em Elixir
~~~ 
iex(1)> defmodule Example do end
{:module, Example,
 <<70, 79, 82, 49, 0, 0, 3, 252, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 94,
   131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115,
   95, 118, 49, 108,0, 0, 0, 4, 104, 2, ...>>, nil}
~~~

## Comparação concorrência entre Elixir x Ruby

Como visto o Elixir, nasceu sob uma plataforma preparada para programação concorrente que é a Erlang VM e foi inspirada na linguagem Ruby. Portanto une o melhor dos dois mundos que são as vantagens de concorrência do Erlang, com a expressividade da sintax do Ruby.

O modelo de concorrência do Elixir é toltamente diferente, é o chamado "share nothing", ou seja, nada compartilhado. Isto é, sem memória e nem fila de dados compartilhadas. 
 
Isso significa que cada processo opera indenpendentemente e pode interagir com outros processos que tenha o ID conhecido, enviando mensagens para eles, a comunicação entre processos é fácil. 

Abaixo é possível ver o fluxo dos processos em Elixir, onde tudo é independente e um provesso não influencia em outro. 

![](https://github.com/brunocozendey/EDL/blob/master/tarefa-02/IMGS/MultithreadElixir.png)

Exemplo de concorrência em Elixir:

~~~
defmodule NumberPrinter do
  def print_numbers(thread_number) do
    Enum.each 1..5, fn(j) ->
      IO.puts "Thread: #{thread_number}, number: #{j}"
      :timer.sleep(Enum.random(0..500))
    end
  end
end

Enum.each 1..5, fn(thread_number) ->
  spawn(NumberPrinter, :print_numbers, [thread_number])
end
~~~

Que retorna algo do tipo:
~~~
Thread: 4, number: 1
Thread: 3, number: 1
Thread: 1, number: 1
Thread: 2, number: 1
Thread: 5, number: 1
:ok
Thread: 5, number: 2
Thread: 4, number: 2
Thread: 3, number: 2
Thread: 2, number: 2
Thread: 1, number: 2
Thread: 4, number: 3
Thread: 5, number: 3
Thread: 3, number: 3
Thread: 5, number: 4
Thread: 1, number: 3
Thread: 5, number: 5
Thread: 2, number: 3
Thread: 4, number: 4
Thread: 1, number: 4
Thread: 1, number: 5
Thread: 3, number: 4
Thread: 4, number: 5
Thread: 2, number: 4
Thread: 3, number: 5
Thread: 2, number: 5
~~~

A concorrência no *Ruby*, no início, não era real, haviam apenas as chamadas "green threads", que eram executadas na mesma thread. A linguagem hoje, apesar de não ter threads nativas, o Ruby através do Global Interpreter Lock (GIL). O que é perfeito para soluções, quando se trabalha apenas com processadores de um core, pois mesmo tendo mais de um, GIL permanece sendo apenas um e não aproveita tanto das vantagens dos multi-processadores. 

A comunidade Ruby, tem trabalhado, em soluções menos segura, porém viabilizando modelos de concorrência e desenvolvendo o chamado Actor Model, em Ruby. 

A comunicação entre threads no Ruby, é feita através de uma solução interna, que é a "Queue Class". Onde a comunicação é compartilhada, através de todas as threads criadas, que podem pegar objetos da fila e também removê-los de lá. Portanto, não se pode enviar objetos diretamente entre uma thread e outra, é necessário usar a fila, filtrando manualmente ou tendo múltiplas filas em cada processo. 

A baixo segue o modelo de como funcionam as threads em Ruby:

![](https://github.com/brunocozendey/EDL/blob/master/tarefa-02/IMGS/MultithreadRuby.png)


Abaixo um exemplo de app em Ruby com threads:

~~~
def print_numbers(thread_number)
  (0..5).each do |j|
    p "Thread: #{thread_number}, number: #{j}"
    sleep(Random.rand)
  end
end
 
(0..5).each do |i|
  Thread.new { print_numbers(i) }
end
~~~

E o resultado do que será impresso. 
~~~
"Thread: 5, number: 1"
"Thread: 0, number: 1"
"Thread: 5, number: 2"
"Thread: 2, number: 1"
"Thread: 5, number: 3"
"Thread: 0, number: 2"
"Thread: 4, number: 1"
"Thread: 1, number: 1"
"Thread: 3, number: 1"
"Thread: 4, number: 2"
~~~


## Conclusão

O Elixir apesar de ser uma linguagem relativamente nova, vem ganhando muito espaço no mercado. Por operar sobre um máquina virtual naturalmente projetada para lidar com concorrência, permite extrair o máximo potencial do hardware onde o programa está sendo executado. Gerando com isso uma alta capacidade de processamento paralelo, sendo pouco susetível à falhas, consequentemente conseguindo enfrentar um dos grandes desafios que a maioria das linguagens atuais tenta resolver, que é lidar com o processamento paralelo de maneira adequada ou gerir a programação paralela de forma a utilizar todos os cores disponíveis.  

Com isso, tem tido uma aderência muito grande para uso em backends, principalmente em serviços Web, que precisam de uma alta disponibilidade, escalabilidade, e por possuir uma clareza e expressividade no código superior a outras linguanges como o próprio Erlang e o Ruby como vimos no exemplo acima, se tornando uma linguagem de baixo custo e fácil manutenção.


## Bibliografia
- https://pt.wikipedia.org/wiki/Elixir_(linguagem_de_programa%C3%A7%C3%A3o)
- https://elixir-lang.org/getting-started/processes.html
- https://medium.com/full-stack-tips/a-gentle-introduction-to-elixir-1da9261bae72
- https://videosdeti.com.br/por-que-voce-tambem-deve-aprender-elixir/
- https://elixirschool.com/pt/lessons/basics/basics/
- http://zonov.me/go-for-rubyists-part-8-concurrency-ruby-go-elixir/
- DAVI, Tiago. Elixir: Do zero à concorrência.São Paulo:Editora Caso do Código.2017.
- https://lucassimon.com.br/2018/06/um-caminho-para-aprender-elixir/
- http://www.tiagobarreto.com/comecando-com-elixir-e-phoenix/
- http://jlouisramblings.blogspot.com/2013/01/how-erlang-does-scheduling.html
- https://diogommartins.wordpress.com/2017/04/07/concorrencia-e-paralelismo-threads-multiplos-processos-e-asyncio-parte-1/
- https://en.wikipedia.org/wiki/Elixir_(programming_language)
- http://zonov.me/go-for-rubyists-part-8-concurrency-ruby-go-elixir/