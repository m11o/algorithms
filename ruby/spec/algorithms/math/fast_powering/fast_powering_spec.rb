    
describe fastPowering do
  it 'should compute power in log(n) time' do
    expect(fastPowering(1, 1)).to be 1
    expect(fastPowering(2, 0)).to be 1
    expect(fastPowering(2, 2)).to be 4
    expect(fastPowering(2, 3)).to be 8
    expect(fastPowering(2, 4)).to be 16
    expect(fastPowering(2, 5)).to be 32
    expect(fastPowering(2, 6)).to be 64
    expect(fastPowering(2, 7)).to be 128
    expect(fastPowering(2, 8)).to be 256
    expect(fastPowering(3, 4)).to be 81
    expect(fastPowering(190, 2)).to be 36100
    expect(fastPowering(11, 5)).to be 161051
    expect(fastPowering(13, 11)).to be 1792160394037
    expect(fastPowering(9, 16)).to be 1853020188851841
    expect(fastPowering(16, 16)).to be 18446744073709552000
    expect(fastPowering(7, 21)).to be 558545864083284000
    expect(fastPowering(100, 9)).to be 1000000000000000000
  end

end
