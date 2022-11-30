require_relative 'piece'

class NullPiece < Piece
 
  def initialize(pos)
    super
  end

  def inspect
    'Null'
  end
end