require 'matrix'
class Sudoku

  def initialize(grid)
    @grid = grid
  end

  def is_valid
    Board.new(@grid).solved?
  rescue ArgumentError
    false
  end

  class Board

    attr_reader :grid, :block_size

    def initialize(grid)
      assert_dimensions(grid)
      @grid = grid
      @valid_chunk = (1..grid.size).to_a.freeze
      @block_size = Math.sqrt(grid.size).to_i.freeze
    end

    def solved?
      rows = grid
      columns = grid.transpose
      blocks = build_blocks(grid)

      (rows + columns + blocks).all? { |chunk| valid_chunk?(chunk) }
    end

    private

    def assert_dimensions(grid)
      if !square?(grid)
        raise ArgumentError, "Cannot handle grid argument: '#{grid.inspect}'"
      end
    end

    def square?(grid)
      grid && grid.size == grid.first.size
    end

    def build_blocks(grid)
      matrix = Matrix.rows(grid)
      num_blocks = grid.size
      blocks = []

      (0...num_blocks).step(block_size).each do |start_row|
        (0...num_blocks).step(block_size).each do |start_col|
          num_rows = num_cols = block_size
          blocks << matrix.minor(start_row, num_rows, start_col, num_cols).to_a.flatten
        end
      end
      blocks
    end

    def build_blocks_without_matrix(grid)
      num_blocks = grid.size
      blocks_per_row = blocks_per_col = grid.size / block_size

      blocks = (0...num_blocks).map do |block_index|
        block = []
        row_offset = (block_index / blocks_per_row) * block_size
        col_offset = (block_index % blocks_per_col) * block_size

        (0...block_size).each do |row_index|
          (0...block_size).each do |col_index|
            row = row_index+row_offset
            col = col_index+col_offset
            block << grid[row][col]
          end
        end

        block
      end

      blocks
    end

    def valid_chunk?(chunk)
      @valid_chunk == chunk.sort
    end
  end

end
