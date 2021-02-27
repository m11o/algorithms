    
describe updateBit do
  it 'should update bit at specific position' do
    // 1 = 0b0001

    expect(updateBit(1, 0, 1)).to be 1
    expect(updateBit(1, 0, 0)).to be 0
    expect(updateBit(1, 1, 1)).to be 3
    expect(updateBit(1, 2, 1)).to be 5
    
    // 10 = 0b1010

    expect(updateBit(10, 0, 1)).to be 11
    expect(updateBit(10, 0, 0)).to be 10
    expect(updateBit(10, 1, 1)).to be 10
    expect(updateBit(10, 1, 0)).to be 8
    expect(updateBit(10, 2, 1)).to be 14
    expect(updateBit(10, 2, 0)).to be 10
  end

end
