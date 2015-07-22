#!/usr/bin/ruby

require 'open-uri'
require 'nokogiri'

class WriteWebpage
  def read_from_web(webname)
    @web = Nokogiri::HTML(open(webname))
  end
  def write_in_file(filename)
    File.open(filename,"w") do |file|
      file.puts "   ---   #{@web.title}   ---"
      @web.xpath('//h3/a').each do |node|
        file.puts node.text
      end
    end
  end
end

