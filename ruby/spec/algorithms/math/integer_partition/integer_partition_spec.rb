    
describe integerPartition do
  it 'should partition the number' do
    expect(integerPartition(1)).to be 1
    expect(integerPartition(2)).to be 2
    expect(integerPartition(3)).to be 3
    expect(integerPartition(4)).to be 5
    expect(integerPartition(5)).to be 7
    expect(integerPartition(6)).to be 11
    expect(integerPartition(7)).to be 15
    expect(integerPartition(8)).to be 22
  end

end
