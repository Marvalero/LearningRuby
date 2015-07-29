#!/usr/bin/ruby

class Untrusted
  def run_raise(&block)
    # default: $SAFE = 0
    th = Thread.new do    # Start a different thread
      $SAFE = 3   # Raise the level just in the thread
      eval(block.to_s)    # Run the dangerous program
    end
    th.join
    th.value
    # Now: $SAFE = 0
  end
  def run_untrust(cmd)
    # default: $SAFE = 0
    th = Thread.new do    # Start a different thread
      $SAFE = 1   # Raise the level just in the thread
      system(cmd)    # Run the dangerous program
    end
    th.join
    th.value
    # Now: $SAFE = 0
  end
end
