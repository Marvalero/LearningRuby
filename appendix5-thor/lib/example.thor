

class Test < Thor
  desc "example", "an example task"
  def example
    puts "I'm a thor task!"
  end

  # thor help test:see
  desc "see FILE ", "an example task that does something with a file"
  def see(file)
    puts "You supplied the file: #{file}"
  end

  # Options Example
  desc "delete? FILE", "an example task"
  method_option :delete, :aliases => "-d", :desc => "Delete the file after parsing it"
  def delete?(file)
    puts "You supplied the file: #{file}"
    delete_file = options[:delete]
    if delete_file
      puts "You specified that you would like to delete #{file}"
    else
      puts "You do not want to delete #{file}"
    end
  end
end
