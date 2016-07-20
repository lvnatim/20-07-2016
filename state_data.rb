@states = {
  OR: {name: 'Oregon', cities: ['Oregon City', 'Pendleton']},
  FL: {name: 'Florida', cities: ['Miami', 'Fort Lauderdale', 'Joeville']},
  CA: {name: 'California', cities: ['Los Angeles', 'Sacramento']},
  NY: {name: 'New York', cities: ['New York', 'Kingston']},
  MI: {name: 'Michigan', cities: ['Detroit', 'Flint']},
  WA: {name: 'Washington', cities: ['Seattle', 'Everett', 'Dirk']},
  TX: {name: 'Texas', cities: ['Austin', 'Texas']}
}

@taxes = {
  OR: 1.0,
  FL: 1.5,
  CA: 2.0,
  NY: 2.5,
  MI: 3.0,
  WA: 4.5,
  TX: 5.5
}

def describe_state(string)
  if string == nil || string.length != 2
    return "#{string} is not a valid code."
  else
    sym = string.to_sym
  end

  unless @states[sym]
    return 'State not found.'
  else
    state_name = @states[sym][:name]
    number_major_cities = @states[sym][:cities].length
    major_cities_string = @states[sym][:cities].join(", ")
    return "#{string} is for #{state_name}. It has #{number_major_cities} major cities: #{major_cities_string}."
  end
end

def calculate_tax(string, amount)
  if string == nil || string.length != 2
    return 'Not a valid code.'
  else
    sym = string.to_sym
  end

  unless @states[sym]
    return 'State not found.'
  else
    return (((100 + @taxes[sym])/100) * amount) if amount.is_a? Integer
  end
end

def find_state_for_city(string)
  string = string.strip.downcase
  @states.each { |key, value| puts @states[key][:name] if value[:cities].map(&:downcase).include?(string) }
end

def test(string, amount=nil)
  puts describe_state(string)
  puts calculate_tax(string, amount) if amount
end

test('OR')
test("")
test(nil)
test("JS")
test("aosdfjasljfals")
test('TX', 200)
find_state_for_city('sacramento')
find_state_for_city("new york    ")
