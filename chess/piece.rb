class Piece 

  attr_reader :pos

  def initialize(pos)
    @pos = pos
  end

  def inspect
    @pos
  end

end