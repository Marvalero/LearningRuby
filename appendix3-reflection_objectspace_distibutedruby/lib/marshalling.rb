#!/usr/bin/ruby

module Marshalling
  def do_marshal(f_name,obj)
    File.open(f_name,"w+") do |f|
      Marshal.dump(obj,f)
    end
  end
  def load_marshal(f_name)
    Marshal.load(File.open(f_name))
  end
end

