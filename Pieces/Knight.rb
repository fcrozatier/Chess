class Knight < Piece

  def initialize(color, position, manager)
    super(color, position, manager)
    @legal_moves = [[2,1],[2,-1],[1,2],[1,-2],[-1,2],[-1,-2],[-2,1],[-2,-1]] 
  end

  def possible_moves
    board = @manager.notify(self, "Board")
    moves = []
    @legal_moves.each do |move|
      new_position = translate(position, move)
      if onboard?(new_position)
        new_x, new_y = new_position
        new_cell = board.cells[new_y][new_x]
        if new_cell.empty? || new_cell.piece.color != color
          moves << new_cell 
        end
      end
    end
    moves
  end

  private

  def translate(position, vector)
    [x+vector[0],y+vector[1]]
  end

  def onboard?(position)
    0 <= position[0] && position[0] <= 7 && 0 <= position[1] && position[1] <= 7
  end

end