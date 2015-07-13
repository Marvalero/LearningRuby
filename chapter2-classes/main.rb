#!/usr/bin/ruby

require_relative 'csv_reader'
require_relative 'logger'

Logger.info("Starting the application...")

reader = CsvReader.new

loop do
  puts "Write a file names: "
  files = STDIN.gets.chomp
  files_array = files.split(" ")

  files_array.each do |file_name|
    if (file_name == '$')
      Logger.error("This file name is wrong")
    elsif (file_name != 'q')
      Logger.info("Processing #{file_name}")
      reader.read_in_csv_data(file_name)
    end
  end

  break if files == 'q' || files =~ / +q */ || files =~ / *q +/
end

puts  reader.to_s

