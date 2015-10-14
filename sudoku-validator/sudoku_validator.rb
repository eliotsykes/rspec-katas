module Sudoku

  def self.validate(grid)
    board = Board.new(grid)
    board.solved?
  end

  class Board

    VALID_CHUNK = (1..9).to_a.freeze

    attr_reader :grid

    def initialize(grid)
      @grid = grid
    end

    def solved?
      return false unless grid
      rows = grid
      columns = (0...grid.size).map do |column_index|
        rows.map { |row| row[column_index] }
      end
      rows.all? { |row| valid_chunk?(row) } && columns.all? { |col| valid_chunk?(col) }
    end

    private

    def valid_chunk?(chunk)
      VALID_CHUNK == chunk.sort
    end
  end

end
