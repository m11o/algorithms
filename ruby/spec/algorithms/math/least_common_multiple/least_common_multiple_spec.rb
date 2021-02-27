    
describe leastCommonMultiple do
  it 'should find least common multiple' do
    expect(leastCommonMultiple(0, 0)).to be 0
    expect(leastCommonMultiple(1, 0)).to be 0
    expect(leastCommonMultiple(0, 1)).to be 0
    expect(leastCommonMultiple(4, 6)).to be 12
    expect(leastCommonMultiple(6, 21)).to be 42
    expect(leastCommonMultiple(7, 2)).to be 14
    expect(leastCommonMultiple(3, 5)).to be 15
    expect(leastCommonMultiple(7, 3)).to be 21
    expect(leastCommonMultiple(1000000, 2)).to be 1000000
    expect(leastCommonMultiple(-9, -18)).to be 18
    expect(leastCommonMultiple(-7, -9)).to be 63
    expect(leastCommonMultiple(-7, 9)).to be 63
  end

end
