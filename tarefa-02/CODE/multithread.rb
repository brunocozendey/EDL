def print_numbers(thread_number)
  (0..5).each do |j|
    p "Thread: #{thread_number}, number: #{j}"
    sleep(Random.rand)
  end
end
 
(0..5).each do |i|
  Thread.new { print_numbers(i) }
end