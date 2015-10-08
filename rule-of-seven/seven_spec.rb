require_relative 'seven'

describe 'seven' do

  it 'calculates result for 1 step calculation' do
    expect(seven(371)).to eq [35, 1]
  end

  it 'calculates result for 2 step calculation' do
    expect(seven(1603)).to eq [7, 2]
  end

  it 'calculates result for 7 step calculation' do
    expect(seven(477557101)).to eq [28, 7]
  end
end
