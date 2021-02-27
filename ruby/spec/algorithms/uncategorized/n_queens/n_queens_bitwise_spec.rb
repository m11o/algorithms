    
describe nQueensBitwise do
  it 'should have solutions for 4 to N queens' do
    expect(nQueensBitwise(4)).to be 2
    expect(nQueensBitwise(5)).to be 10
    expect(nQueensBitwise(6)).to be 4
    expect(nQueensBitwise(7)).to be 40
    expect(nQueensBitwise(8)).to be 92
    expect(nQueensBitwise(9)).to be 352
    expect(nQueensBitwise(10)).to be 724
    expect(nQueensBitwise(11)).to be 2680
  end

end
