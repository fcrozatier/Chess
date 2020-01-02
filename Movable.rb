module Movable

  def position_parser(position)
    col_number = position[0].ord-65
    row_number = position[1].to_i-1
    [row_number, col_number]
  end

  
end