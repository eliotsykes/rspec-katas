require_relative "fizzbuzz"

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

    it "prints the last 11 correctly" do

      div_by_3 = "Fizz"
      div_by_5 = "Buzz"
      div_by_3_5 = "FizzBuzz"

      expect(FizzBuzz.play).to end_with([
        div_by_3_5, 91, 92, div_by_3, 94,
        div_by_5, div_by_3, 97, 98, div_by_3,
        div_by_5
      ].join(" "))
    end

  end
  
end
