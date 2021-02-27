    
describe knuthMorrisPratt do
  it 'should find word position in given text' do
    expect(knuthMorrisPratt('', '')).to be 0
    expect(knuthMorrisPratt('a', '')).to be 0
    expect(knuthMorrisPratt('a', 'a')).to be 0
    expect(knuthMorrisPratt('abcbcglx', 'abca')).to be -1
    expect(knuthMorrisPratt('abcbcglx', 'bcgl')).to be 3
    expect(knuthMorrisPratt('abcxabcdabxabcdabcdabcy', 'abcdabcy')).to be 15
    expect(knuthMorrisPratt('abcxabcdabxabcdabcdabcy', 'abcdabca')).to be -1
    expect(knuthMorrisPratt('abcxabcdabxaabcdabcabcdabcdabcy', 'abcdabca')).to be 12
    expect(knuthMorrisPratt('abcxabcdabxaabaabaaaabcdabcdabcy', 'aabaabaaa')).to be 11
  end

end
