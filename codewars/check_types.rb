#!/usr/bin/ruby
class Typer

  {
    number:    Numeric,
    string:    String,
    array:     Array,
    time:      Time,
    regexp:    Regexp,
    boolean:   [TrueClass, FalseClass],
    exception: Exception,
    nil:       NilClass
  }.each do |(name, types)|
    define_singleton_method("is_#{name}?") do |object|
      [*types].any? { |type| type === object }
    end
  end

end
