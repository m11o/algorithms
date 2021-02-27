    
describe multiplyByTwo do
  it 'should multiply numbers by two using bitwise operations' do
    expect(multiplyByTwo(0)).to be 0
    expect(multiplyByTwo(1)).to be 2
    expect(multiplyByTwo(3)).to be 6
    expect(multiplyByTwo(10)).to be 20
    expect(multiplyByTwo(17)).to be 34
    expect(multiplyByTwo(125)).to be 250
  end

end
