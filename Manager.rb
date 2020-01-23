class Manager
  attr_reader :board
  attr_accessor :playing

  def initialize(board)
    @board = board
    @players = [Player.new(:white, self), Player.new(:black, self)]
    @playing = @players[0]
  end

  def other_player(_sender)
    index = @players.index(_sender)
    @players[index-1]
  end

  def notify(_sender, event, arg = nil)
    case event
    when "Add piece to board"
      @board.add(_sender)
    when "Remove piece"
      @board.remove(_sender)
    when "Piece wants board"
      @board
    when "Player wants board"
      @board
    when "Player captures"
      other_player(_sender).active_pieces.delete(arg)
    when "Undo capture"
      if arg
        @board.add(arg)
        other_player(_sender).active_pieces << arg
      end
    when "Is Player under check?"
      other_player(_sender).possible_moves.map(&:name).include?(_sender.king.position)
    end
  end

  def white
    @players[0]
  end

  def black
    @players[1]
  end

end