def count_letters(string)
  letter_counts = Hash.new(0)
  string.strip.split("").each{ |char| letter_counts[char] += 1 unless char == " "}
  letter_counts
end

p count_letters("This is a string iwth some pacaes ljasd i can't spell")

def count_indices(string)
  letter_indices = Hash.new(Array.new)
  string.strip.split("").each_with_index{ |char, i| letter_indices[char] += [i] unless char == " "}
  letter_indices
end

p count_indices("This is a string iwth some pacaes ljasd i can't spell")
