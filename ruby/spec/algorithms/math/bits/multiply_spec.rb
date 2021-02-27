    
describe multiply do
  it 'should multiply two numbers' do
    expect(multiply(0, 0)).to be 0
    expect(multiply(2, 0)).to be 0
    expect(multiply(0, 2)).to be 0
    expect(multiply(1, 2)).to be 2
    expect(multiply(2, 1)).to be 2
    expect(multiply(6, 6)).to be 36
    expect(multiply(-2, 4)).to be -8
    expect(multiply(4, -2)).to be -8
    expect(multiply(-4, -4)).to be 16
    expect(multiply(4, -5)).to be -20
    expect(multiply(2, 121)).to be 242
    expect(multiply(121, 2)).to be 242
  end

end
