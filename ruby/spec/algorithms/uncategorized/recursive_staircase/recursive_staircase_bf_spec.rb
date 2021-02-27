    
describe recursiveStaircaseBF do
  it 'should calculate number of variants using Brute Force solution' do
    expect(recursiveStaircaseBF(-1)).to be 0
    expect(recursiveStaircaseBF(0)).to be 0
    expect(recursiveStaircaseBF(1)).to be 1
    expect(recursiveStaircaseBF(2)).to be 2
    expect(recursiveStaircaseBF(3)).to be 3
    expect(recursiveStaircaseBF(4)).to be 5
    expect(recursiveStaircaseBF(5)).to be 8
    expect(recursiveStaircaseBF(6)).to be 13
    expect(recursiveStaircaseBF(7)).to be 21
    expect(recursiveStaircaseBF(8)).to be 34
    expect(recursiveStaircaseBF(9)).to be 55
    expect(recursiveStaircaseBF(10)).to be 89
  end

end
