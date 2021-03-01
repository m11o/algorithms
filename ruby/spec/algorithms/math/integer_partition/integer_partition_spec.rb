    
xdescribe integerPartition do
  it 'should partition the number' do
    expect(integerPartition(1)).to eq 1
    expect(integerPartition(2)).to eq 2
    expect(integerPartition(3)).to eq 3
    expect(integerPartition(4)).to eq 5
    expect(integerPartition(5)).to eq 7
    expect(integerPartition(6)).to eq 11
    expect(integerPartition(7)).to eq 15
    expect(integerPartition(8)).to eq 22
  end

end
