    
xdescribe isEven do
  it 'should detect if a number is even' do
    expect(isEven(0)).to eq true
    expect(isEven(2)).to eq true
    expect(isEven(-2)).to eq true
    expect(isEven(1)).to eq false
    expect(isEven(-1)).to eq false
    expect(isEven(-3)).to eq false
    expect(isEven(3)).to eq false
    expect(isEven(8)).to eq true
    expect(isEven(9)).to eq false
    expect(isEven(121)).to eq false
    expect(isEven(122)).to eq true
    expect(isEven(1201)).to eq false
    expect(isEven(1202)).to eq true
  end

end
