#!/usr/bin/ruby

def order(*arg,&block)
  arg.sort
  block.call arg
end

def sayHi(arg1=["Maria"],*other,options)
  # Must we say good_nigth?
  if options.has_key?(:good_nigth)
    print options[:good_nigth] + " #{arg1} "
  else
    print "Hi #{arg1} "
  end
  # Are there other people?
  puts "and friends" if other.length>0
end

# We order arrays
people = order("Maria", "Pedro", "Pepe", "Pepa") { |array| array.sort { |x| x.length } }

# We say hello to people
options = { good_nigth: "Bye"}
sayHi(people.pop,options)
sayHi(*people,{})
