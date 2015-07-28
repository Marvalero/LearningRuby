#!/usr/bin/ruby

require_relative "port"

module LocalDevices
  class Router
    include Port
    add_port 1, 2
    def send(source, dest)
      "Sending.."
    end
  end
end
