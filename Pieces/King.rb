class King < Piece

  def initialize(color, position)
    super(color, position)
  end

  def possible_moves
    board = Board.instance
    moves = []
    ["left", "right", "up", "down","upleft", "upright", "downleft", "downright"].each do |prefix|
      moves += board.method(prefix).call(position).first(1)
        .select { |cell| cell.empty? || cell.piece.color != color }
    end
    moves
  end

end