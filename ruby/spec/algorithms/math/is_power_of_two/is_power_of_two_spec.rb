    
xdescribe isPowerOfTwo do
  it 'should check if the number is made by multiplying twos' do
    expect(isPowerOfTwo(-1)).to eq false
    expect(isPowerOfTwo(0)).to eq false
    expect(isPowerOfTwo(1)).to eq true
    expect(isPowerOfTwo(2)).to eq true
    expect(isPowerOfTwo(3)).to eq false
    expect(isPowerOfTwo(4)).to eq true
    expect(isPowerOfTwo(5)).to eq false
    expect(isPowerOfTwo(6)).to eq false
    expect(isPowerOfTwo(7)).to eq false
    expect(isPowerOfTwo(8)).to eq true
    expect(isPowerOfTwo(10)).to eq false
    expect(isPowerOfTwo(12)).to eq false
    expect(isPowerOfTwo(16)).to eq true
    expect(isPowerOfTwo(31)).to eq false
    expect(isPowerOfTwo(64)).to eq true
    expect(isPowerOfTwo(1024)).to eq true
    expect(isPowerOfTwo(1023)).to eq false
  end

end
