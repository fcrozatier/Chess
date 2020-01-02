class Array
  
  def take_while 
    list = []
    self.each do |el| 
      list << el
      break if !yield(el)
    end
    list
  end

end