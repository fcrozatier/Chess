class Player
  attr_reader :king, :color
  attr_accessor :manager, :active_pieces
  
  def initialize(color, manager = nil)
    @color = color
    @active_pieces = []
    @manager = manager
    initialize_pieces
  end

  def possible_moves
    @active_pieces.map(&:possible_moves).flatten
  end

  def plays(initial, final)
    board = notify("Player wants board")
    initial_position = Position.new(initial)
    final_position = Position.new(final)
    initial_cell = board.cells[initial_position.y][initial_position.x]
    final_cell = board.cells[final_position.y][final_position.x]
    
    if valid_initial_cell?(initial_cell)
      if initial_cell.piece.possible_moves.map(&:name).include?(final)
        captured_piece = capture_logic(final_cell)
        initial_cell.piece.update_position(final)
        if under_check?
          puts "This move would leave you under check"
          final_cell.piece.update_position(initial)
          notify("Undo capture", captured_piece)
        else
          return true
        end
      else
        puts "#{initial} cannot go to #{final}"
      end
    end
    false
  end

  def under_check?
    notify("Is Player under check?")
  end

  private

  def notify(msg, arg = nil)
    @manager.notify(self, msg, arg)
  end

  def valid_initial_cell?(initial_cell)
    if initial_cell.empty?
      puts "You must choose a non empty initial cell"
    elsif initial_cell.piece.color != @color
      puts "You cannot move #{initial_cell.piece.color} pieces"
    else
      true
    end
  end

  def capture_logic(cell)
    piece = cell.piece
    unless cell.empty?
      if piece.color != @color
        notify("Player captures", piece)
      end
    end
    piece
  end

  def initialize_pieces
    y = (@color == :white) ? 1 : 8
    
    8.times do |i|
      @active_pieces << Pawn.new(@color, (65+i).chr+"2", @manager) if @color == :white
      @active_pieces << Pawn.new(@color, (65+i).chr+"7", @manager) if @color == :black
    end
    [Rook, Knight, Bishop].each_with_index do |class_name, j|
      2.times do |i|
        @active_pieces << class_name.new(@color, (65+j+(7-2*j)*i).chr+"#{y}", @manager)
      end
    end
    @active_pieces << Queen.new(@color, "D#{y}", @manager)
    king = King.new(@color, "E#{y}", @manager)
    @active_pieces << king
    @king = king
  end

end