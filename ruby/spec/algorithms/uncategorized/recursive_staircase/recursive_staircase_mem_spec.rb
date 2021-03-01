    
xdescribe recursiveStaircaseMEM do
  it 'should calculate number of variants using Brute Force with Memoization' do
    expect(recursiveStaircaseMEM(-1)).to eq 0
    expect(recursiveStaircaseMEM(0)).to eq 0
    expect(recursiveStaircaseMEM(1)).to eq 1
    expect(recursiveStaircaseMEM(2)).to eq 2
    expect(recursiveStaircaseMEM(3)).to eq 3
    expect(recursiveStaircaseMEM(4)).to eq 5
    expect(recursiveStaircaseMEM(5)).to eq 8
    expect(recursiveStaircaseMEM(6)).to eq 13
    expect(recursiveStaircaseMEM(7)).to eq 21
    expect(recursiveStaircaseMEM(8)).to eq 34
    expect(recursiveStaircaseMEM(9)).to eq 55
    expect(recursiveStaircaseMEM(10)).to eq 89
  end

end
