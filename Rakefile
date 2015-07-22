
task :default => :first_task

task :first_task do
    puts "First task"
end

task :second_task do
    puts ">>Second task"
end

task :third_task => [:first_task, :second_task] do
    puts ">>>>Hurray. This is the third task"
    puts " This task depends on the first_task and second_task and won’t be executed unless both the dependencies are satisfied."
    print "The syntax for declaring dependency is "
    puts " :main_task => :dependency"
    puts "and if there are more than 1 dependency, place all the dependencies inside the [] separated by commas "
    puts ":main_task => [:dep1, :dep2]"
end

task :update_git do
  print "Enter the commit name and press enter: "
  line = STDIN.gets.chomp

  sh %{git pull}
  sh %{git add --all }
  sh %{git commit -m \"#{line}\"}
  sh %{git push}
end


