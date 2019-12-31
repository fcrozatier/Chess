class King < Piece

  def initialize(color, position)
    super(color, position)
    @symbol = (color == :b) ? "\u2654".encode("utf-8") : "\u265A".encode("utf-8")
  end

end