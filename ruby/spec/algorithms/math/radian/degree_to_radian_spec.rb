    
describe degreeToRadian do
  it 'should convert degree to radian' do
    expect(degreeToRadian(0)).to be 0
    expect(degreeToRadian(45)).to be Math.PI / 4
    expect(degreeToRadian(90)).to be Math.PI / 2
    expect(degreeToRadian(180)).to be Math.PI
    expect(degreeToRadian(270)).to be (3 * Math.PI) / 2
    expect(degreeToRadian(360)).to be 2 * Math.PI
  end

end
