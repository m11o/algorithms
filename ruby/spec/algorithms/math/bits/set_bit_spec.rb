    
describe setBit do
  it 'should set bit at specific position' do
    // 1 = 0b0001

    expect(setBit(1, 0)).to eq 1
    expect(setBit(1, 1)).to eq 3
    expect(setBit(1, 2)).to eq 5
    
    // 10 = 0b1010

    expect(setBit(10, 0)).to eq 11
    expect(setBit(10, 1)).to eq 10
    expect(setBit(10, 2)).to eq 14
  end

end
