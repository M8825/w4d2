require 'colorize'
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
    row, col = end_pos
    if self[start_pos].is_a?(NullPiece)
      raise "Start position position has no piece"
    elsif row < 0 || row > 7 || col < 0 || col > 7  # row and col indexes are within board boundaries 
      raise "End position invalid"
    end

    piece = self[start_pos]
    self[start_pos] = NullPiece.new(start_pos)
    self[end_pos] = piece
  end

  # That's for future
  def print
    puts
    @rows.each_with_index do |row, i|
      puts "#{i} #{row.map {|ele| ele.is_a?(NullPiece) ? 'Null' : "Piec".blue }.join(' ')}"
    end
    puts
    ''
  end

end