require 'parallel'

at_exit do
  puts 'Now running at_exit'
end

Before do
  puts "This is a before hook"
end

After do
  puts "This is an after hook"
end
