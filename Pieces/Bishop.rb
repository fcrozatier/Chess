class Bishop < Piece

  def initialize(color, position, manager)
    super(color, position, manager)
    @legal_moves = ["upleft", "upright", "downleft", "downright"]
  end

end