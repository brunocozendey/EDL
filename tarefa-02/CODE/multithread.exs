defmodule ThreadSimples do
  def print_thread(msg,n) when n <= 1 do
    IO.puts msg<>" n = #{n}"
    #IO.puts n
  end
  def print_thread(msg,n) do
    IO.puts msg<>" n = #{n}"
    #IO.puts n
    print_thread(msg,n - 1)
  end
end


spawn ThreadSimples.print_thread("Thread1",1000)
spawn ThreadSimples.print_thread("Thread2",1000)
