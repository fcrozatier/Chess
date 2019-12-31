class Rook < Piece

  def initialize(color, position)
    super(color, position)
    @symbol = (color == :b) ? "\u2656".encode("utf-8") : "\u265C".encode("utf-8")
  end

end