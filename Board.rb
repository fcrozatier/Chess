class Board
  attr_reader :board
  
  def initialize
    @board = Array.new(8) { |i| Array.new(8) { |j| Cell.new((65+j).chr+(i+1).to_s)} }
  end

  def display
    board.reverse.each do |row|
      puts row.map { |cell| cell.name }.join(' | ').prepend(' '*10)
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

end