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
