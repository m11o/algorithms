    
describe multiplyUnsigned do
  it 'should multiply two unsigned numbers' do
    expect(multiplyUnsigned(0, 2)).to eq 0
    expect(multiplyUnsigned(2, 0)).to eq 0
    expect(multiplyUnsigned(1, 1)).to eq 1
    expect(multiplyUnsigned(1, 2)).to eq 2
    expect(multiplyUnsigned(2, 7)).to eq 14
    expect(multiplyUnsigned(7, 2)).to eq 14
    expect(multiplyUnsigned(30, 2)).to eq 60
    expect(multiplyUnsigned(17, 34)).to eq 578
    expect(multiplyUnsigned(170, 2340)).to eq 397800
  end

end
