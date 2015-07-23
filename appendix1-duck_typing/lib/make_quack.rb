#!/usr/bin/ruby

class MakeQuack
  def start(quaker)
    # We check if it could quack
    quaker.quack if quaker.respond_to?(:quack)
  end
  def to_proc
    # We create a block
    # proc { |x| "Here's #{x}!" }
    # obj.send("method") call a method of the object
    proc { |x| x.send(:quack) }
  end
end

