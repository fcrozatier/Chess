class Piece
  attr_reader :color
  attr_writer :position, :manager

  def initialize(color, position, manager = nil)
    @manager = manager
    @color = color
    @position = Position.new(position)
    @unicode_symbol = Unicode.new(self.class.to_s, color)
    @legal_moves = []
    @moves = 0
    notify("Add piece to board") if manager
  end

  def possible_moves
    board = notify("Piece wants board")
    moves = []
    @legal_moves.each do |prefix|
      moves += board.method(prefix).call(x, y)
        .take_while { |cell| cell.empty? }
        .select { |cell| cell.empty? || cell.piece.color != color }
    end
    moves
  end

  def position
    @position.litteral_position
  end

  def update_position(new_position)
    notify("Remove piece")
    self.position = Position.new(new_position)
    notify("Add piece to board")
    @moves += 1
  end

  def coordinates
    [x, y]
  end

  def to_s
    @unicode_symbol.character
  end

  private

  def notify(msg)
    @manager.notify(self, msg)
  end

  def x
    @position.x
  end

  def y
    @position.y
  end

end
