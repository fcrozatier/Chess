class Rook < Piece

  def initialize(color, position, manager)
    super(color, position, manager)
    @legal_moves = ["left", "right", "up", "down"]
  end

end