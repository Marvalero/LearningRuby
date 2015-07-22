# LearningRuby
Examples of Ruby code

### Interesting Webpages codewar

### Chapter 3 
test, iterator, each_with_index, enumerators (to_enum, next, enum_for, to_a, Enumerator.new, lazy,), yield+parameter, integer.select{}, open file, ejector un objeto de bloque con .call, map=collect, array.map return an enumerator and array.map {|item| block} return an array, 3.times {}, 0.upto(9) {}, 0.step(12,3) {}

*** Methods to change arrays: array.map, array.sort_by, array.inject, array.collect, array.select, (a..z).count() {}

### Chapter 4 
Comparable, mixin

### Chapter 5 
mathn, %Q, define a method between #{}, lo de << y <<- para definir un string, Struct.new(), rangos con .. y …, ranges as conditions, ===, definiendo each() una class soporta iteradores. 

### Chapter6 
sub, gsub, gsub!, Regexp, match, ^, $, \A, \Z, \s (espacios), []

### Chapter 7
*array expande el object, &block, hash as param (for options), ** for extra hash argument 

### Chapter 8 
%x{} to execute code, we could create a method “def [](offset)”,  a method “def variable=()” always return the variable, ||= to set a default value, !~ is the negated form of =~, if/unless, while/until, case-when, concatenate expression “if line=~/(.*)/ then puts "hi #{$1}" end while (line = STDIN.gets.chomp) !~ /^q/”, grep(regexp), loop {} needs to be break up to stop, for-in, (break,redo,next) to alter the execution of a loop,  defined?, case-when 

### Chapter 9
begin-rescue-[else]-[ensure]-end, $! exception reference, exceptions(Exception, SyntaxError, NameError, StandardError), rescue Exception => info_exception_var, retry to repeat a begin-rescue block, raise to throw exceptions, class MyException < RuntimeError, return=cath(:done)-throw(:done, return) for loops, 

### Chapter 10
file=File.new(“name”,”r”); file.close , File.opens(“name”,”r”)-do-end, while(line = gets)-then-end, file.each_byte.with_index {}, file.each_line(“separator") {}, File.foreach(“filename”) { | line |  line.scan(/w+/) {} }, string = IO.read(“filename”) to read a full file, array = IO.readlines(“filename”), [1,2,3].pack(“c*”) convertor into binary, STDOUT << 99 << “jaja” << endl, TCPSocket.open(), Net::HTTP.new(), open-air, gem Nokogiri, 


### Chapter 11
- fibers let you suspend the execution of one part of the program(Fiber.new {}: create a fiber, obj.resume: execute the block, Fiber.yield: stop the execution of the block, libraries: fiber and continuation), 

- Threads for decoupled execution (Thread.new(var) { | local_var |}: create a thread, it’s better use print ”\n” instead of puts, thread_obj.join wait a thread until it end up, thread_obj.value return the last statement of the thread, thread_obj.status, thread_obj.alive?, thread_obj.priority=, Thread.current to access at the executing thread and you could use Thread.current[:var] to share variables between threads_obj, Thread.list, Thread.abort_on_exception=true/false, Thread.stop, thread_obj.run, Thread.pass, threads_objs.each{&:join})
     - Mutex (Mutex.new, mutex_obj.lock, mutex_obj.unlock, mutex_obj.syncronize {}, mutex_obj.trylock doesn’t stop a thread, mutex.sleep(time) to unlock the mutex for some time)   

     - queue: library secure to use in threads. It automatically implements mutex. 
- Processes (system(“ls”) execute a command in a subprocess, obj=IO.popen()-obj.puts-obj.close_write,obj.gets execute a command as a subprocess and you could write and read from it, IO.popen(“-“,”w+") make a fork, Process.wait wait a child, trap() {} create an interruption when child end, fork { # Executed by child}, IO.popen(“comand”) {| result | #Executed process finish})  

     - $? contains information about a subprocess
     - $$ pid of a proccess

### Chapter12 
  - obj.freeze to freeze a variable
  - execution of code (-w to show warnings)
  - Efficiency: benchmark module ( bm(6) { |x|  x.report("test") {100_000.times { #code } } ),  -r profile to show 
  - debug: gem pry, -r debug (c: execute all, s: step to the next line, n: skip over a line, b line: create a breakpoint on line)  
 

otro: (a..z).count() {}


### Searching a method
object.methods.inspect.split(", ").grep(/method/)

### RSpec 

Ejecuta un test concreto: bundle exec rspec spec/company_spec.rb:16

Debug: require “pry” ; binding.pry


