#!/usr/bin/ruby

class Picture
  attr_reader  :author, :year
  attr_accessor :price, :description

  def initialize(author,year,price)
    @author = author
    @year = year
    @price = Float(price)
    @description = ""
  end

  def to_s
    "Author: #{@author}, Year: #{@year}, Price: #{@price}"
  end
end



