#!/usr/bin/ruby

class Logger
  @@error=0
  public
    def Logger.info(out)
      puts "INFO: " + out
    end
    def Logger.error(out)
      Logger.increase_errors
      puts "ERROR (#{@@error}): " + out
    end

  private
    def Logger.increase_errors
      @@error=@@error+1
    end
end

