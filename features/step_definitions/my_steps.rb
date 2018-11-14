Given("I use the parallel gem") do
  Parallel.each(1..3) do |i|
    sleep 5 * i
    $stderr.print "Parallel #{i} exiting\n"
  end
end

Given 'I use regular Ruby Threads' do
  threads = []
  (1..3).each do |i|  
    threads << Thread.new do        
      sleep 5 * i
      $stderr.print "Thread #{i} exiting\n"
    end     
  end 
  threads.each {|t| t.join}
end

Given "I use Kernel\#fork" do
  raise "Can't test frok, your implementation does not support it" unless Process.respond_to?(:fork) 
  (1..3).each do |i|
    fork do
        sleep 5 * i
        $stderr.print "Fork #{i} exiting\n"
    end
  end
  Process.waitall
end
