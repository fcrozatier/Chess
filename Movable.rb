module Movable

  private

  def left
    row_number, col_number = coordinates
    Board.instance.board[row_number][0...col_number].reverse
  end

  def right
    row_number, col_number = coordinates
    Board.instance.board[row_number][col_number+1..]
  end

  def up
    row_number, col_number = coordinates
    Board.instance.board.map { |row| row[col_number] }[row_number+1..]
  end

  def down
    row_number, col_number = coordinates
    Board.instance.board.map { |row| row[col_number] }[0...row_number].reverse
  end

  def upright
    row_number, col_number = coordinates
    y_intercept = row_number - col_number
    Board.instance.board[row_number+1...8+y_intercept].map { |row| col_number += 1 ; row[col_number] }
  end

  def upleft
    row_number, col_number = coordinates
    y_intercept = row_number + col_number
    Board.instance.board[row_number+1..y_intercept].map { |row| col_number -= 1 ; row[col_number] }
  end

  def downright
    row_number, col_number = coordinates
    y_intercept = row_number + col_number
    start = [0, y_intercept-8].max
    Board.instance.board[start...row_number].reverse.map { |row| col_number += 1 ; row[col_number] }
  end

  def downleft
    row_number, col_number = coordinates
    y_intercept = row_number - col_number
    start = [0,0+y_intercept].max
    Board.instance.board[start...row_number].reverse.map { |row| col_number -= 1 ; row[col_number] }
  end

end