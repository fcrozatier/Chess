require_relative 'Movable.rb'

class Piece
  include Movable
  attr_reader :color
  attr_writer :position

  def initialize(board, color, position)
    @board = board
    @color = color
    @position = Position.new(position)
    @unicode_symbol = Unicode.new(self.class.to_s, color)
    @legal_moves = []
    @moves = 0
    @board.add(self)
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
    @position.litteral_position
  end

  def coordinates
    [x, y]
  end

  def symbol
    @unicode_symbol.character
  end

  private

  def x
    @position.x
  end

  def y
    @position.y
  end

end
