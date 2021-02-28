    
describe multiply do
  it 'should multiply two numbers' do
    expect(multiply(0, 0)).to eq 0
    expect(multiply(2, 0)).to eq 0
    expect(multiply(0, 2)).to eq 0
    expect(multiply(1, 2)).to eq 2
    expect(multiply(2, 1)).to eq 2
    expect(multiply(6, 6)).to eq 36
    expect(multiply(-2, 4)).to eq -8
    expect(multiply(4, -2)).to eq -8
    expect(multiply(-4, -4)).to eq 16
    expect(multiply(4, -5)).to eq -20
    expect(multiply(2, 121)).to eq 242
    expect(multiply(121, 2)).to eq 242
  end

end
