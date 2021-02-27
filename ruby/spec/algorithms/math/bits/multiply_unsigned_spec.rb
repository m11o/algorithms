    
describe multiplyUnsigned do
  it 'should multiply two unsigned numbers' do
    expect(multiplyUnsigned(0, 2)).to be 0
    expect(multiplyUnsigned(2, 0)).to be 0
    expect(multiplyUnsigned(1, 1)).to be 1
    expect(multiplyUnsigned(1, 2)).to be 2
    expect(multiplyUnsigned(2, 7)).to be 14
    expect(multiplyUnsigned(7, 2)).to be 14
    expect(multiplyUnsigned(30, 2)).to be 60
    expect(multiplyUnsigned(17, 34)).to be 578
    expect(multiplyUnsigned(170, 2340)).to be 397800
  end

end
