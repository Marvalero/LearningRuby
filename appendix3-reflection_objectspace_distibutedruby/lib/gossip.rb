#!/usr/bin/ruby

module Gossip
  def see_methods
    if self.instance_of? Class
      "Public:#{self.public_instance_methods(false)}, Singleton:#{self.singleton_methods}"
    else
      "Public:#{self.public_methods - self.class.superclass.methods}"
    end
  end
  def calling_secure(&block)
    begin
      instance_eval(&block)
    rescue RuntimeError => detail
      "Failed with operation #{detail}"
    end
  end
  def system(*args)
    super.tap do |result|
      return "system(#{args.join(", ")}) returned #{result.inspect}"
    end
  end
  def puts(string)
    super
    "Done"
  end

  def enable_tracepoint(*traces)
    @tp = TracePoint.new(*traces) do |tp|
      p tp
    end
    @tp.enable
  end
  def disable_tracepoint
    @tp.disable
  end

  def where_i_am
    caller
  end

end

