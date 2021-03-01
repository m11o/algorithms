    
xdescribe updateBit do
  it 'should update bit at specific position' do
    // 1 = 0b0001

    expect(updateBit(1, 0, 1)).to eq 1
    expect(updateBit(1, 0, 0)).to eq 0
    expect(updateBit(1, 1, 1)).to eq 3
    expect(updateBit(1, 2, 1)).to eq 5
    
    // 10 = 0b1010

    expect(updateBit(10, 0, 1)).to eq 11
    expect(updateBit(10, 0, 0)).to eq 10
    expect(updateBit(10, 1, 1)).to eq 10
    expect(updateBit(10, 1, 0)).to eq 8
    expect(updateBit(10, 2, 1)).to eq 14
    expect(updateBit(10, 2, 0)).to eq 10
  end

end
