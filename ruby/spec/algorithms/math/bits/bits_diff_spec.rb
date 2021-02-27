    
describe bitsDiff do
  it 'should calculate bits difference between two numbers' do
    expect(bitsDiff(0, 0)).to be 0
    expect(bitsDiff(1, 1)).to be 0
    expect(bitsDiff(124, 124)).to be 0
    expect(bitsDiff(0, 1)).to be 1
    expect(bitsDiff(1, 0)).to be 1
    expect(bitsDiff(1, 2)).to be 2
    expect(bitsDiff(1, 3)).to be 1
  end

end
