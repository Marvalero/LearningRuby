#!/usr/bin/ruby

class Librarian
  attr_reader :books

  def initialize
    @books=[]
  end
  def orderBooks(*arg,&block)
    %x{date}.match(/.* (.*):(.*):(.*) .*/)
    arg.each {|book| @books<<{ name: book, date: [$1,$2,$3]} }
    if block_given?
      block.call @books.map {|book| book[:name]}
    else
      @books.map {|book| book[:name]}.sort
    end
  end

  def sayHi(arg1="Maria",*other,options)
    line = ""
    # Must we say good_nigth?
    if options.has_key?(:good_nigth)
      line = line + options[:good_nigth] + " #{arg1}"
    else
      line = line + "Hi #{arg1}"
    end
    # Are there other people?
    line = line + " and friends" if other.length>0
    line
  end

  def search_book(client,name: /.*/, author:, **date)
    libros = @books.select {|book| book[:name]=~ name}
    puts date.inspect
    if date == {}
      libros
    else
      libros.select {|book| book[:date][0].to_i==date[:hour]}
    end
  end
end


