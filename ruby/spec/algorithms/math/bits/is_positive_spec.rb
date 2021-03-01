    
xdescribe isPositive do
  it 'should detect if a number is positive' do
    expect(isPositive(1)).to eq true
    expect(isPositive(2)).to eq true
    expect(isPositive(3)).to eq true
    expect(isPositive(5665)).to eq true
    expect(isPositive(56644325)).to eq true
    
    expect(isPositive(0)).to eq false
    expect(isPositive(-0)).to eq false
    expect(isPositive(-1)).to eq false
    expect(isPositive(-2)).to eq false
    expect(isPositive(-126)).to eq false
    expect(isPositive(-5665)).to eq false
    expect(isPositive(-56644325)).to eq false
  end

end
