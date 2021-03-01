    
xdescribe btUniquePaths do
  it 'should find the number of unique paths on board' do
    expect(btUniquePaths(3, 2)).to eq 3
    expect(btUniquePaths(7, 3)).to eq 28
    expect(btUniquePaths(3, 7)).to eq 28
    expect(btUniquePaths(10, 10)).to eq 48620
    expect(btUniquePaths(100, 1)).to eq 1
    expect(btUniquePaths(1, 100)).to eq 1
  end

end
