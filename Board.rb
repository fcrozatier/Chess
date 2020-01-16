require_relative 'Table.rb'
require_relative 'Cell.rb'

class Board < Table
  
  def initialize(n = 8, m = 8)
    @cells = Array.new(n) { |i| Array.new(m) { |j| Cell.new((65+j).chr+(i+1).to_s)} }
  end

  def display
    puts ('-'*33).prepend(' '*12)
    cells.reverse.each_with_index do |row,i|
      puts row.map { |cell| cell.to_s }.join(' | ').+(' |').prepend(' '*10+"#{8-i} | ")
      puts ('-'*33).prepend(' '*12)
    end
    puts ('A'..'H').to_a.join('   ').prepend(' '*14)
    nil
  end

  def add(piece)
    x, y = piece.coordinates
    self.cells[y][x].piece = piece
  end

  def remove(piece)
    x, y = piece.coordinates
    self.cells[y][x].piece = nil
  end

end