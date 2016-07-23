
class BottlesCalculator

  def initialize(money)
    @money = money
    @total_bottles = @money / 2
    @caps = @total_bottles
    @empty_bottles = @total_bottles
  end

  def exchange_caps_and_empties
    bottles_from_caps = @caps / 4
    bottles_from_empties = @empty_bottles / 2

    @caps = @caps % 4
    @empty_bottles = @empty_bottles % 2

    free_bottles = bottles_from_caps + bottles_from_empties
    get_new_caps_and_bottles(free_bottles)

    @total_bottles += free_bottles
  end

  def get_new_caps_and_bottles(free_bottles)
    @caps += free_bottles
    @empty_bottles += free_bottles
  end

  def can_get_more?
    if @caps >= 4 || @empty_bottles >= 2 
      true
    else
      false
    end
  end

  def calculate
    begin
      exchange_caps_and_empties
    end while can_get_more?
    @total_bottles
  end

end

puts "How much money would you like to spend on bottles? : "
input = gets.strip.to_i
total_bottles = BottlesCalculator.new(input).calculate
puts "You can get #{total_bottles} total bottles with #{input} dollars."