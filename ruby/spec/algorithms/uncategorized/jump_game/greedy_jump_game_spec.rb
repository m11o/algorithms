    
describe greedyJumpGame do
  it 'should solve Jump Game problem in greedy manner' do
    expect(greedyJumpGame([1, 0])).to be true
    expect(greedyJumpGame([100, 0])).to be true
    expect(greedyJumpGame([2, 3, 1, 1, 4])).to be true
    expect(greedyJumpGame([1, 1, 1, 1, 1])).to be true
    expect(greedyJumpGame([1, 1, 1, 10, 1])).to be true
    expect(greedyJumpGame([1, 5, 2, 1, 0, 2, 0])).to be true
    
    expect(greedyJumpGame([1, 0, 1])).to be false
    expect(greedyJumpGame([3, 2, 1, 0, 4])).to be false
    expect(greedyJumpGame([0, 0, 0, 0, 0])).to be false
    expect(greedyJumpGame([5, 4, 3, 2, 1, 0, 0])).to be false
  end

end
