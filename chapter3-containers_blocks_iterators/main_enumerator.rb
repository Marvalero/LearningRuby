#!/usr/bin/ruby

def num_primos
  Enumerator.new do |yielder, n:2|
    primos = []
    loop do

      found=true
      while found==true
        found=false
        primos.each do |num_primo|
          if n%num_primo == 0
            found=true
          end
        end
        if found==true
          n=n+1
        end
      end
      primos[primos.length]=n
      yielder.yield(n)
      n=n+1

    end
  end

end

num_primos.first(15).each {|num| print num, " "}
puts
