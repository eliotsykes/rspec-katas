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


RSpec.describe FizzBuzz do

  describe "#play" do

    it "prints up to 15 correctly" do

      div_by_3 = "Fizz"
      div_by_5 = "Buzz"
      div_by_3_5 = "FizzBuzz"

      expect(FizzBuzz.play).to start_with([
        1, 2, div_by_3, 4, div_by_5,
        div_by_3, 7, 8, div_by_3, div_by_5,
        11, div_by_3, 13, 14, div_by_3_5
      ].join(" "))
    end

    it "prints 100 entries" do
      expect(FizzBuzz.play.split(" ").length).to eq 100
    end

  end
  
end
