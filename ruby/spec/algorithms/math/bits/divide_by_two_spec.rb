    
describe divideByTwo do
  it 'should divide numbers by two using bitwise operations' do
    expect(divideByTwo(0)).to eq 0
    expect(divideByTwo(1)).to eq 0
    expect(divideByTwo(3)).to eq 1
    expect(divideByTwo(10)).to eq 5
    expect(divideByTwo(17)).to eq 8
    expect(divideByTwo(125)).to eq 62
  end

end
