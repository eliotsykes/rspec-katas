require_relative 'pitch_class'

describe 'pitch_class(pitch_class)' do

  it 'converts natural notes' do
    expect_conversion 'C', 0
    expect_conversion 'D', 2
    expect_conversion 'E', 4
    expect_conversion 'F', 5
    expect_conversion 'G', 7
    expect_conversion 'A', 9
    expect_conversion 'B', 11
  end

  it 'converts sharps' do
    expect_conversion 'C#', 1
    expect_conversion 'D#', 3
    expect_conversion 'E#', 5
    expect_conversion 'F#', 6
    expect_conversion 'G#', 8
    expect_conversion 'A#', 10
    expect_conversion 'B#', 0
  end

  it 'converts flats' do

    expect_conversion 'Db', 1
    expect_conversion 'Eb', 3
    expect_conversion 'Fb', 4
    expect_conversion 'Gb', 6
    expect_conversion 'Ab', 8
    expect_conversion 'Bb', 10
    expect_conversion 'Cb', 11
  end

  private

  def expect_conversion(from, expected)
    actual = pitch_class(from)
    expect(actual).to(eq(expected), "Should have converted '#{from}' to #{expected}, got: #{actual.inspect}")
  end

end
