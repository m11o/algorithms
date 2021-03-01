    
xdescribe fastPowering do
  it 'should compute power in log(n) time' do
    expect(fastPowering(1, 1)).to eq 1
    expect(fastPowering(2, 0)).to eq 1
    expect(fastPowering(2, 2)).to eq 4
    expect(fastPowering(2, 3)).to eq 8
    expect(fastPowering(2, 4)).to eq 16
    expect(fastPowering(2, 5)).to eq 32
    expect(fastPowering(2, 6)).to eq 64
    expect(fastPowering(2, 7)).to eq 128
    expect(fastPowering(2, 8)).to eq 256
    expect(fastPowering(3, 4)).to eq 81
    expect(fastPowering(190, 2)).to eq 36100
    expect(fastPowering(11, 5)).to eq 161051
    expect(fastPowering(13, 11)).to eq 1792160394037
    expect(fastPowering(9, 16)).to eq 1853020188851841
    expect(fastPowering(16, 16)).to eq 18446744073709552000
    expect(fastPowering(7, 21)).to eq 558545864083284000
    expect(fastPowering(100, 9)).to eq 1000000000000000000
  end

end
