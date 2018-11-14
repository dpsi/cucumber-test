Given("I use the parallel gem") do
  puts 'starting step'
  Parallel.each(1..3) do |i|
    $stderr.print "Thread #{i} sleeping\n"
    sleep 5 * i
    $stderr.print "Thread #{i} exiting\n"
  end
  puts 'Step ending'
end

Given 'I use regular Ruby Threads' do
  threads = []
  3.times do |i|  
    threads << Thread.new do        
      $stderr.print "Thread #{i} sleeping\n"
      sleep 5 * i
      $stderr.print "Thread #{i} exiting\n"
    end     
  end 
  threads.each {|t| t.join}
end
