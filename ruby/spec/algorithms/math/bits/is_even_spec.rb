    
describe isEven do
  it 'should detect if a number is even' do
    expect(isEven(0)).to be true
    expect(isEven(2)).to be true
    expect(isEven(-2)).to be true
    expect(isEven(1)).to be false
    expect(isEven(-1)).to be false
    expect(isEven(-3)).to be false
    expect(isEven(3)).to be false
    expect(isEven(8)).to be true
    expect(isEven(9)).to be false
    expect(isEven(121)).to be false
    expect(isEven(122)).to be true
    expect(isEven(1201)).to be false
    expect(isEven(1202)).to be true
  end

end
