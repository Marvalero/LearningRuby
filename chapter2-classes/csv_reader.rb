#!/usr/bin/ruby

require 'csv'
require_relative 'picture'
require_relative 'logger'

class CsvReader
  attr_accessor :displayed_pictures

  public
    def initialize
      @displayed_pictures = []
    end

    def read_in_csv_data (csv_file_name)
      CSV.foreach(csv_file_name, headers: true) do |row|
        Logger.info("New picture of #{row["Author"]}")
        @displayed_pictures << Picture.new(row["Author"], row["Year"], row["Price"])
      end
    end

    def to_s
      info = ""
      @displayed_pictures.each do |picture|
        info = info + "{" +picture.to_s + "}"
      end
      info
    end
end
