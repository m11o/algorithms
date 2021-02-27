    
describe countSetBits do
  it 'should return number of set bits' do
    expect(countSetBits(0)).to be 0
    expect(countSetBits(1)).to be 1
    expect(countSetBits(2)).to be 1
    expect(countSetBits(3)).to be 2
    expect(countSetBits(4)).to be 1
    expect(countSetBits(5)).to be 2
    expect(countSetBits(21)).to be 3
    expect(countSetBits(255)).to be 8
    expect(countSetBits(1023)).to be 10
    expect(countSetBits(-1)).to be 32
    expect(countSetBits(-21)).to be 30
    expect(countSetBits(-255)).to be 25
    expect(countSetBits(-1023)).to be 23
    expect(countSetBits(-4294967296)).to be 0
  end

end
