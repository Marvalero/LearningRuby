#!/usr/bin/ruby

module Port
  module ClassMethods
    def add_port(*num_ports)
      num_ports.each do | num_port |
        define_method("port#{num_port}=")  {|x| instance_variable_set("@port#{num_port}",x) }
        define_method("port#{num_port}") { instance_variable_get("@port#{num_port}") }
      end
    end
  end

  # method that will be included as a instance method
  def see_all_ports
    self.methods.select {|var| var.to_s.match(/port\d+=/)}.collect { |sym| sym.match(/(port\d+)/) and $1}
  end

  # Hook method: is called when a module is included into a class
  def self.included(host_class)
    # We add class methods
    host_class.extend(ClassMethods)
  end

end

