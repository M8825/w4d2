class Board
  def initialize
    @rows = Array.new(8) { Array.new(8) }
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
    # check iis it a valid move
     # move piece on that position
    # else WE DON't KNOW YET
    if 
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