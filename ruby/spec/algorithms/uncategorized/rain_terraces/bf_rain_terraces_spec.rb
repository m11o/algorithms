    
describe bfRainTerraces do
  it 'should find the amount of water collected after raining' do
    expect(bfRainTerraces([1])).to eq 0
    expect(bfRainTerraces([1, 0])).to eq 0
    expect(bfRainTerraces([0, 1])).to eq 0
    expect(bfRainTerraces([0, 1, 0])).to eq 0
    expect(bfRainTerraces([0, 1, 0, 0])).to eq 0
    expect(bfRainTerraces([0, 1, 0, 0, 1, 0])).to eq 2
    expect(bfRainTerraces([0, 2, 0, 0, 1, 0])).to eq 2
    expect(bfRainTerraces([2, 0, 2])).to eq 2
    expect(bfRainTerraces([2, 0, 5])).to eq 2
    expect(bfRainTerraces([3, 0, 0, 2, 0, 4])).to eq 10
    expect(bfRainTerraces([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1])).to eq 6
    expect(bfRainTerraces([1, 1, 1, 1, 1])).to eq 0
    expect(bfRainTerraces([1, 2, 3, 4, 5])).to eq 0
    expect(bfRainTerraces([4, 1, 3, 1, 2, 1, 2, 1])).to eq 4
    expect(bfRainTerraces([0, 2, 4, 3, 4, 2, 4, 0, 8, 7, 0])).to eq 7
  end

end
