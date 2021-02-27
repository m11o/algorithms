    
describe divideByTwo do
  it 'should divide numbers by two using bitwise operations' do
    expect(divideByTwo(0)).to be 0
    expect(divideByTwo(1)).to be 0
    expect(divideByTwo(3)).to be 1
    expect(divideByTwo(10)).to be 5
    expect(divideByTwo(17)).to be 8
    expect(divideByTwo(125)).to be 62
  end

end
