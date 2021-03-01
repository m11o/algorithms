    
xdescribe getBit do
  it 'should get bit at specific position' do
    // 1 = 0b0001

    expect(getBit(1, 0)).to eq 1
    expect(getBit(1, 1)).to eq 0
    
    // 2 = 0b0010

    expect(getBit(2, 0)).to eq 0
    expect(getBit(2, 1)).to eq 1
    
    // 3 = 0b0011

    expect(getBit(3, 0)).to eq 1
    expect(getBit(3, 1)).to eq 1
    
    // 10 = 0b1010

    expect(getBit(10, 0)).to eq 0
    expect(getBit(10, 1)).to eq 1
    expect(getBit(10, 2)).to eq 0
    expect(getBit(10, 3)).to eq 1
  end

end
