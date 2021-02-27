    
describe isPowerOfTwo do
  it 'should check if the number is made by multiplying twos' do
    expect(isPowerOfTwo(-1)).to be false
    expect(isPowerOfTwo(0)).to be false
    expect(isPowerOfTwo(1)).to be true
    expect(isPowerOfTwo(2)).to be true
    expect(isPowerOfTwo(3)).to be false
    expect(isPowerOfTwo(4)).to be true
    expect(isPowerOfTwo(5)).to be false
    expect(isPowerOfTwo(6)).to be false
    expect(isPowerOfTwo(7)).to be false
    expect(isPowerOfTwo(8)).to be true
    expect(isPowerOfTwo(10)).to be false
    expect(isPowerOfTwo(12)).to be false
    expect(isPowerOfTwo(16)).to be true
    expect(isPowerOfTwo(31)).to be false
    expect(isPowerOfTwo(64)).to be true
    expect(isPowerOfTwo(1024)).to be true
    expect(isPowerOfTwo(1023)).to be false
  end

end
