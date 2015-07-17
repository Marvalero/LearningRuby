#!/usr/bin/ruby

class Company
  attr_reader :workers
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
end
