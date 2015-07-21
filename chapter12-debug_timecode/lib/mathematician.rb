#!/urs/bin/ruby

require_relative 'calculator'

class Mathematician
  def work
    begin
      require 'pry' ; binding.pry
      Calculator.new.calculate("£")
    rescue OperationException => detail
      "Failed with operation #{detail.operation}"
    end
  end
  def thinking(*subjects)
    ideas = catch(:done) do
      ideas = []
      subjects.each{|subject| ideas << subject and (throw(:done, ideas) if ideas.length > 2)}
    end
  end
end
