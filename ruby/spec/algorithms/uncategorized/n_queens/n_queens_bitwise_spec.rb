    
xdescribe nQueensBitwise do
  it 'should have solutions for 4 to N queens' do
    expect(nQueensBitwise(4)).to eq 2
    expect(nQueensBitwise(5)).to eq 10
    expect(nQueensBitwise(6)).to eq 4
    expect(nQueensBitwise(7)).to eq 40
    expect(nQueensBitwise(8)).to eq 92
    expect(nQueensBitwise(9)).to eq 352
    expect(nQueensBitwise(10)).to eq 724
    expect(nQueensBitwise(11)).to eq 2680
  end

end
