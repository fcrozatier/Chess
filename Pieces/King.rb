class King < Piece

  def initialize(color, position, manager)
    super(color, position, manager)
    @legal_moves = ["left", "right", "up", "down","upleft", "upright", "downleft", "downright"]
  end

  def possible_moves
    board = @manager.notify(self, "Piece wants board")
    moves = []
    @legal_moves.each do |prefix|
      moves += board.method(prefix).call(x, y).first(1)
        .select { |cell| cell.empty? || cell.piece.color != color }
    end
    moves
  end

  def update_position(new_position)
    super(new_position)
    @moves += 1
  end

end