class Bishop < Piece

  def possible_moves
    moves = []
    ["upleft", "upright", "downleft", "downright"].each do |prefix|
      moves += method(prefix).call(position)
        .take_while { |cell| cell.empty? }
        .select { |cell| cell.empty? || cell.piece.color != color }
    end
    moves
  end

end