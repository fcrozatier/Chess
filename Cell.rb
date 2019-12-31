class Cell 
  attr_reader :name
  attr_accessor :piece

  def initialize(name)
    @name = name
    @piece = nil
  end

  def empty?
    piece.nil?
  end

  def to_s
    emtpy? ? name : piece.symbol
  end

end
