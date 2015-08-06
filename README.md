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


### Resume: 
 - Encoding (we put a comment in the first line of the file), “\” use separate an statement in multiples lines, BEGIN {} to execute code when the file is been loaded,END{} to execute code after the program has finished (it’s executed in reverse order), generalised delimited syntax (%q to write a literal text, %Q to write a expanded text, %w %W create an array of strings, %i %I create an array of symbols, %r regular expression, %s a symbol, %x shell command ),  
 - Basic types:
   - Numbers
   - Strings: partition to split an string, squeeze to eliminate duplicates, tr (similar to gsub)
   - Arrays
   - Hash: be careful using arrays has keys (rehash). 
   - Range
   - Symbol
   - RegularExpression: 
 - Names: be careful with variable and methods ambiguity, a=1 if false #-> a=nil
 - Global variables defined: 
    - $! (the exception object passed to raise)
    - $@ (the stack backtrace generated by the last exception)
    - $& (the string matched on the last mach)
    - $+ (max($1,$2,..))
    - $’ (post match)
    - $’ (pre match)
    - $1..$n (groups matched)
    - $~ (the result in an object MatchData)
    - $/ (the input record separator when we use gets)
    - $-0 (synonym of $/)
    - $\ (the string appended to print and write methods)
    - $, (separator of strings for methods print and join)
    - $. 
 - Expression, conditions and loops: block expressions, cad-when use === operator to made a match, 
 - Methods: begin-end-while eject the body at least one time, def method { def method } if we call method first is eject the outer and if we call again is eject the inner, def method (a,b=5,c=6,d) it’s weird, keyword arguments in a method, undef to undefined a method, method(**hash), super to call a super method
 - alias
 - class: attr_accessor, attr_writer, attr_reader, class module::name, include module
 - modules: module_function take instance methods and copy their definition into module methods (so you can used them without include them)   
 - block: a block is a closure, it remembers the context in which it was defined (including constants, class variables,…). A method can return a block. Proc is the class for blocks



otro: (a..z).count() {}

### Appendix

#### 1: Duck Typing
In ruby, the class is never (almost never) the type. Instead, the type of an object is defined more by what that object can do. This is so convenient for testing. 
  - Object.respond_to?(:method)
  - symbol.to_proc. Ejm: :upcase.to_proc.call("asfd”)
  - obj.send(:method) calls the method of the object
  - obj1.coerce(obj2): return an array with both object in a cool way to sum them

#### 2: Metaprogramming:
  - Object and classes: self (methods are searched in self), obj.class.ancestors to see the superclasses of the obj
  - Singletons: when we define a obj.method, ruby create an anonymous singleton class. Ruby makes this singleton class the class of the obj and makes his real class the superclass of the singleton class. The same happen with classes, a class as “Object” as superclass and “class” as class, but after create a singleton, his class is the anonymous singleton. 
	- We can also create singleton classes with notation “class << obj” 
	- you could also record a class “singleton = class << obj ; self; end”, but we cannot create a new instance of singleton class. 
	- Define a var: class Test; @var=99; class << self; attr_accessor :var; end; end
  - Inheritance and visibility: you could change the visibility of a method in the children, but we must take care (because they could execute dangerous methods). 
  - Modules and mixins: when you include a module, ruby create a new class with module methods. 
	- prepend: the methods in the prepended module take precedence over those in the host class. If we call ancestors, module will preceded the class (with include, class preced module) 
	- extend: add a class methods. 
 	- refinements: changes with prepend are global (for libraries and gems we use) so we could break a library we rely on. A refinement allow to make “local” changes just for some class and modules. 
  - Metaprogramming class-level macros: we could define a inner method in a method of a class and use it calling the outer method. We could also use it in a subclass. 
	- define_method(): to create a method
	- instance_variable_set(“name”,value)
	- We should use a module and extend it in our classes
  - Two other forms of class definition: we could extend a class with an expression or an Struct. We can also create new singleton classes using "someclass= Class.new do [methods] end”  
  - instance_eval and class_eval. This Object#instalce_eval, Module#class_eval and Module#module_eval, let us set self to an arbitrary object. This is dangerous and slow. class_eval define instance methods and instance_eval define class method. obj.instant_exec for execute code in the class. 
	- You must be careful with intense_eval and constants
  - Hook methods: it’s like a callback that ruby calls when some events occur. Hook methods: method_added, coerce, initialise_dup,…
      - inherited: it will be call if a class inherits from the original. 
      - method_missing(name_method, *args,&block): it’s called when we call a method that don’t exist in that class.
      - included/extended/prepended: for a module. it’s executed if the module is included/extended/prepended.

#### 3: Reflection, ObjectSpace, and Distributed Ruby
  - Looking at objects: 
      - ObjectSpace.each_object(Type) to see every object defined (don’t work with Fixnum, Symbols, true, false, nil and Float),
      - obj.methods, obj.respond_to? method, obj.kind_of? class 
  - Looking at classes: 
       - class#superclass
       - module#ancestors, class#ancestors
       - See methods of a class: private_instance_methods(false), protected_instance_methods(false), public_instance_methods(false), singleton_methods(false), class_variables, constant(false)
       - See methods of an instance: instance_variables, public_methods
  - Calling methods dynamically: object.send(:method,args), obj.method(:name).call, 
       - obj.bind(:method) to add a method
       - proc = %{obj.method} ;  eval(proc) : execute a method
       - binding: to get a context.(we could use eval(proc,context))
          ** remember: eval is so slooow
  - System hook: we could change include something in a method using def method ; super.tap { |result| #included code} ; end
  - Tracing your program execution: 
       - TracePoint class (pag 722) is useful to debug. You can capture b_call, b_return, c_call, c_return, call, end, line, raise, return, thread_begin, thread_end.
       - caller: return an array of the current stack
  - Behind the curtains: code = Ruby::InstructionSequence.compile(‘#code’)  ;   code.dissamble
  - Marshaling: marshalling is to store an object that you can reconstruct after. 
       - File.open(“name”,”w+”) { |file| Marshall.dump(object,file) } , Marshall.load(File.open(“name”)),
       - marshall_dump(), marshal_load(): could be redefined in a class to modify the way the class is saved and loaded
       - YALM: library slower than marshall but allow to save and load object in devices with different interpreters. YALM.dump(), YALM.load(). We could change the way is saved with method encode_with()
       
  - Distributed ruby: drb library allow to use marshalling and network to share objects between process. 

#### 4: Locking Ruby in the safe

$SAFE, obj.tained?, obj.untrushted? (it depends of the level of $SAFE) 

#### 5: thor
  - Comands:
      - thor list: lista las tareas de thor
      - thor class:task  ->ejecuta una tarea de la clase class que hereda de thor 
  - Use: define a class < Thor in a  “.thor" file and create methods with “desc 'name task’, ‘descriptive task’ “ before
  - Tasks can have:
      - arguments
      - options
  - Class group: we need to define it (class Klass < Thor::Group) and register it in other class: register(class_name, subcommand_alias, usage_list_string, description_string)
  - invoke: allow to invoke other tasks of thor->  invoke :task, [args]
  - Executable: include the ruby shebang line, require “thor”, define Thor class, MyThorExecutable.start
  - namespace: to create an “alias” of the namespace

#### 6: grape
Executing:
  - test: 
       - GET: curl -i -N http://localhost:9292/
       - POST: curl -d '{"key": "value"}' 'http://localhost:9292/statuses' -H Content-Type:application/json -v
  - rackup: execute “config.ru”
  - rspec: get, post, delete, put

Programming:
  - helpers:  you can use a helper methods (with the macro helper). We could define it in module
  - params:
       - requires
       - optional
       - group
       - mutually_exclusive: to ensure that two parameters are not defined at the same time
       - exactly_one_of
       - all_or_none_of
       - given-required
       - ** Suported types: Integer, string, array,… and any class with “parse” method defined 
  - desc: to describing methods.
  - detail: A more enhanced description
  - params: Define parameters directly from an Entity
  - success: (former entity) The Entity to be used to present by default this route
  - failure: (former http_codes) A definition of the used failure HTTP Codes and Entities
  - named: A helper to give a route a name and find it with this name in the documentation Hash
  - headers: A definition of the used Header
  - cookies: You can set, get and delete your cookies very simply using cookies method
  - resource: define the namespace
  - version: add in the path
  - authentication:
  - request.body.read: to get information form the body
  - redirect: to a new url (you can redirect temporally or permanently)
  - Exceptions: error! (“Access Denied”, 401), you can present documented errors with Grape entity using the grape-entity gem
  - ** Exception handling: rescue_from ArgumentError, RuntimeError {|e| error!(“Error: #{e}")}

#### 7: rack
Rack create an interface for a Webserver. But it's more than interface, it can be used to specify modules and his dependencies(using middleware).

To use Rack, provide an "app": an object that responds to the call method, taking the environment hash as a parameter, and returning an Array with three elements:
   - The HTTP response code
   - A Hash of headers
   - The response body, which must respond to each

You can use the rackup command line tool to start the app. For example, "config.ru": 
 run Proc.new { |env| ['200', {'Content-Type' => 'text/html'}, ['get rack\'d']] }

With Rack you can separate stages of the pipeline doing:
  - Authentication: when the request arrives, are the users logon details correct? How do I validate this OAuth, HTTP Basic  Authentication, name/password.
  - Authorisation: "is the user authorised to perform this particular task?", i.e. role-based security.
  - Caching: have I processed this request already, can I return a cached result?
  - Decoration: how can I enhance the request to make downstream processing better?
  - Performance & Usage Monitoring: what stats can I get from the request and response?
  - Execution: actually handle the request and provide a response.

To create a middleware, we have to define methods initialize(app) and call(env). In call method we could do some tasks and then do @app.call(env) to return the control to rack. Then, we will use "use" to set the middleware we want to use before run an app. 

To avoid manipulate [status, headers, body, Rack provides a couple of convenience classes, Rack::Request and Rack::Response, to make life a little bit easier.

  - Rack::Request wraps an env hash and provides you with convenience methods for pulling out the information you might need.
  - Rack::Response is complementary to Rack::Request, and gives you a more convenient way to construct a response.

#### 9: Sequel
   - sequel console: sequel sqlite://test.db
   - Sequel connect: DB = Sequel.sqlite
   - Create table: DB.create_table :mytable {}
   - Get table: table = DB[:mytable]
   - Put new row: table.insert()
   - Get data:

                DB[:countries].filter(:region => 'Middle East').avg(:GDP)

                middle_east = DB[:countries].filter(:region => 'Middle East’)
                middle_east.order(:name).each{|r| puts r[:name]}
   - Execute a SQL syntaxt: DB.run(“SQL syntax”)
   - Delete: posts.where('stamp < ?', Date.today - 7).delete 


### Searching a method
object.methods.inspect.split(", ").grep(/method/)

### RSpec 
 - Ejecuta un test concreto: bundle exec rspec spec/company_spec.rb:16
 - pending: we could write this and the framework will ignore this test
 - before(:each) and after(:each): to execute code before and after a tests
 - stub: create an fake object. Ejm: bob.stub(:speak).and_return(‘hello’). For consecutive values: obj.stub(:foo).and_return(1,2,3)
 - mock: cerate a fake object and said what is the input we need. bob = mock();  bob.should_receive(:testing).with('content')
 - subject: allow to define alias for code
 - let(:name): create alias for code with a name
 - Config Rspec:
       - c.order = 'random'
       - c.color = true
       - c.formatter = 'documentation'
 

### Pry 
 - Breakpoints: require “pry” ; binding.pry
 - whereami number: you see code
 - wtf: tack trace
 - ls: methods and properties available in Pry (-g para user grep)
 - cd: You can move up the scope chain using cd .. or you can go back to the top level of the scope using cd /.
 - nesting: to see how deep you are
 - find-method: to find a method
 - next(next line)-step(next line if  it’s a method, then move into that method)-continue: we need to add the gems: “pry-remote” and “pry-nav” to de gemfile

