require_relative 'Movable.rb'

class Piece
  include Movable
  attr_reader :board, :color

  def initialize(board, color, position)
    @board = board
    @color = color
    @position = Position.new(position)
    @unicode_symbol = Unicode.new(self.class.to_s, color)
    @legal_moves = []
    @moves = 0
  end

  def possible_moves
    moves = []
    @legal_moves.each do |prefix|
      moves += method(prefix).call
        .take_while { |cell| cell.empty? }
        .select { |cell| cell.empty? || cell.piece.color != color }
    end
    moves
  end

  def position
    [x, y]
  end

  def symbol
    @unicode_symbol.character
  end

  private

  def x
    @position.col_number
  end

  def y
    @position.row_number
  end

end
