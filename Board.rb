class Board
  attr_reader :cells
  
  def initialize
    @cells = Array.new(8) { |i| Array.new(8) { |j| Cell.new((65+j).chr+(i+1).to_s)} }
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
    x, y = piece.position
    self.cells[y][x].piece = piece
  end

end