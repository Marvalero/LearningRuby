require 'thor/group'
require 'thor'

module MyAwesomeGem
  # Execute a group of task
  # Usage: ./group_thor counter num
  class MyCounter < Thor::Group
    # number will be available as attr_accessor
    argument :number, :type => :numeric, :desc => "The number to start counting"
    desc "Prints the 'number' given upto 'number+2'"
    def one
      puts number + 0
    end
    def two
      puts number + 1
    end
    def three
      puts number + 2
    end
  end

  # Other task
  class MyCommand < Thor
    # To make MyCounter available as a subcommand, you need to call the register method:
    #  register(class_name, subcommand_alias, usage_list_string, description_string)
    register(MyAwesomeGem::MyCounter, "counter NUM", "counter NUM", "Prints some numbers in sequence")

    desc "foo", "Prints foo"
    def foo
      invoke :loo, [2]
      # invoke MyAwesomeGem::MyCounter,:counter, [3]
      puts "foo"
    end

    desc "loo [NUM]", "Prints loo num"
    def loo(num=5)
      puts "loo #{num}"
    end
  end
end
