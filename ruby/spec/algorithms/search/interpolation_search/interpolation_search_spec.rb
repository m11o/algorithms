    
describe interpolationSearch do
  it 'should search elements in sorted array of numbers' do
    expect(interpolationSearch([], 1)).to eq -1
    expect(interpolationSearch([1], 1)).to eq 0
    expect(interpolationSearch([1], 0)).to eq -1
    expect(interpolationSearch([1, 1], 1)).to eq 0
    expect(interpolationSearch([1, 2], 1)).to eq 0
    expect(interpolationSearch([1, 2], 2)).to eq 1
    expect(interpolationSearch([10, 20, 30, 40, 50], 40)).to eq 3
    expect(interpolationSearch([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 14)).to eq 13
    expect(interpolationSearch([1, 6, 7, 8, 12, 13, 14, 19, 21, 23, 24, 24, 24, 300], 24)).to eq 10
    expect(interpolationSearch([1, 2, 3, 700, 800, 1200, 1300, 1400, 1900], 600)).to eq -1
    expect(interpolationSearch([1, 2, 3, 700, 800, 1200, 1300, 1400, 1900], 1)).to eq 0
    expect(interpolationSearch([1, 2, 3, 700, 800, 1200, 1300, 1400, 1900], 2)).to eq 1
    expect(interpolationSearch([1, 2, 3, 700, 800, 1200, 1300, 1400, 1900], 3)).to eq 2
    expect(interpolationSearch([1, 2, 3, 700, 800, 1200, 1300, 1400, 1900], 700)).to eq 3
    expect(interpolationSearch([1, 2, 3, 700, 800, 1200, 1300, 1400, 1900], 800)).to eq 4
    expect(interpolationSearch([0, 2, 3, 700, 800, 1200, 1300, 1400, 1900], 1200)).to eq 5
    expect(interpolationSearch([1, 2, 3, 700, 800, 1200, 1300, 1400, 19000], 800)).to eq 4
    expect(interpolationSearch([0, 10, 11, 12, 13, 14, 15], 10)).to eq 1
  end

end
