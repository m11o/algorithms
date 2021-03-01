    
xdescribe recursiveStaircaseIT do
  it 'should calculate number of variants using Iterative solution' do
    expect(recursiveStaircaseIT(-1)).to eq 0
    expect(recursiveStaircaseIT(0)).to eq 0
    expect(recursiveStaircaseIT(1)).to eq 1
    expect(recursiveStaircaseIT(2)).to eq 2
    expect(recursiveStaircaseIT(3)).to eq 3
    expect(recursiveStaircaseIT(4)).to eq 5
    expect(recursiveStaircaseIT(5)).to eq 8
    expect(recursiveStaircaseIT(6)).to eq 13
    expect(recursiveStaircaseIT(7)).to eq 21
    expect(recursiveStaircaseIT(8)).to eq 34
    expect(recursiveStaircaseIT(9)).to eq 55
    expect(recursiveStaircaseIT(10)).to eq 89
  end

end
