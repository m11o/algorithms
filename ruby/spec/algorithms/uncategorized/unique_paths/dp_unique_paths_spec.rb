    
describe dpUniquePaths do
  it 'should find the number of unique paths on board' do
    expect(dpUniquePaths(3, 2)).to be 3
    expect(dpUniquePaths(7, 3)).to be 28
    expect(dpUniquePaths(3, 7)).to be 28
    expect(dpUniquePaths(10, 10)).to be 48620
    expect(dpUniquePaths(100, 1)).to be 1
    expect(dpUniquePaths(1, 100)).to be 1
  end

end
