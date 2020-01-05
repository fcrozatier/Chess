class Player
  
  def initialize(board, color)
    @board = board
    @color = color
    @active_pieces = initialize_pieces
  end

  def possible_moves
    @active_pieces.map(&:possible_moves).flatten
  end

  private

  def initialize_pieces
    active_pieces = []
    y = (@color == :w) ? 1 : 8
    
    8.times do |i|
      active_pieces << Pawn.new(@board, @color, (65+i).chr+"2") if @color == :w
      active_pieces << Pawn.new(@board, @color, (65+i).chr+"7") if @color == :b
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