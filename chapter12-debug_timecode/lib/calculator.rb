#!/usr/bin/ruby

require_relative 'operation_exception'

class Calculator
  def calculate(operation,*nums)
    case operation
    when "*"
      nums.inject {|result, num| result*num}
    when "+"
      nums.inject {|result,num| result+num}
    when "%"
      nums.inject {|result,num| Float(result)%num}
    when "/"
      nums.inject {|result,num| Float(result)/num}
    else
      raise OperationException.new(operation), "OperationError"
    end
  end
end
