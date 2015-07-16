# Checkerboard method
def checkerboard(size)
  # Se pone 2 porque ya al empezar, se esta aniadiendo un caracter de mas
  line1 = (2..size).inject("r") { |result,index| if result.chars.to_a.last=~/r/ then result+"b" else result+"r" end }
  # Invertimos la linea 1
  line2 = line1.chars.to_a.collect {|x| if x=~/r/ then "b" else "r" end}
  # Ponemos las dos lineas en un array y los modificamos para que las letras esten entre corchetes
  lines = [line2.join.gsub(/b/,"\[b\]").gsub(/r/,"\[r\]"),line1.gsub(/b/,"\[b\]").gsub(/r/,"\[r\]")]
  result = ""
  (1..size).each { |x| result="#{result}#{lines[x%2]}\n"}
  result
end

checkerboard(5)
