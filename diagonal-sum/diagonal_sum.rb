def diagonal_sum(matrix)
  assert_square_matrix(matrix)
  sum = 0
  matrix.each_with_index { |row, index| sum += row[index] }
  sum
end

def assert_square_matrix(matrix)
  is_square = false
  if matrix
    row_count = matrix.size
    is_square = matrix.all? do |row|
      column_count = row.size
      row_count == column_count
    end
  end
  raise ArgumentError, "Should be a square matrix '#{matrix.inspect}'" unless is_square
end
