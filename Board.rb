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

  def add(piece)
    row_number, col_number = piece.coordinates
    self.board[row_number][col_number].piece = piece
  end

end