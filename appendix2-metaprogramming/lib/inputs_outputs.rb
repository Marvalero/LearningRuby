#!/usr/local/ruby

# 3- prepend, include, extend, refinements
module InputsOutputs
  def read_keyboard(*args)
    args.collect {|x| x }
  end
  def write_screen(*args)
    args.each {|x| print x," "}
    puts
  end
end

