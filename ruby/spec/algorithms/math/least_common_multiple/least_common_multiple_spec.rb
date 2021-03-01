    
describe leastCommonMultiple do
  it 'should find least common multiple' do
    expect(leastCommonMultiple(0, 0)).to eq 0
    expect(leastCommonMultiple(1, 0)).to eq 0
    expect(leastCommonMultiple(0, 1)).to eq 0
    expect(leastCommonMultiple(4, 6)).to eq 12
    expect(leastCommonMultiple(6, 21)).to eq 42
    expect(leastCommonMultiple(7, 2)).to eq 14
    expect(leastCommonMultiple(3, 5)).to eq 15
    expect(leastCommonMultiple(7, 3)).to eq 21
    expect(leastCommonMultiple(1000000, 2)).to eq 1000000
    expect(leastCommonMultiple(-9, -18)).to eq 18
    expect(leastCommonMultiple(-7, -9)).to eq 63
    expect(leastCommonMultiple(-7, 9)).to eq 63
  end

end
