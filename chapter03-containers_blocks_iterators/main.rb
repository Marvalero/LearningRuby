#!/usr/bin/ruby

require_relative 'txt_reader'
require_relative 'logger'

def get_information(reader)
  data = reader.get_json
  Logger.info("Data - " + data)
  if block_given?
    yield data
  end
end


txt_name = ARGV[0]
Logger.info("Opening " + txt_name)

# We read the txt file
reader = TxtReader.new(txt_name)

# We get the first line
full_file = reader.get_line
Logger.info("First line - " + full_file.call)

# Getting all information from the file
data = get_information(reader) {|info| info.split(/\]*\[/) }

# We create an array from the array
Logger.info("Data vale: " + data.to_s)
array_data = []
data.each_with_index {|x,index| array_data[index] = x.split(",")}
Logger.info("Tenemos el array: " + array_data.to_s)

puts array_data[2][2]

