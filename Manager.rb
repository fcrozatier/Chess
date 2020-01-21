class Manager
  attr_reader :board

  def initialize(board)
    @board = board
    @players = [Player.new(:white, self), Player.new(:black, self)]
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
    when "Does Player checks other?"
      other_king_position = other_player(_sender).king.position
      _sender.possible_moves.map(&:name).include?(other_king_position)
    when "Does Player checkmate other?"
      other = other_player(_sender)
      save_board
      checkmate = true
      other.active_pieces.each do |piece|
        initial = piece.position
        piece.possible_moves.map(&:name).each do |possible_move|
          piece.update_position(possible_move)
          unless other.under_check?
            load_backup_board
            checkmate = false
            return checkmate
          end
          load_backup_board
        end
      end
      checkmate
    when "Is Player under check?"
      other_player(_sender).possible_moves.map(&:name).include?(_sender.king.position)
    when "Checkmate"
      puts "#{_sender} wins!"
    end
  end

  def white
    @players[0]
  end

  def black
    @players[1]
  end

end