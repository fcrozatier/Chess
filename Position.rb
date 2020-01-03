class Position
  attr_reader :col_number, :row_number
  attr_accessor :position
  
  def initialize(position)
    @position = position
    @col_number = position[0].ord-65
    @row_number = position[1].to_i-1
  end

end