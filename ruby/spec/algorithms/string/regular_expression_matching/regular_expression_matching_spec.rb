    
describe regularExpressionMatching do
  it 'should match regular expressions in a string' do
    expect(regularExpressionMatching('', '')).to be true
    expect(regularExpressionMatching('a', 'a')).to be true
    expect(regularExpressionMatching('aa', 'aa')).to be true
    expect(regularExpressionMatching('aab', 'aab')).to be true
    expect(regularExpressionMatching('aab', 'aa.')).to be true
    expect(regularExpressionMatching('aab', '.a.')).to be true
    expect(regularExpressionMatching('aab', '...')).to be true
    expect(regularExpressionMatching('a', 'a*')).to be true
    expect(regularExpressionMatching('aaa', 'a*')).to be true
    expect(regularExpressionMatching('aaab', 'a*b')).to be true
    expect(regularExpressionMatching('aaabb', 'a*b*')).to be true
    expect(regularExpressionMatching('aaabb', 'a*b*c*')).to be true
    expect(regularExpressionMatching('', 'a*')).to be true
    expect(regularExpressionMatching('xaabyc', 'xa*b.c')).to be true
    expect(regularExpressionMatching('aab', 'c*a*b*')).to be true
    expect(regularExpressionMatching('mississippi', 'mis*is*.p*.')).to be true
    expect(regularExpressionMatching('ab', '.*')).to be true
    
    expect(regularExpressionMatching('', 'a')).to be false
    expect(regularExpressionMatching('a', '')).to be false
    expect(regularExpressionMatching('aab', 'aa')).to be false
    expect(regularExpressionMatching('aab', 'baa')).to be false
    expect(regularExpressionMatching('aabc', '...')).to be false
    expect(regularExpressionMatching('aaabbdd', 'a*b*c*')).to be false
    expect(regularExpressionMatching('mississippi', 'mis*is*p*.')).to be false
    expect(regularExpressionMatching('ab', 'a*')).to be false
    expect(regularExpressionMatching('abba', 'a*b*.c')).to be false
    expect(regularExpressionMatching('abba', '.*c')).to be false
  end

end
