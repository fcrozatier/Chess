class Cell 
  attr_reader :name, :piece

  def initialize(name)
    @name = name
    @piece = nil
  end

  def empty?
    piece.nil?
  end

end
