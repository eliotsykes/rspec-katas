describe "roman_numeralizer.rb" do

  context "usage help" do

    EXPECTED_USAGE = "Usage: 'ruby roman-numerals/roman_numeralizer.rb NUMBER' where NUMBER is a positive integer\n"

    it "outputs instructions when no argument is given" do
      output = run_program
      expect(output).to eq EXPECTED_USAGE
    end

    it "outputs instructions when non-number argument given" do
      output = run_program("X")
      expect(output).to eq EXPECTED_USAGE
    end

    it "outputs instructions when --help option given" do
      output = run_program("--help")
      expect(output).to eq EXPECTED_USAGE
    end

    [0, -1, -200].each do |unhandled_number|
      it "outputs instructions when unhandled number '#{unhandled_number}' given" do
        output = run_program(unhandled_number)
        expect(output).to eq EXPECTED_USAGE
      end
    end

    it "outputs instructions when number exceeds maximum of 3000" do
      output = run_program(3001)
      expect(output).to eq EXPECTED_USAGE
    end
  end

  context "with number argument", focus: true do

    EXPECTED_CONVERSIONS = {
      1  => "I",
      2  => "II",
      3  => "III",
      4  => "IV",
      5  => "V",
      6  => "VI",
      7  => "VII",
      8  => "VIII",
      9  => "IX",
      10 => "X",
      11 => "XI",
      13 => "XIII",
      14 => "XIV",
      15 => "XV",
      17 => "XVII",
      19 => "XIX",
      20 => "XX"
    }

    EXPECTED_CONVERSIONS.each do |number_to_convert, in_numerals|

      it "prints conversion for '#{number_to_convert}' to '#{in_numerals}'" do
        output = run_program(number_to_convert)
        expect(output).to eq("#{number_to_convert} -> #{in_numerals}\n")
      end

    end
  end

  private

  def run_program(arg=nil)
    `ruby roman-numerals/roman_numeralizer.rb #{arg}`
  end

  
end