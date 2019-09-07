# Linguagem Elixir

## Introdução

**Elixir** é uma linguagem de programação funcional, concorrente, de propósito geral que executa na máquina virtual Erlang (BEAM). Elixir compila em cima de Erlang para fornecer aplicações distribuídas, em tempo real suave, tolerante a falhas, non-stop, mas também a estende para suportar metaprogramação com macros e polimorfismo via protocolos.[3]


Elixir é usada por empresas como E-MetroTel, Pinterest e Moz. Também é usada para desenvolvimento web, por empresas como Bleacher Report, Discord e Inverse, e para a construção de sistemas embarcados. A comunidade organiza eventos anuais nos Estados Unidos, Europa e Japão, além de eventos e conferências locais menores.

José Valim é o criador da linguagem de programação Elixir, um projecto de R&D da Plataformatec. Seus objetivos foram permitir uma maior extensibilidade e produtividade no Erlang VM, mantendo a compatibilidade com ferramentas e ecossistema de Erlang.[4]
Em 12 de julho de 2018, a Honeypot lançou um mini-documentário sobre a linguagem Elixir.
Functional programming languages are one of the programming trends nowadays. We see several imperative languages influenced by functional programming, being this javascript, ruby, python and even php.

Functional programming languages are one of the programming trends nowadays. We see several imperative languages influenced by functional programming, being this javascript, ruby, python and even php.

From all the other programming languages the one that excited me more was Elixir. It was developed by José Valim, a Brazilian programmer that came from the Ruby community. The good thing about Elixir is that it haves a mature web framework called Phoenix, and after you get in the concepts you can start developing real world applications.
With the execution of a command, you install a full functional framework to develop a web application.


O que é Elixir?
Elixir é uma linguagem de programação funcional desenvolvida pelo brasileiro José Valim. Ela é muito parecida com Ruby e você não precisa ser um desenvolvedor Ruby pra achar que ela é uma linguagem extremamente fácil de ler.

Ela também é uma linguagem alternativa para a Máquina Virtual do Erlang (Erlang Virtual Machine — BEAM)

Ahh, e se você é um entusiasta Ruby on Rails, você deve saber que Elixir tem um framework web parecido, chamado Phoenix.

Se você está construindo aplicações que precisam ter alta disponibilidade (lembre-se dos nove-noves de disponibilidade), Elixir é uma excelente escolha.

Outro recurso legal é a capacidade de resposta. Sua aplicação pode responder a requisições independente de quantos clientes estão conectados.

Ela nunca quebra. Mesmo que você tenha uma código com erro em alguma linha, o restante da aplicação continua funcionando.

Código Elixir é fácil de crescer e manter, e isso significa baixo custo.

Em 1986, a Ericsson já tinha essa necessidade de criar aplicações sem falhas que fossem concorrentes, paralelas e distribuídas, e, naquela circustância não encontraram uma linguagem de programação que atendessem de forma produtiva essa necessidade, por isso, desenvolveram a linguagem de programação de Erlang.

Apesar de ser um projeto open source e resolver de forma efetiva alguns quadros críticos em ambientes distribuídos, a linguagem ainda está longe de alcançar popularidade por diversos motivos, tais como, sintaxe da linguagem, suporte a testes, ausência de tools, etc.

Mas o que o Erlang tem haver com Elixir? Tudo haver. A linguagem de programação Elixir executa na máquina virtual do Erlang que proverá condições para resolver problemas de concorrência e paralelismo e ao mesmo tempo tem um viés moderno com sintaxe mais amigável, suporte a testes, tools, etc.

It’s also an alternative language for the Erlang Virtual Machine (BEAM).

## Linha do tempo e influência do Elixir

- 1958 - Lisp
- 1986 - Erlang
- 1995 - Ruby
- 2011 - Elixir

![Time line linguagens](https://github.com/brunocozendey/EDL/blob/master/tarefa-02/IMGS/timeline.png)

## Quando escolher Elixir
Elixir é uma excelente escolha se você quer usar Erlang mas odeia a sintaxe dessa linguagem.

Outra boa razão é se você quer construir sistemas altamente distribuídos ou ainda sistemas que rodam em múltiplas CPUs/máquinas.

Parece haver uma tendência hoje de se construir sistemas de chats, e isso o Elixir faz bem por se tratar de uma aplicação de baixa latência.

Como falado anteriormente, sistemas altamente confiáveis são também onde o Elixir brilha. Se você precisa de uma aplicação disponível o tempo todo, Elixir é provavelmente sua melhor escolha.

## Quando NÃO escolher Elixir
Se você precisa construir aplicações que dependam de muito processamento de números, Elixir pode não ser sua melhor escolha. Nesse caso talvez seja melhor escolher uma linguagem como C ou C++, que são melhores para cálculos intensivos na CPU.

Elixir não tem um ecossistema diverso (pelo menos por enquanto). Por exemplo, a quantidade de repositórios para Elixir hoje é de 36.000, enquanto para Ruby é de 1.500.000, e Javascript 5.000.000.

Você pode pensar que Elixir é excelente para paralelismo, mas não é. Ela foi projetada para ter tolerância a falhas, não paralelismo.
 
## What is Erlang
Erlang is not just a language, Erlang is an open-source, general-purpose development platform.

It was built for the telecom industry by Ericsson, and it’s been doing a fantastic since 1986.

It has built-in support for concurrency (cheap context switching), distribution (executes on different machines), fault tolerance (it recovers from errors), and it prides itself with nine-nines of availability (~31ms downtime/year).

## Beam Schedule

Em Elixir, para lidar com multi thread temos as threads com identidade, são indetificadas com um ID ou PID, que nos permite gerenciar essa conexões e analisá-las.

Com isso, é possível que mesmo um processo parado, o sistema continue rodando, sem interrupções e além disso, o Elixir, permite acessar, um sistema, mas em em produção, para ser debuggado enquanto funciona, como pode ser visto nesse vídeo: 
https://www.youtube.com/watch?v=pO4_Wlq8JeI

No geral os processos estão trabalhando no mesmo sistema operacional, mas eles podem não ter nada em comum.  Tem seu próprio processo, seu memória, portanto quando dois processos precisam se comunicar, você tem um preço a pagar, mas isso é visível e calculável. Pois são processos externos que precisam se falar. Os processos tem sua própria memória, própria heap, e fontes (file handles, network interface, sockets, etc ..     )

## O que é Erlang?
Erlang não é só uma linguagem, Erlang é uma plataforma de desenvolvimento open-source, de propósito geral.

Ela foi criada pela Ericsson para a indústria de telecom e tem sido fantástica desde 1986.

Ela suporta concorrência de forma nativa, é distribuída (pode ser executada em diferentes máquinas ao mesmo tempo), possui tolerância a falha (se recupera de erros automaticamente)e orgulha-se de si mesmo com “nove-noves” de disponibilidade tendo apenas uma média de 31ms de downtime por ano.

## Elixir vs. Ruby
A primeira coisa que eu gostaria de mencionar como princípio geral é que você não deve fazer tudo em uma única linguagem. Você não deve escolher uma “melhor” linguagem. Cada linguagem tem os seus pros e contras.

Elixir não é uma versão melhorada do Ruby. Ela não é uma substituta do Ruby. Ela é uma nova linguagem com objetivos diferentes.

Comparada ao Ruby, Elixir oferece uma melhor performance, visto que é uma linguagem compilada, possui melhor escalabilidade e alta disponibilidade.

O código que você escreve em Elixir é muito explícito, ou seja, é menos mágico. Eu acho isso muito refrescante, vindo do mundo Ruby.

E o principal recurso, na minha opinião, é que ela usa todos do cores da CPU, ou seja, você pode rodar testes em paralelo (de verdade!).

Vamos ver alguns exemplos de código Ruby e Elixir.


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
   95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>, nil}
~~~


## Características da linguagem


Uma linguagem que compila para bytecode para a máquina virtual da Erlang (BEAM)[5]
Tudo é uma expressão [5]
Funções de Erlang podem ser chamadas de Elixir, sem impacto no tempo de execução, devido à compilação para o bytecode Erlang, e vice-versa
Metaprogramação permitindo a manipulação direta de árvores sintáticas abstratas[5]
Suporte para documentação via docstrings tipo Python na linguagem de formatação Markdown.ref name=<"elixirhome" />
Polimorfismo via um mecanismo chamado protocolos. Como em Clojure, os protocolos fornecem um mecanismo de ligação dinâmica. No entanto, isso não deve ser confundido com o despacho múltiplo uma vez que os protocolos em Elixir despacham em um único tipo.
Ênfase na recursão e funções de ordem superior em vez de looping baseado em efeitos colaterais.
Ferramen## O que é concorrência? internas para gerenciamento de dependências, compilação de código, execução de testes, ## O que é concorrência? atação de código, depuração remota e muito mais.
Coleções## O que é concorrência? guiçosas e assíncronas com streams
Casament## O que é concorrência?  padrões (Pattern matching)[5]
Suporte a Unicode e cadeias UTF-8


## Hello World com Elixir
Comando "Hello World".
~~~
iex(1)> IO.puts "Hello World!"
Hello World!
:ok
~~~

Abrindo um script elixir (.exs)
~~~
'elixir hello.exs 
Hello world from Elixir'
~~~

## Tipos básicos

Os tipos básicos no Elixir são:
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

## Funções Anônimas (Lambda)

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

## Processos em Elixir

Em Elixir, todo o código roda dentro de um processo, que são isolados uns dos outros, rodando de forma concorrente entre eles e se comunicando através de mensagens. 

Os processos não são só a base para a concorrência em Elixir, mas também fornecem a estrutura para construir programas que sejam distribuidos e tolerante a falha, que são os principais objetivos das linguagem. 

Os processos do Elxir não devem ser confundidos com os processos de um sistema operacional. No Elixir eles são extremamentes leves em termos de uso de memória e CPU (mesmo quando comparados com outras linguagens de programação). Por isso, não é incomum ter dezenas ou até mesmo centenas de milhares de processos rodando simultaneamente, dentro de uma VM Erlang, utilizada pelo Elixir. 

As principais ferramentas para lidar com processos são:

- spawn (criar)

O mecanismo básico de criação de um novo processo é a função spawn.

~~~
iex(28)> spawn fn -> 1 + 2 end
#PID<0.123.0>
~~~

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
A spawn/1 captura a função que será executada em um outro processo. 

A spawn retorna um PID (Process Identifier - Identificador de processo). Nesse ponto, o processo que foi criado, já deve estar morto. O processo criado executa a função dada e sair depois que ela estiver sido executada. 

~~~
iex(1)> pid = spawn fn -> 1 + 2 end
#PID<0.130.0>
iex(2)> Process.alive?(pid)
~~~

É possível retornar o PID do processo atual, chamando self/0.

~~~
iex(1)> self()
#PID<0.83.0>
iex(2)> Process.alive?(self())
true
~~~

Mas processos só são interessantes se puderem enviar e receber mensagem entre eles. 

- send (enviar) and receive (receber)

É possível enviar e receber mensagens para um processo com as funções *send/2* e *receive/1*, respectivamente. 

~~~
iex(11)> send self(), {:hello, "world"}
{:hello, "world"}
iex(2)> receive do
...(2)> {:hello,msg} -> msg
...(2)> {:world, msg} -> "won't match"
...(2)> end
"world"
~~~

Quando a mensagem é enviado para o processo, a mensagem é armazenada no processo *mailbox* . O bloco receive, vai até o processo mailbox atual procurando por uma mensagem que recebeu como argumento. O receive suporta sentinela e muitas outras funções como o *case/2*.

O processo que envia a mensagem não blioqueia o *send*, ele coloca a mensagem no receptor de algum mailbox e continua. Além disso, um processo pode enviar mensagem para ele mesmo. 

Se não houver uma mensagem no mailbox combinando com algum dos argumentos, o processo atual irá aguardar até que alguma mensagem bata ou então pode ser especificado um *timeout*. 

~~~
iex(1)> receive do
...(1)> {:hello, msg} -> msg
...(1)> after 
...(1)>  1_000 -> "nothing after 1s"
...(1)> end
"nothing after 1s"
~~~

Pode ser dado um timeout de 0, quando já se espera que tenha uma mensagem no mailbox.

Agora colocando tudo junto e enviando mensagens entre processos:

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

A função *inspect/1* é usada para converter representações de estrutura de dados internas em uma string, para que possa ser impressa na tela. Note que quando o *receive block* é executado o processo de envio que é criado já está morto, pois sua única instrução é enviar uma mensagem. 

Pode-se utilizar o *flush/0* para colocar na tela todas as mensagens do mailbox:

~~~
iex(1)> send self(), :hello
:hello
iex(2)> flush()
:hello
:ok
~~~


*Ligações* (Links)
A a maioria das vezes que criamos processos no Elixir, nós os criamos como processos ligados. (linked processes). Para isso usamos um *spawn_link/1* .

Mas antes é legal entender o que acontece com o processo que falha:

~~~
iex(1)> pid = spawn fn -> raise "error" end
#PID<0.121.0>
iex(2)> 
$time $metadata[$level] $levelpad$message
~~~

Quando executado o erro é mostrado na tela, mas o processo pai parece continuar rodando. Isto ocorre por causa dos processos serem de fato isolados. Se quisermos que em caso de falha de um processo, seja propagada para um outro, é preciso ligá-los. E isto pode ser feito com *spawn_link/1:*:
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

Como os processos estão ligados, ao executar o erro, aparece uma mensagem dizendo que o processo pai, que no caso era o shell do Elixir, recebeu um sinal de EXIT de outro processo, e desta forma encerrando o shell. E o IEx detecta essa situação e inicia uma nova seção. 

A ligação pode ser feita manualmente também ao chamar o processo, usando o *link/1*. É recomendado olhar o módulo do processo para outras funcionalidades fornecidas pelo processo. 

Processos e ligações, tem um importante papel quando se constrói sistemas tolerante a falhas. Como dito os processos do Elixir são isolados e não compartilham nada por padrão. Portanto uma falha em um processo nunca irá dar crash ou corromper o estado de um outro processo. Os links no entanto, permite que processos estabeleçam um relacionamento em caso de falha. Por tanto, normalmente ligam se processos a proecssos supervisores que podem detecta quando o processo morre e iniciar um novo processo no lugar. 

Enquanto outras linguages precisam que lide que faça *catch/handle* em exceções. No Elixir,não há problemas em deixar os processos falharem, pois é experado que os processos supervisórios, permitam reiniciar o sistema. O "falhar rápido" é uma filosofia comum ao desenvolver softwares em Elixir.

O *spawn/1* e *spawn_link/1* são comandos primitivos e básicos para criar processos no Elixir. Na maioria das vezes vamos usar abstrações que são construídas sobre elas, como por exemplo o chamado *tasks*.

Os *Tasks* ou tarefas, são construídas sobre as funções *spawn* para fornecer um relatório de erro melhorRuby e instrospecção. 
~~~
iex(1)> Task.start fn -> raise "erro" end
{:ok, #PID<0.131.0>}
iex(2)> 
$time $metadata[$level] $levelpad$message

~~~

Ao invés de *spawn/1* e *spawn_link/1*, usa-se o *Task.start/1* e o *Task.start_link/1*, que retorna {:ok, pid}, ao invés de apenas o PID. 
Isso é o que permite as taregas seren usada em árvores de supervisão. 
Além disso, *Task* fornece funções convenientes, como *Task.async/1* , o *Task.await/1* e funcionalidades que facilitam a distribuição. 

A funcionalidade *state* (estado), é a forma que se tem para construir aplicações que permitem gravar um estado, manter uma configuração, ou gravar um arquivo em memória. 

É possível criar processos que fiquem em loop infinitamente, mantendo um estado, enviando e recebendo mensagens. Por exemplo, é possível criar um módulo que inicia um novo processo que trabalha com o armazenamento de chaves e valores e armazena em um arquivo. 
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

Neste código, a função start_link, iniciar um novo processo que roda a função *loop/1*, a qual inicia com um mapa vazio. O *loop/1* (private) espera por mensagens e executa a ação correta de acordo com a mensagem. A função *loop/1* é privada, pois usou-se o *defp* ao invés de *def*. No caso de receber a mensagem *:get*, ele envia a mensagem de volta para que está chamando e a função *loop/1* é novamente chamada, esperando uma nova mensagem. Enquanto a mensagem *:put* chama a *loop/1* com uma nova versão do mapa, com os calores e chave armazenados. 

Agora rodando a função kv.

~~~
iex(1)> {:ok, pid} = KV.start_link
{:ok, #PID<0.153.0>}
iex(2)> send pid, {:get, :hello, self()}
{:get, :hello, #PID<0.129.0>}
iex(3)> flush()
nil
:okRuby
~~~

Primeiro o processo map não tem chaves e depois envia a mensagem *:get* e descarrega o inbox atual que é "nulo". Caso queira enviar novamente uma mensagem *:put*

~~~
iex(4)> send pid, {:put, :hello, :world}
{:put, :hello, :world}
iex(5)> send pid, {:get, :hello, self()}
{:get, :hello, #PID<0.129.0>}
iex(6)> flush()
:world
:ok
~~~

Neste exemplo, pode-se ver que o estado é mantido e pode-se pegar e atualizar esse estado enviando mensagens para o processo. De fato, qualquer processo que conheça o PID poderá enviar mensagens e manipular seu estado. 

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

Usando processos para manter o estado e o nome registrado, são padrões comuns nas apliacações em Elixir. No entando, na maiora das vezes, não iremos implementear esses padrões, manualmente, mas usar alguma abstração do Elixir. Por exemplo, como a abstração do *state*:

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

A opção *:name:* pode ser dada ao *Agent.start_link/2* e será automaticamente registrada. Atrás do agentes, o Elixir possui uma API para criar servidores genéricos (GenServer), tarefas e mais, tudo alimentado por processos ocultos. 

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

## Programação Concorrente e paralela

Hoje processadores novos não saem mais de fábrica com apenas um núcleo, temos dual-, quad- hexa-, octo- e 12-core.  E o uso desta alta capacidade de processamento paralelo é um dos principais desafios que a maioria das linguagens atuais tenta resolver. Pois muitas vezes não é possível, lidar com isso de maneira adequada ou então é muito difícil gerir programação paralela de forma a utilizar todos os cores disponíveis. O Elixr como opera sobre um máquina virtual naturalmente projetada para lidar com concorrência, permitindo assim extrair o máximo potencial do hardware onde o programa está sendo executado. A execução paralela é um pouco diferente de exedcução concorrente. O paralelismo significa que duas ou mais tarefas são livres para executar ao mesmo tempo. Também não há necessidade de interromper nenhuma delas par que outras possam prosseguir, salvo em casos em que isso é feito de forma intencional. Já a execução concorrete é quando duas ou mais tarefas também parecem ser executadas ao mesmo tempo, mas o processador poderia estar rapidamente trocando o foco entre elas, interrompendo uma para que outras possam continuar. Ele fazer essa troca de forma tão rápida que tudo parece estar sendo executado ao mesmo tempo, mas na verdade não está .O processador de um núclo é um bom exemplo, que age trocando as tarefas tão rapidamente que parece que são executadas ao mesmo tempo. Entretando na verdade, ele cria cache de uma, executa outra, interrompe uma e vai executando outras sucessivamente. Ao adicionar mais núcloes a este processador ele estará apto a executar processos em paralelo, mas asinda assim ele poderá continuar executando todas as tarefas concorrentemente se os núcleos extras não forem usadas. 

CONCORRÊNCIA E PARALELISMO
Pode parecer a mesma coisa, mas não é. Vamos as definições:

PARALELISMO
Acontece quando duas ou mais tarefas são executadas, literalmente, ao mesmo tempo. Necessita, obvRubyiamente, de um processador com múltiplas cores, ou múltiplos processadores para que mais de um processo ou thread seja executado ao mesmo tempo.

CONCORRÊNCIA
Quando duas ou mais tarefas podem começar a ser executadas e terminar em espaços de tempo que se sobrepõem, não significando que elas precisam estar em execução necessariamente no mesmo instante. Ou seja, você tem concorrência quando:

mais de uma tarefa progride ao mesmo tempo em um ambiente com múltiplos CPUs/núcleos;
ou no caso de um ambiente single core, duas ou mais tarefas podem não progredir no mesmo exato momento, mas mais de uma tarefa é processada em um mesmo intervalo de tempo, não esperando que uma tarefa termine por completo antes de dar início a outra.
É a possibilidade do processador executar instruções ao mesmo tempo que outras operações, como, por exemplo I/O, permitindo que tarefas sejam executadas concorrentemente pelo sistema. A concorrência é o princípio básico para permitir o projeto e implementação de sistemas multitarefas.


## Comparação com C#/C/Java/Ruby

## Conclusão

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