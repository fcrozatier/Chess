class PlayerManager

  def initialize(white, black)
    @white = white
    @black = black
  end

  def under_check?(_sender)
    other_player(_sender).check?(_sender)
  end

  def other_player(_sender)
    _sender == @white ? @white : @black
  end
end