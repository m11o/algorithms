    
xdescribe bitLength do
  it 'should calculate number of bits that the number is consists of' do
    expect(bitLength(0b0)).to eq 0
    expect(bitLength(0b1)).to eq 1
    expect(bitLength(0b01)).to eq 1
    expect(bitLength(0b101)).to eq 3
    expect(bitLength(0b0101)).to eq 3
    expect(bitLength(0b10101)).to eq 5
    expect(bitLength(0b11110101)).to eq 8
    expect(bitLength(0b00011110101)).to eq 8
  end

end
