    
describe countSetBits do
  it 'should return number of set bits' do
    expect(countSetBits(0)).to eq 0
    expect(countSetBits(1)).to eq 1
    expect(countSetBits(2)).to eq 1
    expect(countSetBits(3)).to eq 2
    expect(countSetBits(4)).to eq 1
    expect(countSetBits(5)).to eq 2
    expect(countSetBits(21)).to eq 3
    expect(countSetBits(255)).to eq 8
    expect(countSetBits(1023)).to eq 10
    expect(countSetBits(-1)).to eq 32
    expect(countSetBits(-21)).to eq 30
    expect(countSetBits(-255)).to eq 25
    expect(countSetBits(-1023)).to eq 23
    expect(countSetBits(-4294967296)).to eq 0
  end

end
