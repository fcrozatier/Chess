class Cell 
  attr_reader :name
  attr_accessor :piece

  def initialize(name, piece = nil)
    @name = name
    @piece = piece
  end

  def empty?
    piece.nil?
  end

  def to_s
    empty? ? ' ' : piece.to_s
  end

end
