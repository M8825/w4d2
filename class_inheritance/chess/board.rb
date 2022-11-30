require_relative "piece"
require_relative 'null_piece'

class Board

  def self.set_pieces(grid)
    piece_rows = [0,1,6,7]

    grid.each.with_index do |row, i|
      if piece_rows.include?(i) 
        grid[i] = row.map.with_index {|square, j| square = Piece.new([i,j]) }
      else
        grid[i] = row.map.with_index {|square, j| square = NullPiece.new([i, j]) }
      end
    end

  end

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    Board.set_pieces(@rows)
  end


  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise "Start position position has no piece"
    end

    row, col = end_pos
    # One of the cases, but we know that it will change in the future
    if row < 0 || row > 7 || col < 0 || col > 7
      raise "End position invalid"
    end
  end

  # That's for future
  def print
    arr1 = (1..8).to_a
    arr2 = ('a'..'h').to_a

    arr1.each_with_index do |num, i|
      arr2.each_with_index do |char, j|
        @rows[i][j] = (char + num.to_s).to_sym
      end
    end
  end
end