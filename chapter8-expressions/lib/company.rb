#!/usr/bin/ruby

class Company
  attr_reader :workers, :task
  def initialize(*workers)
    @workers = workers if workers != []
    # We set a default value
    @workers ||= ["Maria","Pepe"]
  end
  def [](offset)
    @workers[offset]
  end
  def workers_last_char_no_vocal
    @workers.select {|person| person.chars.last !~ /[aeiou]/}
  end
  def workers_last_char_vocal
    @workers.grep(/[aeiou]$/)
  end
  def define_work(task)
    case task
    when Regexp.new("project\s(.*)","i")
      if  !(defined? @task)
        @task = []
      end
      @task<<$1
      @task
    else
      "Invalid task"
    end
  end
end
