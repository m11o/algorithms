    
describe recursiveStaircaseDP do
  it 'should calculate number of variants using Dynamic Programming solution' do
    expect(recursiveStaircaseDP(-1)).to be 0
    expect(recursiveStaircaseDP(0)).to be 0
    expect(recursiveStaircaseDP(1)).to be 1
    expect(recursiveStaircaseDP(2)).to be 2
    expect(recursiveStaircaseDP(3)).to be 3
    expect(recursiveStaircaseDP(4)).to be 5
    expect(recursiveStaircaseDP(5)).to be 8
    expect(recursiveStaircaseDP(6)).to be 13
    expect(recursiveStaircaseDP(7)).to be 21
    expect(recursiveStaircaseDP(8)).to be 34
    expect(recursiveStaircaseDP(9)).to be 55
    expect(recursiveStaircaseDP(10)).to be 89
  end

end
