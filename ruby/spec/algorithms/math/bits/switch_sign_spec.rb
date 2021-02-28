    
describe switchSign do
  it 'should switch the sign of the number using twos complement approach' do
    expect(switchSign(0)).to eq 0
    expect(switchSign(1)).to eq -1
    expect(switchSign(-1)).to eq 1
    expect(switchSign(32)).to eq -32
    expect(switchSign(-32)).to eq 32
    expect(switchSign(23)).to eq -23
    expect(switchSign(-23)).to eq 23
  end

end
