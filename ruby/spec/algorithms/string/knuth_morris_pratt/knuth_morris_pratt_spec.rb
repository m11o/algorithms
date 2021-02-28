    
describe knuthMorrisPratt do
  it 'should find word position in given text' do
    expect(knuthMorrisPratt('', '')).to eq 0
    expect(knuthMorrisPratt('a', '')).to eq 0
    expect(knuthMorrisPratt('a', 'a')).to eq 0
    expect(knuthMorrisPratt('abcbcglx', 'abca')).to eq -1
    expect(knuthMorrisPratt('abcbcglx', 'bcgl')).to eq 3
    expect(knuthMorrisPratt('abcxabcdabxabcdabcdabcy', 'abcdabcy')).to eq 15
    expect(knuthMorrisPratt('abcxabcdabxabcdabcdabcy', 'abcdabca')).to eq -1
    expect(knuthMorrisPratt('abcxabcdabxaabcdabcabcdabcdabcy', 'abcdabca')).to eq 12
    expect(knuthMorrisPratt('abcxabcdabxaabaabaaaabcdabcdabcy', 'aabaabaaa')).to eq 11
  end

end
