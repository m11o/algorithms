    
xdescribe recursiveStaircaseBF do
  it 'should calculate number of variants using Brute Force solution' do
    expect(recursiveStaircaseBF(-1)).to eq 0
    expect(recursiveStaircaseBF(0)).to eq 0
    expect(recursiveStaircaseBF(1)).to eq 1
    expect(recursiveStaircaseBF(2)).to eq 2
    expect(recursiveStaircaseBF(3)).to eq 3
    expect(recursiveStaircaseBF(4)).to eq 5
    expect(recursiveStaircaseBF(5)).to eq 8
    expect(recursiveStaircaseBF(6)).to eq 13
    expect(recursiveStaircaseBF(7)).to eq 21
    expect(recursiveStaircaseBF(8)).to eq 34
    expect(recursiveStaircaseBF(9)).to eq 55
    expect(recursiveStaircaseBF(10)).to eq 89
  end

end
