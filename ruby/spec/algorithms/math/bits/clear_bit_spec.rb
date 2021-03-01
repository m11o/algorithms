    
xdescribe clearBit do
  it 'should clear bit at specific position' do
    // 1 = 0b0001

    expect(clearBit(1, 0)).to eq 0
    expect(clearBit(1, 1)).to eq 1
    expect(clearBit(1, 2)).to eq 1
    
    // 10 = 0b1010

    expect(clearBit(10, 0)).to eq 10
    expect(clearBit(10, 1)).to eq 8
    expect(clearBit(10, 3)).to eq 2
  end

end
