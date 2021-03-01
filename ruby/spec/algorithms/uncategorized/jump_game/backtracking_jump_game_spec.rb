    
xdescribe backtrackingJumpGame do
  it 'should solve Jump Game problem in backtracking manner' do
    expect(backtrackingJumpGame([1, 0])).to eq true
    expect(backtrackingJumpGame([100, 0])).to eq true
    expect(backtrackingJumpGame([2, 3, 1, 1, 4])).to eq true
    expect(backtrackingJumpGame([1, 1, 1, 1, 1])).to eq true
    expect(backtrackingJumpGame([1, 1, 1, 10, 1])).to eq true
    expect(backtrackingJumpGame([1, 5, 2, 1, 0, 2, 0])).to eq true
    
    expect(backtrackingJumpGame([1, 0, 1])).to eq false
    expect(backtrackingJumpGame([3, 2, 1, 0, 4])).to eq false
    expect(backtrackingJumpGame([0, 0, 0, 0, 0])).to eq false
    expect(backtrackingJumpGame([5, 4, 3, 2, 1, 0, 0])).to eq false
  end

end
