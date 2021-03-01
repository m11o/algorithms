    
describe hornerMethod do
  it 'should evaluate the polynomial for the specified value of x correctly' do
    expect(hornerMethod([8], 0.1)).to eq 8
    expect(hornerMethod([2, 4, 2, 5], 0.555)).to eq 7.68400775
    expect(hornerMethod([2, 4, 2, 5], 0.75)).to eq 9.59375
    expect(hornerMethod([1, 1, 1, 1, 1], 1.75)).to eq 20.55078125
    expect(hornerMethod([15, 3.5, 0, 2, 1.42, 0.41], 0.315)).to eq 1.136730065140625
    expect(hornerMethod([0, 0, 2.77, 1.42, 0.41], 1.35)).to eq 7.375325000000001
    expect(hornerMethod([0, 0, 2.77, 1.42, 2.3311], 1.35)).to eq 9.296425000000001
    expect(hornerMethod([2, 0, 0, 5.757, 5.31412, 12.3213], 3.141)).to eq 697.2731167035034
  end

    
  it 'should evaluate the same polynomial value as classical approach' do
    expect(hornerMethod([8], 0.1)).to eq classicPolynome([8], 0.1)
    expect(hornerMethod([2, 4, 2, 5], 0.555)).to eq classicPolynome([2, 4, 2, 5], 0.555)
    expect(hornerMethod([2, 4, 2, 5], 0.75)).to eq classicPolynome([2, 4, 2, 5], 0.75)
  end

end
