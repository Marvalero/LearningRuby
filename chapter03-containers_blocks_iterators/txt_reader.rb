#!/usr/bin/ruby

require_relative 'logger'

class TxtReader
  attr_reader :actual_txt

  public
  def initialize(txt_name)
    @actual_txt = txt_name
    @f = File.open(String(@actual_txt))
    @enum_file = @f.to_enum
    @returned = ""
  end

  def read_txt(txt_name)
    @actual_txt = txt_name
    @f.close

    @f = File.open(String(@actual_txt))
    @enum_file = @f.to_enum
  end

  def get_line
    lambda do
      if !( @returned =~ /end/)
        # We read a line
        @returned = @enum_file.next
        if @returned =~ /end/
          Logger.info("Closing the file")
          @f.close
        end
      end
      @returned
    end
  end

  def get_json
    if !(@returned =~ /end/)
      # We read the file
      @returned = @enum_file.to_a.inject("") {|data,line| "#{data}#{line.split(" ").to_s}"}
    end
    @returned
  end
end


