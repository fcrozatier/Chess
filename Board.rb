class Board
  attr_reader :board
  attr_accessor :active_pieces
  
  def initialize
    @board = Array.new(8) { |i| Array.new(8) { |j| Cell.new((65+j).chr+(i+1).to_s)} }
    @active_pieces = []
  end

  def display
    board.reverse.each do |row|
      puts row.map { |cell| cell.to_s }.join(' | ').prepend(' '*10)
      puts ('-'*35).prepend(' '*10)
    end
    nil
  end

  def row(row_number)
    board[row_number-1]
  end

  def column(col_letter)
    col_number = col_letter.ord-65
    board.map { |row| row[col_number] }
  end

  def add(piece)
    self.active_pieces << piece
    row_number, col_number = position_parser(piece.position)
    self.board[row_number][col_number].piece = piece
  end

  def position_parser(position)
    col_number = position[0].ord-65
    row_number = position[1].to_i-1
    [row_number, col_number]
  end

end