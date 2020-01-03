class Piece
  attr_reader :color, :symbol
  attr_accessor :position

  @@symbol_correspondance = { 
    "Bishop" => {b: "\u2657", w: "\u265D"},
    "King" => {b: "\u2654", w: "\u265A"},
    "Knight" => {b: "\u2658", w: "\u265E"},
    "Pawn" => {b: "\u2659", w: "\u265F"},
    "Queen" => {b: "\u2655" , w: "\u265B"},
    "Rook" => {b: "\u2656", w: "\u265C"},
  }

  def initialize(color, position)
    @color = color
    @position = position
    @symbol = @@symbol_correspondance[self.class.to_s][color].encode("utf-8")
  end

  def possible_moves
  end

end