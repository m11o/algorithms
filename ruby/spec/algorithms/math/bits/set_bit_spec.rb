    
describe setBit do
  it 'should set bit at specific position' do
    // 1 = 0b0001

    expect(setBit(1, 0)).to be 1
    expect(setBit(1, 1)).to be 3
    expect(setBit(1, 2)).to be 5
    
    // 10 = 0b1010

    expect(setBit(10, 0)).to be 11
    expect(setBit(10, 1)).to be 10
    expect(setBit(10, 2)).to be 14
  end

end
