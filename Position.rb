class Position
  attr_reader :position, :x, :y
    
  def initialize(position)
    @position = position
    @x = position[0].ord-65
    @y = position[1].to_i-1
  end

end