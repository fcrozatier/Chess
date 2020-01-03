class Bishop < Piece

  def initialize(board, color, position)
    super(board, color, position)
    @legal_moves = ["upleft", "upright", "downleft", "downright"]
  end

end