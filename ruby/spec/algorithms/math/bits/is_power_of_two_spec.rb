    
describe isPowerOfTwo do
  it 'should detect if the number is power of two' do
    expect(isPowerOfTwo(1)).to eq true
    expect(isPowerOfTwo(2)).to eq true
    expect(isPowerOfTwo(3)).to eq false
    expect(isPowerOfTwo(4)).to eq true
    expect(isPowerOfTwo(5)).to eq false
    expect(isPowerOfTwo(6)).to eq false
    expect(isPowerOfTwo(7)).to eq false
    expect(isPowerOfTwo(8)).to eq true
    expect(isPowerOfTwo(9)).to eq false
    expect(isPowerOfTwo(16)).to eq true
    expect(isPowerOfTwo(23)).to eq false
    expect(isPowerOfTwo(32)).to eq true
    expect(isPowerOfTwo(127)).to eq false
    expect(isPowerOfTwo(128)).to eq true
  end

end
