require_relative "self_describing_number_detector"

describe "Self Describing Numbers" do

  it "should print 0 for each input number that is not self-describing" do
    input_file = "self-describing-numbers/fixtures/no-self-describing-nums.txt"
    expected_output = "0\n0\n0\n0\n0\n0\n"
    expect do
      SelfDescribingNumberDetector.parse_file input_file
    end.to output(expected_output).to_stdout
  end

  it "should print 1 for each self-describing input number" do
    input_file = "self-describing-numbers/fixtures/all-self-describing-nums.txt"
    expected_output = "1\n1\n"
    expect do
      SelfDescribingNumberDetector.parse_file input_file
    end.to output(expected_output).to_stdout
  end

  it "handle input with various numbers" do
    input_file = "self-describing-numbers/fixtures/various-nums.txt"
    expected_output = "1\n0\n0\n1\n0\n1\n1\n0\n"
    expect do
      SelfDescribingNumberDetector.parse_file input_file
    end.to output(expected_output).to_stdout
  end

  xit "handle numbers surrounded with whitespace"
  xit "handle numbers longer than 10 characters"

  xit "ignores blank lines between number lines"
  xit "ignores blank lines at end of file"
  xit "ignores blank lines at start of file"
  xit "ignores blank file"

  xit "handle negatives"
  xit "handle decimals"
end
