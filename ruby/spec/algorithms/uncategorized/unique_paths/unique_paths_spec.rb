    
describe uniquePaths do
  it 'should find the number of unique paths on board' do
    expect(uniquePaths(3, 2)).to be 3
    expect(uniquePaths(7, 3)).to be 28
    expect(uniquePaths(3, 7)).to be 28
    expect(uniquePaths(10, 10)).to be 48620
    expect(uniquePaths(100, 1)).to be 1
    expect(uniquePaths(1, 100)).to be 1
  end

end
