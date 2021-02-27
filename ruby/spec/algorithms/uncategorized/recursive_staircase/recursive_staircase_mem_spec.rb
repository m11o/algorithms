    
describe recursiveStaircaseMEM do
  it 'should calculate number of variants using Brute Force with Memoization' do
    expect(recursiveStaircaseMEM(-1)).to be 0
    expect(recursiveStaircaseMEM(0)).to be 0
    expect(recursiveStaircaseMEM(1)).to be 1
    expect(recursiveStaircaseMEM(2)).to be 2
    expect(recursiveStaircaseMEM(3)).to be 3
    expect(recursiveStaircaseMEM(4)).to be 5
    expect(recursiveStaircaseMEM(5)).to be 8
    expect(recursiveStaircaseMEM(6)).to be 13
    expect(recursiveStaircaseMEM(7)).to be 21
    expect(recursiveStaircaseMEM(8)).to be 34
    expect(recursiveStaircaseMEM(9)).to be 55
    expect(recursiveStaircaseMEM(10)).to be 89
  end

end
