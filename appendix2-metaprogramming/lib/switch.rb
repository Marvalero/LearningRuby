#!/usr/bin/ruby

require_relative "port"

module LocalDevices
  class Switch
    include Port
    add_port 1, 2, 3, 4
    def send(source, dest)
      "Sending.."
    end
  end
end
