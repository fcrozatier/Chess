class Pawn < Piece

  def initialize(color, position)
    super(color, position)
    @symbol = (color == :b) ? "\u2659".encode("utf-8") : "\u265F".encode("utf-8")
  end

end