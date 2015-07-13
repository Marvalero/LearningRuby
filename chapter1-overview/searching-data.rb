#!/usr/bin/ruby

# We will define a forbidden symbols
$forbidden = {
  :money => "£",
  :ampersand => "&"
}

# Method used to log info about execution of application
def log(phrase)
  puts "INFO: " + phrase
end

def searching_forbidden_words(hasher)
  hasher.each do |word, number|
     if word == $forbidden[:money] || word == $forbidden[:ampersand]
       hasher[word]="ERROR"
       yield
     end
  end

  if hasher.to_s =~ /ERROR/
    log("Using a forbidden word - " + hasher.to_s)
  end
end

def searching_warning(hasher, warning_words)
    hasher.each do |word, number|
      if warning_words.to_s.include? word
        hasher[word]="WARNING"
        yield
      end
    end

    if hasher.to_s =~ /WARNING/
      log("WARNING - " + hasher.to_s)
    end
end

log("Starting the application...")

# We create a new array
puts "Write something and press ENTER (forbidden words: '&' and '£'): "
line = STDIN.gets.chomp
array = line.split(" ")
log("New array - #{array.inspect}")

# Word couter
counter = Hash.new(0)
array.each do |word|
  counter[word]=counter[word]+1
end
log("Counter hasher - " + counter.to_s)

# Searching for forbidden words
searching_forbidden_words(counter) {log("ERROR found")}

# Other forbidden symbols
searching_warning(counter, ARGV) {log("WARNING found")}


