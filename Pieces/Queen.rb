class Queen < Piece

  def initialize(color, position)
    super(color, position)
  end

  def possible_moves
    board = Board.instance
    moves = []
    ["left", "right", "up", "down","upleft", "upright", "downleft", "downright"].each do |prefix|
      moves += board.method(prefix).call(position)
        .take_while { |cell| cell.empty? }
        .select { |cell| cell.empty? || cell.piece.color != color }
    end
    moves
  end

end