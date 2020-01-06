class Player
  
  def initialize(board, color)
    @board = board
    @color = color
    @active_pieces = initialize_pieces
    @check = false
  end

  def possible_moves
    @active_pieces.map(&:possible_moves).flatten
  end

  def plays(initial, final)
    if valid_position(initial) && valid_position(final)
      initial = Position.new(initial)
      initial_cell = @board.cells[initial.y][initial.x]
      if initial_cell.empty?
        puts "You must choose a non empty initial cell"
      elsif initial_cell.piece.color != @color
        puts "You cannot move #{initial_cell.piece.color} pieces"
      else
        if initial_cell.piece.possible_moves.map(&:name).include?(final)
          puts "UPDATING POSITION..."
        else
          puts "#{initial.position} cannot go to #{final} "
        end
      end
    else
      puts "Valid cells are of the form [A-H][1-8]"
    end
  end


  private

  def valid_position(position)
    position.match?(/^[A-H][1-8]$/)
  end

  def initialize_pieces
    active_pieces = []
    y = (@color == :white) ? 1 : 8
    
    8.times do |i|
      active_pieces << Pawn.new(@board, @color, (65+i).chr+"2") if @color == :white
      active_pieces << Pawn.new(@board, @color, (65+i).chr+"7") if @color == :black
    end
    [Rook, Knight, Bishop].each_with_index do |class_name, j|
      2.times do |i|
        active_pieces << class_name.new(@board, @color, (65+j+(7-2*j)*i).chr+"#{y}")
      end
    end
    active_pieces << Queen.new(@board, @color, "D#{y}")
    active_pieces << King.new(@board, @color, "E#{y}")

    active_pieces.each { |piece| @board.add(piece) }
  end

end