class Rook < Piece

  def possible_moves
    moves = []
    ["left", "right", "up", "down"].each do |prefix|
      moves += method(prefix).call
        .take_while { |cell| cell.empty? }
        .select { |cell| cell.empty? || cell.piece.color != color }
    end
    moves
  end

end