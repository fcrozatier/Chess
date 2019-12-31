class Bishop < Piece

  def initialize(color, position)
    super(color, position)
    @symbol = (color == :b) ? "\u2657".encode("utf-8") : "\u265D".encode("utf-8")
  end

end