#!/usr/bin/ruby

class OperationException < RuntimeError
  attr  :operation
  def initialize(operation)
    @operation = operation
  end
end

