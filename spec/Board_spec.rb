require './Board.rb'

describe Board do
  board = Board.new

  it "Creates an empty board" do
    expect(board.cells.size).to  eq 8
  end

  it "has left cells" do
    expect(board.left(0,0)).to eq []
    expect(board.left(0,5)).to eq []
    expect(board.left(1,0).map(&:name)).to eq ["A1"]
    expect(Set.new(board.left(3,2).map(&:name))).to eq Set.new(["A3", "B3","C3"])
  end

  it "has right cells" do
    expect(board.right(7,0)).to eq []
    expect(board.right(7,5)).to eq []
    expect(board.right(6,0).map(&:name)).to eq ["H1"]
    expect(Set.new(board.right(3,2).map(&:name))).to eq Set.new(["E3", "F3","G3","H3"])
  end

  it "has up cells" do 
    expect(board.up(0,7)).to eq []
    expect(board.up(3,7)).to eq []
    expect(board.up(3,6).map(&:name)).to eq ["D8"]
    expect(Set.new(board.up(3,2).map(&:name))).to eq Set.new(["D4", "D5","D6","D7","D8"])
  end

  it "has down cells" do 
    expect(board.down(0,0)).to eq []
    expect(board.down(3,0)).to eq []
    expect(board.down(3,1).map(&:name)).to eq ["D1"]
    expect(Set.new(board.down(3,2).map(&:name))).to eq Set.new(["D1", "D2"])
  end

  it "has upright cells" do 
    expect(board.upright(7,7)).to eq []
    expect(board.upright(7,0)).to eq []
    expect(board.upright(6,6).map(&:name)).to eq ["H8"]
    expect(Set.new(board.upright(3,2).map(&:name))).to eq Set.new(["E4", "F5","G6","H7"])
  end
  
  
end
