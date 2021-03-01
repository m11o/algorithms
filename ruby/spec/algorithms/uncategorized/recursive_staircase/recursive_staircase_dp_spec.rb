    
describe recursiveStaircaseDP do
  it 'should calculate number of variants using Dynamic Programming solution' do
    expect(recursiveStaircaseDP(-1)).to eq 0
    expect(recursiveStaircaseDP(0)).to eq 0
    expect(recursiveStaircaseDP(1)).to eq 1
    expect(recursiveStaircaseDP(2)).to eq 2
    expect(recursiveStaircaseDP(3)).to eq 3
    expect(recursiveStaircaseDP(4)).to eq 5
    expect(recursiveStaircaseDP(5)).to eq 8
    expect(recursiveStaircaseDP(6)).to eq 13
    expect(recursiveStaircaseDP(7)).to eq 21
    expect(recursiveStaircaseDP(8)).to eq 34
    expect(recursiveStaircaseDP(9)).to eq 55
    expect(recursiveStaircaseDP(10)).to eq 89
  end

end
