class King < Piece

  def initialize(board, color, position)
    super(board, color, position)
    @legal_moves = ["left", "right", "up", "down","upleft", "upright", "downleft", "downright"]
  end

  def possible_moves
    moves = []
    @legal_moves.each do |prefix|
      moves += method(prefix).call.first(1)
        .select { |cell| cell.empty? || cell.piece.color != color }
    end
    moves
  end

end