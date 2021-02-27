    
describe switchSign do
  it 'should switch the sign of the number using twos complement approach' do
    expect(switchSign(0)).to be 0
    expect(switchSign(1)).to be -1
    expect(switchSign(-1)).to be 1
    expect(switchSign(32)).to be -32
    expect(switchSign(-32)).to be 32
    expect(switchSign(23)).to be -23
    expect(switchSign(-23)).to be 23
  end

end
