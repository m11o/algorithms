    
describe bitLength do
  it 'should calculate number of bits that the number is consists of' do
    expect(bitLength(0b0)).to be 0
    expect(bitLength(0b1)).to be 1
    expect(bitLength(0b01)).to be 1
    expect(bitLength(0b101)).to be 3
    expect(bitLength(0b0101)).to be 3
    expect(bitLength(0b10101)).to be 5
    expect(bitLength(0b11110101)).to be 8
    expect(bitLength(0b00011110101)).to be 8
  end

end
