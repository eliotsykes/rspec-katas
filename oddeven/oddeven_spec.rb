require_relative "oddeven"

RSpec.describe OddEven do

  describe ".print" do

    it "prints 100 items" do
      expect(OddEven.print.split(" ").length).to eq 100
    end

    it "prints the first 11 correctly" do

      odd = "Odd"
      even = "Even"

      expect(OddEven.print).to start_with([
        # 1  2  3   4     5  6     7  8     9    10    11
        odd, 2, 3,  even, 5, even, 7, even, odd, even, 11
      ].join(" "))
    end

    it "prints the last 12 correctly" do

      odd = "Odd"
      even = "Even"

      expect(OddEven.print).to end_with([
        # 89 and 97, the 24th and 25th prime numbers (multiple sources)
        #89 90    91   92    93   94    95   96    97  98    99   100
        89, even, odd, even, odd, even, odd, even, 97, even, odd, even
      ].join(" "))
    end

  end
  
end