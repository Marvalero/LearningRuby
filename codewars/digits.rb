# Take digits and return the max combination 
def solution(digits)
  digits.scan(/\d{5}/).max.to_i
end
