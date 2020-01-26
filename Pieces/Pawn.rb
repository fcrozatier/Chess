class Pawn < Piece

  def initialize(color, position, manager)
    super(color, position, manager)
    @legal_moves = (color == :white) ? "up" : "down"
  end

  def possible_moves
    board = @manager.notify(self, "Piece wants board")
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

  def update_position(new_position)
    super(new_position)
    if new_position[1].to_i == 1 || new_position[1].to_i == 8
      promotion
    end
  end

  def promotion
    puts "Choose your promotion : [Q]ueen, [R]ook, [B]ishop or [K]night ?"
    choice = ""
    loop do
      choice = gets.chomp
      break if valid_promotion?(choice)
      puts "You must choose between [Q]ueen, [R]ook, [B]ishop or [K]night"
    end
    self.notify("Remove piece")
    @manager.method(color).call.active_pieces.delete(self)
    piece = nil
    case choice
    when 'Q'
      piece = Queen.new(color, position, @manager)
    when 'R'
      piece = Rook.new(color, position, @manager)
    when 'B'
      piece = Bishop.new(color, position, @manager)
    when 'K'
      piece = Knight.new(color, position, @manager)
    end
    piece.notify("Add piece to board")
    @manager.method(color).call.active_pieces << piece
  end

  def valid_promotion?(choice)
    choice.match?(/Q|R|B|K/)
  end

end