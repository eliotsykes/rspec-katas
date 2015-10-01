require_relative 'diagonal_sum'

describe 'diagonal_sum(matrix)' do

  it 'should return 0 for a 0x0 matrix' do
    empty_array = []
    expect(diagonal_sum(empty_array)).to eq 0
  end

  it 'should sum the diagonal for a 1x1 matrix' do
    matrix = [[100]]
    expect(diagonal_sum(matrix)).to eq 100
  end

  it 'should sum the diagonal for a 2x2 matrix' do
    matrix = [
      [12, 27],
      [3,  99]
    ]
    expect(diagonal_sum(matrix)).to eq 111
  end

  it 'should sum the diagonal for a 3x3 matrix' do
    matrix = [
      [1, 0, 0],
      [0, 5, 0],
      [0, 0, 9]
    ]
    expect(diagonal_sum(matrix)).to eq 15
  end

  it 'should raise error for nil' do
    expect { diagonal_sum(nil) }.to raise_error ArgumentError
  end

  it 'should raise error for non-square matrix' do
    matrix_with_1_row_0_col = [[]]
    expect { diagonal_sum(matrix_with_1_row_0_col) }.to raise_error ArgumentError
  end

end
