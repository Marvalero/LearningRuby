require_relative 'execution'

module Webmanager
  class Runner
    def initialize(argv)
      @executor = Execution.new
      @webs = argv
    end

    def run
      puts @executor.create_threads(*@webs)
    end
  end
end
