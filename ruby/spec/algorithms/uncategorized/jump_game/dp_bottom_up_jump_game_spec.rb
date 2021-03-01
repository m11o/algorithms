    
xdescribe dpBottomUpJumpGame do
  it 'should solve Jump Game problem in bottom-up dynamic programming manner' do
    expect(dpBottomUpJumpGame([1, 0])).to eq true
    expect(dpBottomUpJumpGame([100, 0])).to eq true
    expect(dpBottomUpJumpGame([2, 3, 1, 1, 4])).to eq true
    expect(dpBottomUpJumpGame([1, 1, 1, 1, 1])).to eq true
    expect(dpBottomUpJumpGame([1, 1, 1, 10, 1])).to eq true
    expect(dpBottomUpJumpGame([1, 5, 2, 1, 0, 2, 0])).to eq true
    
    expect(dpBottomUpJumpGame([1, 0, 1])).to eq false
    expect(dpBottomUpJumpGame([3, 2, 1, 0, 4])).to eq false
    expect(dpBottomUpJumpGame([0, 0, 0, 0, 0])).to eq false
    expect(dpBottomUpJumpGame([5, 4, 3, 2, 1, 0, 0])).to eq false
  end

end
