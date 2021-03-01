    
xdescribe dpMaximumSubarray do
  it 'should find maximum subarray using dynamic programming algorithm' do
    expect(dpMaximumSubarray([])).to eq []
    expect(dpMaximumSubarray([0, 0])).to eq [0]
    expect(dpMaximumSubarray([0, 0, 1])).to eq [0, 0, 1]
    expect(dpMaximumSubarray([0, 0, 1, 2])).to eq [0, 0, 1, 2]
    expect(dpMaximumSubarray([0, 0, -1, 2])).to eq [2]
    expect(dpMaximumSubarray([-1, -2, -3, -4, -5])).to eq [-1]
    expect(dpMaximumSubarray([1, 2, 3, 2, 3, 4, 5])).to eq [1, 2, 3, 2, 3, 4, 5]
    expect(dpMaximumSubarray([-2, 1, -3, 4, -1, 2, 1, -5, 4])).to eq [4, -1, 2, 1]
    expect(dpMaximumSubarray([-2, -3, 4, -1, -2, 1, 5, -3])).to eq [4, -1, -2, 1, 5]
    expect(dpMaximumSubarray([1, -3, 2, -5, 7, 6, -1, 4, 11, -23])).to eq [7, 6, -1, 4, 11]
  end

end
