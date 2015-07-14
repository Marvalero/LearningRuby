#!/usr/bin/ruby

require_relative 'txt_reader'
require_relative 'logger'

def doingsth(reader)
  data = reader.get_json
  Logger.info("Data - " + data)
  if block_given?
    yield data
  end
end

txt_name = ARGV[0]
Logger.info("Opening " + txt_name)

reader = TxtReader.new(txt_name)

full_file = reader.get_line
Logger.info("First line - " + full_file.call)

data = doingsth(reader) {|info| info.split(/\]*\[/) }

Logger.info("Data vale: " + data.to_s)
array_data = []
data.each_with_index {|x,index| array_data[index] = x.split(",")}
Logger.info("Tenemos el array: " + array_data.to_s)

puts array_data[2][2]


