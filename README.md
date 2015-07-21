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
fibers let you suspend the execution of one part of the program(obj.resume: execute the block, Fiber.yield: stop the execution of the block, libraries: fiber and continuation), threads for decoupled execution, or use multiple processes,     



### Searching a method
object.methods.inspect.split(", ").grep(/method/)

### RSpec 

Ejecuta un test concreto: bundle exec rspec spec/company_spec.rb:16

Debug: require “pry” ; binding.pry


