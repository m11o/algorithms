    
describe btUniquePaths do
  it 'should find the number of unique paths on board' do
    expect(btUniquePaths(3, 2)).to be 3
    expect(btUniquePaths(7, 3)).to be 28
    expect(btUniquePaths(3, 7)).to be 28
    expect(btUniquePaths(10, 10)).to be 48620
    expect(btUniquePaths(100, 1)).to be 1
    expect(btUniquePaths(1, 100)).to be 1
  end

end
