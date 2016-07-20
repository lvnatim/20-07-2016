# Associated numerical value for each roman numeral. It's important that it goes from largest to smallest.
@numeral_hash = {
  M: 1000,
  CM: 900,
  D: 500,
  CD: 400,
  C: 100,
  XC: 90,
  L: 50,
  XL: 40,
  X: 10,
  IX: 9,
  V: 5,
  IV: 4,
  I: 1
}

def to_roman(num)
  result_string = ""
  remainder = num

  puts "Starting conversion ---------------------------------------------------"
# Appends a numeral x times to the based on how many times the numerical value divides into the parameter
  @numeral_hash.each do |letter, value|
    if value <= remainder
      times_to_insert = remainder / value
      puts "It's less than the remainder! Appending #{letter.to_s} #{times_to_insert} times."
      result_string << letter.to_s * times_to_insert
      remainder -= value * times_to_insert
    elsif remainder == 0
      puts "No more operations left to do. Ending."
      break
    else
      puts "It's more than the number! Skipping."
      next
    end
  end

  result_string
end

# Drive code... this should print out trues.

puts to_roman(2553) == "MMDLIII"
puts to_roman(1) == "I"
puts to_roman(3) == "III"
puts to_roman(6) == "VI"

def test(number)
  return "The roman numerical representation of #{number} is #{to_roman(number)}!"
end

p test(200)
p test(2266)
p test(351)
p test(999)

# TODO: what other cases could you add to ensure your to_roman method is working?
