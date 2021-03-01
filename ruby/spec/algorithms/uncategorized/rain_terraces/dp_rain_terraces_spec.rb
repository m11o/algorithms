    
xdescribe dpRainTerraces do
  it 'should find the amount of water collected after raining' do
    expect(dpRainTerraces([1])).to eq 0
    expect(dpRainTerraces([1, 0])).to eq 0
    expect(dpRainTerraces([0, 1])).to eq 0
    expect(dpRainTerraces([0, 1, 0])).to eq 0
    expect(dpRainTerraces([0, 1, 0, 0])).to eq 0
    expect(dpRainTerraces([0, 1, 0, 0, 1, 0])).to eq 2
    expect(dpRainTerraces([0, 2, 0, 0, 1, 0])).to eq 2
    expect(dpRainTerraces([2, 0, 2])).to eq 2
    expect(dpRainTerraces([2, 0, 5])).to eq 2
    expect(dpRainTerraces([3, 0, 0, 2, 0, 4])).to eq 10
    expect(dpRainTerraces([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1])).to eq 6
    expect(dpRainTerraces([1, 1, 1, 1, 1])).to eq 0
    expect(dpRainTerraces([1, 2, 3, 4, 5])).to eq 0
    expect(dpRainTerraces([4, 1, 3, 1, 2, 1, 2, 1])).to eq 4
    expect(dpRainTerraces([0, 2, 4, 3, 4, 2, 4, 0, 8, 7, 0])).to eq 7
  end

end
