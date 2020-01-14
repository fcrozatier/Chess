require './Table.rb'

describe Table do
  
  it "Creates an empty list when given parameters (0,0)" do
    table = Table.new(0,0)
    expect(table.cells).to eq []
  end

  it "Creates a table of correct size with nil values if no block" do
    table = Table.new(3,2)
    expect(table.cells).to eq [[nil,nil],[nil,nil],[nil,nil]]
  end

  it "Fills the table with object in bloc" do 
    table = Table.new(3,2) {1}
    expect(table.cells).to eq [[1,1],[1,1],[1,1]]
  end

  
end
