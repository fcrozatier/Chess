class Pawn < Piece

  def initialize(board, color, position)
    super(board, color, position)
    @legal_moves = (color == :w) ? "up" : "down"
    @moves = 0
  end

  def possible_moves
    moves = []
    return moves if y == 7 || y == 0  

    c = (@legal_moves == "up") ? 1 : -1
    next_row = board.cells[y+c] 
    next_cell = next_row[x]
    sides = []
    sides << next_row[x-1] if x-1 >= 0
    sides << next_row[x+1] if x+1 <= 7 
    
    if next_cell.empty?
      moves << next_cell 
      if @moves == 0
        next_next_cell = board.cells[y+2*c][x]
        moves << next_next_cell if next_next_cell.empty?
      end
    end
    
    sides.each do |side|
      if !side.empty? && side.piece.color != color
        moves << side
      end
    end
    moves
  end

end