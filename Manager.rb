class Manager
  attr_reader :board

  def initialize(board, white = nil, black = nil)
    @board = board
    @white = white
    @black = black
  end

  def under_check?(_sender)
    other_player(_sender).check?(_sender)
  end

  def other_player(_sender)
    _sender == @white ? @white : @black
  end

  def notify(_sender, event)
    case event
    when "Add piece to board"
      @board.add(_sender)
    when "Remove piece"
      @board.remove(_sender)
    when "Piece wants board"
      @board
    end
  end
end