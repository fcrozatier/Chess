class Knight < Piece

  def initialize(color, position)
    super(color, position)
    @symbol = (color == :b) ? "\u2658".encode("utf-8") : "\u265E".encode("utf-8")
  end

end