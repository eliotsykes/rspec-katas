require_relative 'min_max'

describe 'min_max(nums)' do

  it 'returns min & max as same value for single element nums array' do
    expect(min_max([25])).to match_array [25, 25]
  end

  it 'returns min and max as 1st and 2nd element' do
    nums = [17, 7, 876, 44, 42, 3]
    expect(min_max(nums)).to match_array [3, 876]
  end

  it 'treats negative numbers as less than zero' do
    nums = [0, -1, 0, 2, -23]
    expect(min_max(nums)).to match_array [-23, 2]
  end

end
