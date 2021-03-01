    
xdescribe radianToDegree do
  it 'should convert radian to degree' do
    expect(radianToDegree(0)).to eq 0
    expect(radianToDegree(Math.PI / 4)).to eq 45
    expect(radianToDegree(Math.PI / 2)).to eq 90
    expect(radianToDegree(Math.PI)).to eq 180
    expect(radianToDegree((3 * Math.PI) / 2)).to eq 270
    expect(radianToDegree(2 * Math.PI)).to eq 360
  end

end
