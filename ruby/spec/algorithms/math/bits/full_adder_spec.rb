    
xdescribe fullAdder do
  it 'should add up two numbers' do
    expect(fullAdder(0, 0)).to eq 0
    expect(fullAdder(2, 0)).to eq 2
    expect(fullAdder(0, 2)).to eq 2
    expect(fullAdder(1, 2)).to eq 3
    expect(fullAdder(2, 1)).to eq 3
    expect(fullAdder(6, 6)).to eq 12
    expect(fullAdder(-2, 4)).to eq 2
    expect(fullAdder(4, -2)).to eq 2
    expect(fullAdder(-4, -4)).to eq -8
    expect(fullAdder(4, -5)).to eq -1
    expect(fullAdder(2, 121)).to eq 123
    expect(fullAdder(121, 2)).to eq 123
  end

end
