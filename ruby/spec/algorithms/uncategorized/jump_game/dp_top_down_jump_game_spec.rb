    
describe dpTopDownJumpGame do
  it 'should solve Jump Game problem in top-down dynamic programming manner' do
    expect(dpTopDownJumpGame([1, 0])).to be true
    expect(dpTopDownJumpGame([100, 0])).to be true
    expect(dpTopDownJumpGame([2, 3, 1, 1, 4])).to be true
    expect(dpTopDownJumpGame([1, 1, 1, 1, 1])).to be true
    expect(dpTopDownJumpGame([1, 1, 1, 10, 1])).to be true
    expect(dpTopDownJumpGame([1, 5, 2, 1, 0, 2, 0])).to be true
    
    expect(dpTopDownJumpGame([1, 0, 1])).to be false
    expect(dpTopDownJumpGame([3, 2, 1, 0, 4])).to be false
    expect(dpTopDownJumpGame([0, 0, 0, 0, 0])).to be false
    expect(dpTopDownJumpGame([5, 4, 3, 2, 1, 0, 0])).to be false
  end

end
