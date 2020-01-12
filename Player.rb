class Player
  attr_reader :king
  attr_accessor :manager
  
  def initialize(board, color, manager = nil)
    @board = board
    @color = color
    @check = false
    @active_pieces = []
    #initialize_pieces
    @manager = manager
  end

  def possible_moves
    @active_pieces.map(&:possible_moves).flatten
  end

  def plays(initial, final)
    if valid_position(initial) && valid_position(final)
      initial_position = Position.new(initial)
      initial_cell = @board.cells[initial_position.y][initial_position.x]
      if initial_cell.empty?
        puts "You must choose a non empty initial cell"
      elsif initial_cell.piece.color != @color
        puts "You cannot move #{initial_cell.piece.color} pieces"
      else
        if initial_cell.piece.possible_moves.map(&:name).include?(final)
          if updatable?(initial, final)

          else
            puts "This move would leave you under check"
          end
        else
          puts "#{initial} cannot go to #{final}"
        end
      end
    else
      puts "Valid cells are of the form [A-H][1-8]"
    end
  end

  def updatable?(initial, final)
    virtual_board = Marshal.load(Marshal.dump(@board))
    initial_position = Position.new(initial)
    piece = virtual_board.cells[initial_position.y][initial_position.x]
    virtual_board.update(piece, final)
    under_check?
  end

  def check?(other)
    king = other.king
    possible_moves.map(&:name).include?(king.position)
  end

  def under_check?
    @manager.under_check?(self)
  end

  def add(piece)
    @active_pieces << piece
  end

  private

  def valid_position(position)
    position.match?(/^[A-H][1-8]$/)
  end

  def initialize_pieces
    y = (@color == :white) ? 1 : 8
    
    8.times do |i|
      @active_pieces << Pawn.new(@board, @color, (65+i).chr+"2") if @color == :white
      @active_pieces << Pawn.new(@board, @color, (65+i).chr+"7") if @color == :black
    end
    [Rook, Knight, Bishop].each_with_index do |class_name, j|
      2.times do |i|
        @active_pieces << class_name.new(@board, @color, (65+j+(7-2*j)*i).chr+"#{y}")
      end
    end
    @active_pieces << Queen.new(@board, @color, "D#{y}")
    king = King.new(@board, @color, "E#{y}")
    @active_pieces << king
    @king = king
  end

end