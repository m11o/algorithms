    
describe radianToDegree do
  it 'should convert radian to degree' do
    expect(radianToDegree(0)).to be 0
    expect(radianToDegree(Math.PI / 4)).to be 45
    expect(radianToDegree(Math.PI / 2)).to be 90
    expect(radianToDegree(Math.PI)).to be 180
    expect(radianToDegree((3 * Math.PI) / 2)).to be 270
    expect(radianToDegree(2 * Math.PI)).to be 360
  end

end
