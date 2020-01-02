require 'singleton'

class Board
  include Singleton
  attr_reader :board
  
  def initialize
    @board = Array.new(8) { |i| Array.new(8) { |j| Cell.new((65+j).chr+(i+1).to_s)} }
  end

  def display
    puts ('-'*33).prepend(' '*12)
    board.reverse.each_with_index do |row,i|
      puts row.map { |cell| cell.to_s }.join(' | ').+(' |').prepend(' '*10+"#{8-i} | ")
      puts ('-'*33).prepend(' '*12)
    end
    puts ('A'..'H').to_a.join('   ').prepend(' '*14)
    nil
  end

  def left(position)
    row_number, col_number = position_parser(position)
    board[row_number][0...col_number].reverse
  end

  def right(position)
    row_number, col_number = position_parser(position)
    board[row_number][col_number+1..]
  end

  def up(position)
    row_number, col_number = position_parser(position)
    board.map { |row| row[col_number] }[row_number+1..]
  end

  def down(position)
    row_number, col_number = position_parser(position)
    board.map { |row| row[col_number] }[0...row_number].reverse
  end

  def add(piece)
    row_number, col_number = position_parser(piece.position)
    self.board[row_number][col_number].piece = piece
  end

  def position_parser(position)
    col_number = position[0].ord-65
    row_number = position[1].to_i-1
    [row_number, col_number]
  end

end