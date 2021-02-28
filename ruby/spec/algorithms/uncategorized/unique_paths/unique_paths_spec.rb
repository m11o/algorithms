    
describe uniquePaths do
  it 'should find the number of unique paths on board' do
    expect(uniquePaths(3, 2)).to eq 3
    expect(uniquePaths(7, 3)).to eq 28
    expect(uniquePaths(3, 7)).to eq 28
    expect(uniquePaths(10, 10)).to eq 48620
    expect(uniquePaths(100, 1)).to eq 1
    expect(uniquePaths(1, 100)).to eq 1
  end

end
