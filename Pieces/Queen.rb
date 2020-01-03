class Queen < Piece

  def initialize(board, color, position)
    super(board, color, position)
    @legal_moves = ["left", "right", "up", "down","upleft", "upright", "downleft", "downright"]
  end

end