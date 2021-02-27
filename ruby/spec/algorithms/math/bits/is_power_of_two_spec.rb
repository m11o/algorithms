    
describe isPowerOfTwo do
  it 'should detect if the number is power of two' do
    expect(isPowerOfTwo(1)).to be true
    expect(isPowerOfTwo(2)).to be true
    expect(isPowerOfTwo(3)).to be false
    expect(isPowerOfTwo(4)).to be true
    expect(isPowerOfTwo(5)).to be false
    expect(isPowerOfTwo(6)).to be false
    expect(isPowerOfTwo(7)).to be false
    expect(isPowerOfTwo(8)).to be true
    expect(isPowerOfTwo(9)).to be false
    expect(isPowerOfTwo(16)).to be true
    expect(isPowerOfTwo(23)).to be false
    expect(isPowerOfTwo(32)).to be true
    expect(isPowerOfTwo(127)).to be false
    expect(isPowerOfTwo(128)).to be true
  end

end
