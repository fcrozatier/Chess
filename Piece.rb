require_relative 'Movable.rb'

class Piece
  include Movable
  attr_reader :board, :color, :symbol

  @@symbol_correspondance = { 
    "Bishop" => {b: "\u2657", w: "\u265D"},
    "King" => {b: "\u2654", w: "\u265A"},
    "Knight" => {b: "\u2658", w: "\u265E"},
    "Pawn" => {b: "\u2659", w: "\u265F"},
    "Queen" => {b: "\u2655" , w: "\u265B"},
    "Rook" => {b: "\u2656", w: "\u265C"},
  }

  def initialize(board, color, position)
    @board = board
    @color = color
    @position = Position.new(position)
    @symbol = @@symbol_correspondance[self.class.to_s][color].encode("utf-8")
    @legal_moves = []
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

  private

  def x
    @position.col_number
  end

  def y
    @position.row_number
  end

end