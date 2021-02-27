    
describe isPositive do
  it 'should detect if a number is positive' do
    expect(isPositive(1)).to be true
    expect(isPositive(2)).to be true
    expect(isPositive(3)).to be true
    expect(isPositive(5665)).to be true
    expect(isPositive(56644325)).to be true
    
    expect(isPositive(0)).to be false
    expect(isPositive(-0)).to be false
    expect(isPositive(-1)).to be false
    expect(isPositive(-2)).to be false
    expect(isPositive(-126)).to be false
    expect(isPositive(-5665)).to be false
    expect(isPositive(-56644325)).to be false
  end

end
