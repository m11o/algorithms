    
describe recursiveStaircaseIT do
  it 'should calculate number of variants using Iterative solution' do
    expect(recursiveStaircaseIT(-1)).to be 0
    expect(recursiveStaircaseIT(0)).to be 0
    expect(recursiveStaircaseIT(1)).to be 1
    expect(recursiveStaircaseIT(2)).to be 2
    expect(recursiveStaircaseIT(3)).to be 3
    expect(recursiveStaircaseIT(4)).to be 5
    expect(recursiveStaircaseIT(5)).to be 8
    expect(recursiveStaircaseIT(6)).to be 13
    expect(recursiveStaircaseIT(7)).to be 21
    expect(recursiveStaircaseIT(8)).to be 34
    expect(recursiveStaircaseIT(9)).to be 55
    expect(recursiveStaircaseIT(10)).to be 89
  end

end
