class Unicode
  attr_reader :character

  @@correspondance = { 
    "Bishop" => {black: "\u2657", white: "\u265D"},
    "King" => {black: "\u2654", white: "\u265A"},
    "Knight" => {black: "\u2658", white: "\u265E"},
    "Pawn" => {black: "\u2659", white: "\u265F"},
    "Queen" => {black: "\u2655" , white: "\u265B"},
    "Rook" => {black: "\u2656", white: "\u265C"},
  }

  def initialize(class_name, color)
    @character = @@correspondance[class_name][color].encode("utf-8")
  end

end