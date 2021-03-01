    
xdescribe bfMaximumSubarray do
  it 'should find maximum subarray using brute force algorithm' do
    expect(bfMaximumSubarray([])).to eq []
    expect(bfMaximumSubarray([0, 0])).to eq [0]
    expect(bfMaximumSubarray([0, 0, 1])).to eq [0, 0, 1]
    expect(bfMaximumSubarray([0, 0, 1, 2])).to eq [0, 0, 1, 2]
    expect(bfMaximumSubarray([0, 0, -1, 2])).to eq [2]
    expect(bfMaximumSubarray([-1, -2, -3, -4, -5])).to eq [-1]
    expect(bfMaximumSubarray([1, 2, 3, 2, 3, 4, 5])).to eq [1, 2, 3, 2, 3, 4, 5]
    expect(bfMaximumSubarray([-2, 1, -3, 4, -1, 2, 1, -5, 4])).to eq [4, -1, 2, 1]
    expect(bfMaximumSubarray([-2, -3, 4, -1, -2, 1, 5, -3])).to eq [4, -1, -2, 1, 5]
    expect(bfMaximumSubarray([1, -3, 2, -5, 7, 6, -1, 4, 11, -23])).to eq [7, 6, -1, 4, 11]
  end

end
