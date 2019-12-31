class Queen < Piece

  def initialize(color, position)
    super(color, position)
    @symbol = (color == :b) ? "\u2655".encode("utf-8") : "\u265B".encode("utf-8")
  end

end