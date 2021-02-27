    
describe isPowerOfTwoBitwise do
  it 'should check if the number is made by multiplying twos' do
    expect(isPowerOfTwoBitwise(-1)).to be false
    expect(isPowerOfTwoBitwise(0)).to be false
    expect(isPowerOfTwoBitwise(1)).to be true
    expect(isPowerOfTwoBitwise(2)).to be true
    expect(isPowerOfTwoBitwise(3)).to be false
    expect(isPowerOfTwoBitwise(4)).to be true
    expect(isPowerOfTwoBitwise(5)).to be false
    expect(isPowerOfTwoBitwise(6)).to be false
    expect(isPowerOfTwoBitwise(7)).to be false
    expect(isPowerOfTwoBitwise(8)).to be true
    expect(isPowerOfTwoBitwise(10)).to be false
    expect(isPowerOfTwoBitwise(12)).to be false
    expect(isPowerOfTwoBitwise(16)).to be true
    expect(isPowerOfTwoBitwise(31)).to be false
    expect(isPowerOfTwoBitwise(64)).to be true
    expect(isPowerOfTwoBitwise(1024)).to be true
    expect(isPowerOfTwoBitwise(1023)).to be false
  end

end
