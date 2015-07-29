#!/usr/bin/ruby

require 'yaml'

module Marshalling
  def do_marshal(f_name,obj)
    File.open(f_name,"w+") do |f|
      Marshal.dump(obj,f)
    end
  end
  def load_marshal(f_name)
    Marshal.load(File.open(f_name))
  end
  def load_yalm(f_name)
    parsed = begin
      YAML.load(File.open(f_name))
    rescue ArgumentError => e
      puts "Could not parse YAML: #{e.message}"
    end
    parsed
  end
  def store_yalm(f_name,obj)
    File.open(f_name, "w") {|f| f.write(obj.to_yaml) }
  end
end

