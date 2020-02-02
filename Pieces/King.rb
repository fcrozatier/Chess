class King < Piece

  def initialize(color, position, manager)
    super(color, position, manager)
    @legal_moves = ["left", "right", "up", "down","upleft", "upright", "downleft", "downright"]
  end

  def possible_moves
    board = notify("Board")
    moves = possible_castles
    @legal_moves.each do |prefix|
      moves += board.method(prefix).call(x, y).first(1)
        .select { |cell| cell.empty? || cell.piece.color != color }
    end
    moves
  end

  def update_position(final)
    board = notify("Board")
    if castle?(final)
      board.cells[y][7].piece.update_position("F#{y+1}") if final == "G#{y+1}"
      board.cells[y][0].piece.update_position("D#{y+1}") if final == "C#{y+1}"
    end
    super(final)
  end

  def castle?(final)
    nb_moves == 0 && (final[0].ord - "E".ord).abs == 2 && (final[1].to_i == y+1)
  end

  def possible_castles
    board = notify("Board")
    castles = []
    if nb_moves == 0 
      if !board.cells[y][7].empty? && board.cells[y][7].piece.nb_moves == 0
        if board.cells[y][5..6].map(&:empty?).all?(true)
          if board.cells[y][4..6].reverse.reduce do |bool, cell|
              update_position(cell.name)
              bool &&= !@manager.method(color).call.under_check?
            end
            castles << board.cells[y][6]
          end
        end
      end
      if !board.cells[y][0].empty? && board.cells[y][0].piece.nb_moves == 0
        if board.cells[y][1..3].map(&:empty?).all?(true)
          if board.cells[y][2..4].reduce do |bool, cell|
              update_position(cell.name)
              bool &&= !@manager.method(color).call.under_check?
            end
            castles << board.cells[y][2]
          end
        end
      end
    end
    self.nb_moves = 0
    castles
  end


end