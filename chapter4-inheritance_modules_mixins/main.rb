#!/usr/bin/ruby

require_relative 'logger'

module Level3
  def send_package(packet)
    Logger.info("Router - New packet to send: " + packet)
  end
end

module Level2
  def send_package(packet)
    Logger.info("Switch - New packet to send: " + packet)
  end
end

class Router
  include Level2
  include Level3
  include Enumerable

  def initialize(ips)
    @ips = ips
  end

  def each(&block)
    @ips.each(&block)
  end
end

core = Router.new(["10.0.0.1","10.0.1.1"])
core.send_package("Paquete")

core.each {|ip| puts "Router IP - #{ip}" }
Logger.info("Router IPs - " + core.inject {|total,ip| total + ", " + ip })



