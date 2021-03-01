    
xdescribe dpUniquePaths do
  it 'should find the number of unique paths on board' do
    expect(dpUniquePaths(3, 2)).to eq 3
    expect(dpUniquePaths(7, 3)).to eq 28
    expect(dpUniquePaths(3, 7)).to eq 28
    expect(dpUniquePaths(10, 10)).to eq 48620
    expect(dpUniquePaths(100, 1)).to eq 1
    expect(dpUniquePaths(1, 100)).to eq 1
  end

end
