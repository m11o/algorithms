    
describe fullAdder do
  it 'should add up two numbers' do
    expect(fullAdder(0, 0)).to be 0
    expect(fullAdder(2, 0)).to be 2
    expect(fullAdder(0, 2)).to be 2
    expect(fullAdder(1, 2)).to be 3
    expect(fullAdder(2, 1)).to be 3
    expect(fullAdder(6, 6)).to be 12
    expect(fullAdder(-2, 4)).to be 2
    expect(fullAdder(4, -2)).to be 2
    expect(fullAdder(-4, -4)).to be -8
    expect(fullAdder(4, -5)).to be -1
    expect(fullAdder(2, 121)).to be 123
    expect(fullAdder(121, 2)).to be 123
  end

end
