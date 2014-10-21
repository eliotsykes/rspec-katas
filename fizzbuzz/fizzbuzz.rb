module FizzBuzz

  def self.play
    
    played_array = (1..100).map do |i|
      played_i = ""
      played_i = "Fizz" if divisible_by_3?(i)
      played_i += "Buzz" if divisible_by_5?(i)
      played_i = i if played_i.length == 0
      played_i
    end
    
    played_array.join(" ")
  end

  private

  def self.divisible_by_3?(num)
    num % 3 == 0
  end

  def self.divisible_by_5?(num)
    num % 5 == 0
  end

end
