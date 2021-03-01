    
xdescribe multiplyByTwo do
  it 'should multiply numbers by two using bitwise operations' do
    expect(multiplyByTwo(0)).to eq 0
    expect(multiplyByTwo(1)).to eq 2
    expect(multiplyByTwo(3)).to eq 6
    expect(multiplyByTwo(10)).to eq 20
    expect(multiplyByTwo(17)).to eq 34
    expect(multiplyByTwo(125)).to eq 250
  end

end
