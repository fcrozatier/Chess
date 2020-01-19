class Rook < Piece

  def initialize(color, position, manager)
    super(color, position, manager)
    @legal_moves = ["left", "right", "up", "down"]
  end

  def update_position(new_position)
    super(new_position)
    @moves += 1
  end

end