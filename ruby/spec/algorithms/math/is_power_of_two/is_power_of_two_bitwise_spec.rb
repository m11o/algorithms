    
xdescribe isPowerOfTwoBitwise do
  it 'should check if the number is made by multiplying twos' do
    expect(isPowerOfTwoBitwise(-1)).to eq false
    expect(isPowerOfTwoBitwise(0)).to eq false
    expect(isPowerOfTwoBitwise(1)).to eq true
    expect(isPowerOfTwoBitwise(2)).to eq true
    expect(isPowerOfTwoBitwise(3)).to eq false
    expect(isPowerOfTwoBitwise(4)).to eq true
    expect(isPowerOfTwoBitwise(5)).to eq false
    expect(isPowerOfTwoBitwise(6)).to eq false
    expect(isPowerOfTwoBitwise(7)).to eq false
    expect(isPowerOfTwoBitwise(8)).to eq true
    expect(isPowerOfTwoBitwise(10)).to eq false
    expect(isPowerOfTwoBitwise(12)).to eq false
    expect(isPowerOfTwoBitwise(16)).to eq true
    expect(isPowerOfTwoBitwise(31)).to eq false
    expect(isPowerOfTwoBitwise(64)).to eq true
    expect(isPowerOfTwoBitwise(1024)).to eq true
    expect(isPowerOfTwoBitwise(1023)).to eq false
  end

end
