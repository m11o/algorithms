    
describe regularExpressionMatching do
  it 'should match regular expressions in a string' do
    expect(regularExpressionMatching('', '')).to eq true
    expect(regularExpressionMatching('a', 'a')).to eq true
    expect(regularExpressionMatching('aa', 'aa')).to eq true
    expect(regularExpressionMatching('aab', 'aab')).to eq true
    expect(regularExpressionMatching('aab', 'aa.')).to eq true
    expect(regularExpressionMatching('aab', '.a.')).to eq true
    expect(regularExpressionMatching('aab', '...')).to eq true
    expect(regularExpressionMatching('a', 'a*')).to eq true
    expect(regularExpressionMatching('aaa', 'a*')).to eq true
    expect(regularExpressionMatching('aaab', 'a*b')).to eq true
    expect(regularExpressionMatching('aaabb', 'a*b*')).to eq true
    expect(regularExpressionMatching('aaabb', 'a*b*c*')).to eq true
    expect(regularExpressionMatching('', 'a*')).to eq true
    expect(regularExpressionMatching('xaabyc', 'xa*b.c')).to eq true
    expect(regularExpressionMatching('aab', 'c*a*b*')).to eq true
    expect(regularExpressionMatching('mississippi', 'mis*is*.p*.')).to eq true
    expect(regularExpressionMatching('ab', '.*')).to eq true
    
    expect(regularExpressionMatching('', 'a')).to eq false
    expect(regularExpressionMatching('a', '')).to eq false
    expect(regularExpressionMatching('aab', 'aa')).to eq false
    expect(regularExpressionMatching('aab', 'baa')).to eq false
    expect(regularExpressionMatching('aabc', '...')).to eq false
    expect(regularExpressionMatching('aaabbdd', 'a*b*c*')).to eq false
    expect(regularExpressionMatching('mississippi', 'mis*is*p*.')).to eq false
    expect(regularExpressionMatching('ab', 'a*')).to eq false
    expect(regularExpressionMatching('abba', 'a*b*.c')).to eq false
    expect(regularExpressionMatching('abba', '.*c')).to eq false
  end

end
