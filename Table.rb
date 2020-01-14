class Table
  attr_reader :cells

  def initialize(n, m)
    @cells = Array.new(n) { |i| Array.new(m) { |j| block_given? ? yield : nil } }
  end

  def left(x,y)
    cells[y][0...x].reverse
  end

  def right(x,y)
    cells[y][x+1..]
  end

  def up(x,y)
    cells[y+1..].map { |row| row[x] }
  end

  def down(x,y)
    cells[0...y].reverse.map { |row| row[x] }
  end

  def upright(x,y)
    y_intercept = y - x
    cells[y+1..7+y_intercept].map { |row| x += 1 ; row[x] }
  end

  def upleft(x,y)
    y_intercept = y + x
    cells[y+1..y_intercept].map { |row| x -= 1 ; row[x] }
  end

  def downright(x,y)
    y_intercept = y + x
    start = [0, y_intercept-7].max
    cells[start...y].reverse.map { |row| x += 1 ; row[x] }
  end

  def downleft(x,y)
    y_intercept = y - x
    start = [0,0+y_intercept].max
    cells[start...y].reverse.map { |row| x -= 1 ; row[x] }
  end

end