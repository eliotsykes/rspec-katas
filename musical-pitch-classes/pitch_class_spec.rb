require_relative 'pitch_class'

describe 'pitch_class(pitch_class)' do

  it 'performs expected conversions on natural notes' do
    expect_conversion 'C', 0
    expect_conversion 'D', 2
    expect_conversion 'E', 4
    expect_conversion 'F', 5
    expect_conversion 'G', 7
    expect_conversion 'A', 9
    expect_conversion 'B', 11
  end

  private

  def expect_conversion(from, expected)
    expect(pitch_class(from)).to(eq(expected), "Should have converted '#{from}' to #{expected}")
  end

end
