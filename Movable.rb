module Movable

  private

  def left
    board.cells[y][0...x].reverse
  end

  def right
    board.cells[y][x+1..]
  end

  def up
    board.cells[y+1..].map { |row| row[x] }
  end

  def down
    board.cells[0...y].reverse.map { |row| row[x] }
  end

  def upright
    x_coord, y_coord = x, y
    y_intercept = y_coord - x_coord
    board.cells[y_coord+1..7+y_intercept].map { |row| x_coord += 1 ; row[x_coord] }
  end

  def upleft
    x_coord, y_coord = x, y
    y_intercept = y_coord + x_coord
    board.cells[y_coord+1..y_intercept].map { |row| x_coord -= 1 ; row[x_coord] }
  end

  def downright
    x_coord, y_coord = x, y
    y_intercept = y_coord + x_coord
    start = [0, y_intercept-7].max
    board.cells[start...y_coord].reverse.map { |row| x_coord += 1 ; row[x_coord] }
  end

  def downleft
    x_coord, y_coord = x, y
    y_intercept = y_coord - x_coord
    start = [0,0+y_intercept].max
    board.cells[start...y_coord].reverse.map { |row| x_coord -= 1 ; row[x_coord] }
  end

end