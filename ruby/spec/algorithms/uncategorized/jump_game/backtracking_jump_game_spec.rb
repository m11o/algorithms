    
describe backtrackingJumpGame do
  it 'should solve Jump Game problem in backtracking manner' do
    expect(backtrackingJumpGame([1, 0])).to be true
    expect(backtrackingJumpGame([100, 0])).to be true
    expect(backtrackingJumpGame([2, 3, 1, 1, 4])).to be true
    expect(backtrackingJumpGame([1, 1, 1, 1, 1])).to be true
    expect(backtrackingJumpGame([1, 1, 1, 10, 1])).to be true
    expect(backtrackingJumpGame([1, 5, 2, 1, 0, 2, 0])).to be true
    
    expect(backtrackingJumpGame([1, 0, 1])).to be false
    expect(backtrackingJumpGame([3, 2, 1, 0, 4])).to be false
    expect(backtrackingJumpGame([0, 0, 0, 0, 0])).to be false
    expect(backtrackingJumpGame([5, 4, 3, 2, 1, 0, 0])).to be false
  end

end
