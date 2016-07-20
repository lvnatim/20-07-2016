def bottle_calculator(money=0, caps=0, empties=0, free_bottles=0)
  # Bottles redeemed / bought this round
  bottles = money / 2 + free_bottles

  puts "Bottles gained this round: #{bottles}"

  # These are the caps from the bought bottles. If no bottles are bought, these are zero.
  caps_from_bottles = bottles
  empties_from_bottles = bottles

  puts "I get #{caps_from_bottles} caps from these bottles and #{empties_from_bottles} empty bottles from this."

  # Previous owned caps and empties added to the current new caps and empties
  total_caps = caps_from_bottles + caps
  total_empties = empties_from_bottles + empties

  puts "I have #{caps} caps and #{empties} empties from last time."
  puts "I added my leftover caps to get #{total_caps} and leftover empties to get #{total_empties}"

  # Calculate free bottles from these new caps. I'll use them next time.
  free_from_caps = total_caps / 4
  free_from_empties = total_empties / 2
  total_free = free_from_caps + free_from_empties

  puts "Next time I go to the store, I'll get #{total_free} free bottles."
  # If I don't get any free bottles next time, I'll stop doing this stuff.
  return bottles if total_free == 0

  # If I can go to the store again, I'll be keeping these caps / empty bottles just in case.
  leftover_caps = total_caps % 4
  leftover_empties = total_empties % 2

  puts {"I'll have #{leftover_caps} caps and #{leftover_empties} for next time."}

  return bottles + bottle_calculator(0, leftover_caps, leftover_empties, total_free)
end

while true
  print "How many dollars will you spend on bottles? (Type 'QUIT' to exit): "
  input = gets.upcase.strip
  if input == 'QUIT'
    break
  elsif input.to_i.to_s != input
    puts "That's not a number."
  else
    input = input.to_i
    puts "You'll be able to get #{bottle_calculator(input)} total bottles."
    puts
  end
end
