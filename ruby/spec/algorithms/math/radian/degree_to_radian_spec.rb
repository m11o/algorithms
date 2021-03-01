    
describe degreeToRadian do
  it 'should convert degree to radian' do
    expect(degreeToRadian(0)).to eq 0
    expect(degreeToRadian(45)).to eq Math.PI / 4
    expect(degreeToRadian(90)).to eq Math.PI / 2
    expect(degreeToRadian(180)).to eq Math.PI
    expect(degreeToRadian(270)).to eq (3 * Math.PI) / 2
    expect(degreeToRadian(360)).to eq 2 * Math.PI
  end

end
