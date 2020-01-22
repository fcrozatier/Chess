class Chess

  def initialize
    board = Board.new
    @manager = Manager.new(board)
  end

  def save
    save = Marshal.dump(@manager)
    File.open("save","w+") do |file|
      file.write(save)
    end
  end

  def load
    File.open("save","r") do |file|
      @manager = Marshal.load(file)
    end
  end

  def turn
    move = nil
    loop do 
      move = get_input_logic
      if move
        break if @manager.playing.plays(move[0],move[1])
      end
    end
  end

  def get_input_logic
    input = ""
    loop do
      puts "#{@manager.playing.color} : what's your move?"
      input = gets.chomp
      break if valid?(input)
      puts "Your move must be of the form C1C4 to take C1 to C4. [s] to save, [l] to load."
    end
    case input
    when "s"
      save
    when "l"
      load
    else
      parse(input)
    end
  end

  def valid?(input)
    input.match?(/^([A-H][1-8][A-H][1-8]|s|l)$/)
  end

  def parse(input)
    data = input.match(/^([A-H][1-8])([A-H][1-8])$/)
    initial, final = data[1], data[2]
    if initial == final
      puts "Your initial cell and final cell must be distinct."
      return false
    else
      return [initial, final]
    end
  end

  def checkmate?
    save
    pairs_pieces_moves = []
    black.active_pieces.each do |piece|
      pairs_pieces_moves << [piece.coordinates, piece.possible_moves.map(&:name)]
    end
    pairs_pieces_moves.each do |pair|
      coordinates = pair[0]
      possible_moves = pair[1]
      possible_moves.each do |possible_move|
        load
        piece = board.cells[coordinates[1]][coordinates[0]].piece
        piece.update_position(possible_move)
        unless black.under_check?
          load
          return false
        end
        load
      end    
    end
    true
  end

  def board 
    @manager.board
  end

  def white
    @manager.white
  end

  def black
    @manager.black
  end

end