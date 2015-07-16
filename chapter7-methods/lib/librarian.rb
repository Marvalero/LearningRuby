#!/usr/bin/ruby

class Librarian

  def orderBooks(*arg,&block)
    if block_given?
      block.call arg
    else
      arg.sort
    end
  end

  def sayHi(arg1="Maria",*other,options)
    # Must we say good_nigth?
    if options.has_key?(:good_nigth)
      print options[:good_nigth] + " #{arg1} "
    else
      print "Hi #{arg1} "
    end
    # Are there other people?
    puts "and friends" if other.length>0
  end
end


