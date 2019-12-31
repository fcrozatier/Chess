class Piece
  attr_reader :color, :symbol
  attr_accessor :position

  def initialize(color, position)
    @color = color
    @position = position
    @symbol = ""
  end

end