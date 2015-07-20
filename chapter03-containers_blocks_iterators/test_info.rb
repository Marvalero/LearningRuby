#!/usr/bin/ruby

require_relative 'txt_reader'
require 'minitest/autorun'

class TestInfo < Minitest::Test
  def test_reader
    reader = TxtReader.new("data.txt")
    full_file = reader.get_line
    assert_equal("Juan Lopez 16 178\n",full_file.call)
  end
end

