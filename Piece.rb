require_relative 'Movable.rb'

class Piece
  include Movable
  attr_reader :board, :color, :symbol
  attr_accessor :position

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
    @position = position
    @symbol = @@symbol_correspondance[self.class.to_s][color].encode("utf-8")
  end

  def coordinates
    col_number = position[0].ord-65
    row_number = position[1].to_i-1
    [row_number, col_number]
  end


  def possible_moves
  end

end