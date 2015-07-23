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

  - Rake to define tasks you may want to repeat 
  - Command-line arguments ( ruby <options> <-> <programfile> <arguments> ). Arguments ( ARGV: array con los parametros, ARGF: accede a ficheros pasados como parametro (ARGF.filename, ARGF.gets, ARGF.file, ARGF.lineno,ARGF.inplace_mode=ext)).Options:
    - 0 : octal
    - a : auto split mode 
    - c : cheks syntax
    - d : debug
    - E encoding : encoding
    - e ‘command’ : execute a command in ruby
    - F pattern : specifies the input separator used as the default split (affects the -a option)
    - W level: set level of warning issues
    - y : enables yacc debugging
    - i .back program.rb file1 file2: creates a backup files if som input file are modificated
  - exit: end up the application, at_exit: allow to execute code at exit, 
  - environment variables: it’s like a hash, ejm: ENV[’SHELL’]. The changes are just visible in the process (if a child changes a environment variable, the father won’t know nothing)
  - find libraries: the variable $: keeps the sites where ruby search for a variable. Add a library (RUBYLIB, $: << File.dirname(__FILE__))
  - Gems: (gem server to see web documentation) 
          - "gem list name_gem -d" to see information about a gem
          - “gem search -r name_gem” to search a gem
          - “gem install name_gem” to install a gem
          - Gemfile: 
               - source: where it’ll search gems
               - gem ‘mygem’, git:  “https://…"
               - gem ‘mygem’, path: “/path_to_gem/"

### Chapter 13 
 - Namespaces: we use double colon (::) to resolve a namespace. Use: class/module::constant  (class and modules are themselves constants)
 - Organizing your source:  (executed with: ruby -I lib bin/program args)
     - bin/       -->  command-line interface
          - program
     - lib/        -->  library files
          - program/
               - lib1.rb
               - lib2.rb
               - runner.rb  —> module with a class to execute
     - test/      -->  test files
 - Distributing and instaling code:
     - good practices: add a README, LICENSE, INSTALL and doc/
     - create a “packaging/program/program.gemspec” with specifications. then run “gem build program.gemspec” and it will create a program-0.0.1.gem file
     - install a gem: sudo gem install pkg/program-0.0.1.gem
     - push gem to public repository: gem push program-0.0.1.gem 



otro: (a..z).count() {}


### Searching a method
object.methods.inspect.split(", ").grep(/method/)

### RSpec 

Ejecuta un test concreto: bundle exec rspec spec/company_spec.rb:16

Debug: require “pry” ; binding.pry


