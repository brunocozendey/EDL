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

## Quando escolher Elixir
Elixir é uma excelente escolha se você quer usar Erlang mas odeia a sintaxe dessa linguagem.

Outra boa razão é se você quer construir sistemas altamente distribuídos ou ainda sistemas que rodam em múltiplas CPUs/máquinas.

Parece haver uma tendência hoje de se construir sistemas de chats, e isso o Elixir faz bem por se tratar de uma aplicação de baixa latência.

Como falado anteriormente, sistemas altamente confiáveis são também onde o Elixir brilha. Se você precisa de uma aplicação disponível o tempo todo, Elixir é provavelmente sua melhor escolha.

##Quando NÃO escolher Elixir
Se você precisa construir aplicações que dependam de muito processamento de números, Elixir pode não ser sua melhor escolha. Nesse caso talvez seja melhor escolher uma linguagem como C ou C++, que são melhores para cálculos intensivos na CPU.

Elixir não tem um ecossistema diverso (pelo menos por enquanto). Por exemplo, a quantidade de repositórios para Elixir hoje é de 36.000, enquanto para Ruby é de 1.500.000, e Javascript 5.000.000.

Você pode pensar que Elixir é excelente para paralelismo, mas não é. Ela foi projetada para ter tolerância a falhas, não paralelismo.

## Como o Erlang lida com Schedule

 http://jlouisramblings.blogspot.com/2013/01/how-erlang-does-scheduling.html


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

Um Hash em Ruby{a: 1}

%{a: 1}

Um array em Ruby
[1, 2, 3, 4]

Uma tupla em Elixir{1, 2, 3, 4}

Chamando um método em um objeto em Ruby

"hello".reverse

Chamando uma função em Elixir

String.reverse("hello")

Uma lambda em Ruby
 -> x { x * x }
 
 Uma função anônima em Elixir
 fn(x) -> x * x end
 
 Usando uma função each em Ruby
 
 [1, 2].each { |i| puts i }
 
 Usando uma função each em ElixirEnum.each([1, 2], &(IO.puts &1))
 
 Definindo um módulo em Ruby
 
 module Exampleend
 
 Definindo um módulo em Elixir
 
 defmodule Exampleend


## Características da linguagem


Uma linguagem que compila para bytecode para a máquina virtual da Erlang (BEAM)[5]
Tudo é uma expressão [5]
Funções de Erlang podem ser chamadas de Elixir, sem impacto no tempo de execução, devido à compilação para o bytecode Erlang, e vice-versa
Metaprogramação permitindo a manipulação direta de árvores sintáticas abstratas[5]
Suporte para documentação via docstrings tipo Python na linguagem de formatação Markdown.ref name=<"elixirhome" />
Polimorfismo via um mecanismo chamado protocolos. Como em Clojure, os protocolos fornecem um mecanismo de ligação dinâmica. No entanto, isso não deve ser confundido com o despacho múltiplo uma vez que os protocolos em Elixir despacham em um único tipo.
Ênfase na recursão e funções de ordem superior em vez de looping baseado em efeitos colaterais.
Ferramentas internas para gerenciamento de dependências, compilação de código, execução de testes, formatação de código, depuração remota e muito mais.
Coleções preguiçosas e assíncronas com streams
Casamento de padrões (Pattern matching)[5]
Suporte a Unicode e cadeias UTF-8

## O que é concorrência? 

## Hello World
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

## Ajuda

Para se ter ajuda de qualquer comando, função ou variável, basta colocar o h antes.

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




iex> parent = self()
#PID<0.41.0>
iex> spawn fn -> send(parent, {:hello, self()}) end
#PID<0.48.0>
iex> receive do
...>   {:hello, pid} -> "Got hello from #{inspect pid}"
...> end
"Got hello from #PID<0.48.0>"
The inspect/1 function is used to convert a data structure’s internal representation into a string, typically for printing. Notice that when the receive block gets executed the sender process we have spawned may already be dead, as its only instruction was to send a message.

While in the shell, you may find the helper flush/0 quite useful. It flushes and prints all the messages in the mailbox.

iex> send self(), :hello
:hello
iex> flush()
:hello
:ok
Links
The majority of times we spawn processes in Elixir, we spawn them as linked processes. Before we show an example with spawn_link/1, let’s see what happens when a process started with spawn/1 fails:

iex> spawn fn -> raise "oops" end
#PID<0.58.0>

[error] Process #PID<0.58.00> raised an exception
** (RuntimeError) oops
    (stdlib) erl_eval.erl:668: :erl_eval.do_apply/6
It merely logged an error but the parent process is still running. That’s because processes are isolated. If we want the failure in one process to propagate to another one, we should link them. This can be done with spawn_link/1:

iex> self()
#PID<0.41.0>
iex> spawn_link fn -> raise "oops" end

** (EXIT from #PID<0.41.0>) evaluator process exited with reason: an exception was raised:
    ** (RuntimeError) oops
        (stdlib) erl_eval.erl:668: :erl_eval.do_apply/6

[error] Process #PID<0.289.0> raised an exception
** (RuntimeError) oops
    (stdlib) erl_eval.erl:668: :erl_eval.do_apply/6
Because processes are linked, we now see a message saying the parent process, which is the shell process, has received an EXIT signal from another process causing the shell to terminate. IEx detects this situation and starts a new shell session.

Linking can also be done manually by calling Process.link/1. We recommend that you take a look at the Process module for other functionality provided by processes.

Processes and links play an important role when building fault-tolerant systems. Elixir processes are isolated and don’t share anything by default. Therefore, a failure in a process will never crash or corrupt the state of another process. Links, however, allow processes to establish a relationship in case of failure. We often link our processes to supervisors which will detect when a process dies and start a new process in its place.

While other languages would require us to catch/handle exceptions, in Elixir we are actually fine with letting processes fail because we expect supervisors to properly restart our systems. “Failing fast” is a common philosophy when writing Elixir software!

spawn/1 and spawn_link/1 are the basic primitives for creating processes in Elixir. Although we have used them exclusively so far, most of the time we are going to use abstractions that build on top of them. Let’s see the most common one, called tasks.

Tasks
Tasks build on top of the spawn functions to provide better error reports and introspection:

iex(1)> Task.start fn -> raise "oops" end
{:ok, #PID<0.55.0>}

15:22:33.046 [error] Task #PID<0.55.0> started from #PID<0.53.0> terminating
** (RuntimeError) oops
    (stdlib) erl_eval.erl:668: :erl_eval.do_apply/6
    (elixir) lib/task/supervised.ex:85: Task.Supervised.do_apply/2
    (stdlib) proc_lib.erl:247: :proc_lib.init_p_do_apply/3
Function: #Function<20.99386804/0 in :erl_eval.expr/5>
    Args: []
Instead of spawn/1 and spawn_link/1, we use Task.start/1 and Task.start_link/1 which return {:ok, pid} rather than just the PID. This is what enables tasks to be used in supervision trees. Furthermore, Task provides convenience functions, like Task.async/1 and Task.await/1, and functionality to ease distribution.

We will explore those functionalities in the Mix and OTP guide, for now it is enough to remember to use Task to get better error reports.

State
We haven’t talked about state so far in this guide. If you are building an application that requires state, for example, to keep your application configuration, or you need to parse a file and keep it in memory, where would you store it?

Processes are the most common answer to this question. We can write processes that loop infinitely, maintain state, and send and receive messages. As an example, let’s write a module that starts new processes that work as a key-value store in a file named kv.exs:

defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end
Note that the start_link function starts a new process that runs the loop/1 function, starting with an empty map. The loop/1 (private) function then waits for messages and performs the appropriate action for each message. We made loop/1 private by using defp instead of def. In the case of a :get message, it sends a message back to the caller and calls loop/1 again, to wait for a new message. While the :put message actually invokes loop/1 with a new version of the map, with the given key and value stored.

Let’s give it a try by running iex kv.exs:

iex> {:ok, pid} = KV.start_link
{:ok, #PID<0.62.0>}
iex> send pid, {:get, :hello, self()}
{:get, :hello, #PID<0.41.0>}
iex> flush()
nil
:ok
At first, the process map has no keys, so sending a :get message and then flushing the current process inbox returns nil. Let’s send a :put message and try it again:

iex> send pid, {:put, :hello, :world}
{:put, :hello, :world}
iex> send pid, {:get, :hello, self()}
{:get, :hello, #PID<0.41.0>}
iex> flush()
:world
:ok
Notice how the process is keeping a state and we can get and update this state by sending the process messages. In fact, any process that knows the pid above will be able to send it messages and manipulate the state.

It is also possible to register the pid, giving it a name, and allowing everyone that knows the name to send it messages:

iex> Process.register(pid, :kv)
true
iex> send :kv, {:get, :hello, self()}
{:get, :hello, #PID<0.41.0>}
iex> flush()
:world
:ok
Using processes to maintain state and name registration are very common patterns in Elixir applications. However, most of the time, we won’t implement those patterns manually as above, but by using one of the many abstractions that ship with Elixir. For example, Elixir provides agents, which are simple abstractions around state:

iex> {:ok, pid} = Agent.start_link(fn -> %{} end)
{:ok, #PID<0.72.0>}
iex> Agent.update(pid, fn map -> Map.put(map, :hello, :world) end)
:ok
iex> Agent.get(pid, fn map -> Map.get(map, :hello) end)
:world
A :name option could also be given to Agent.start_link/2 and it would be automatically registered. Besides agents, Elixir provides an API for building generic servers (called GenServer), tasks, and more, all powered by processes underneath. Those, along with supervision trees, will be explored with more detail in the Mix and OTP guide which will build a complete Elixir application from start to finish.


## Concorrência

## Comparação com C#/C/Java/Ruby

## Conclusão

## Bibliografia
- https://pt.wikipedia.org/wiki/Elixir_(linguagem_de_programa%C3%A7%C3%A3o)
- https://elixir-lang.org/getting-started/processes.html
- https://medium.com/full-stack-tips/a-gentle-introduction-to-elixir-1da9261bae72
