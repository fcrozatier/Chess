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