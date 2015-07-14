#!/usr/bin/ruby

def num_primos
  Enumerator.new do |yielder, n:2|
    primos = []
    loop do
      primos.each do |num_primo|
        while n%num_primo == 0
          n = n+1
        end
      end
      primos[primos.length]=n
      yielder.yield(n)
      n=n+1
    end
  end
end

puts num_primos.first(10)

