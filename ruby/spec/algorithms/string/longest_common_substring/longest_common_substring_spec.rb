    
describe longestCommonSubstring do
  it 'should find longest common substring between two strings' do
    expect(longestCommonSubstring('', '')).to be ''
    expect(longestCommonSubstring('ABC', '')).to be ''
    expect(longestCommonSubstring('', 'ABC')).to be ''
    expect(longestCommonSubstring('ABABC', 'BABCA')).to be 'BABC'
    expect(longestCommonSubstring('BABCA', 'ABCBA')).to be 'ABC'
    expect(longestCommonSubstring(

    'Algorithms and data structures implemented in JavaScript',

    'Here you may find Algorithms and data structures that are implemented in JavaScript',

    )).toBe('Algorithms and data structures ');

  end

    
  it 'should handle unicode correctly' do
    expect(longestCommonSubstring('𐌵𐌵**ABC', '𐌵𐌵--ABC')).to be 'ABC'
    expect(longestCommonSubstring('𐌵𐌵**A', '𐌵𐌵--A')).to be '𐌵𐌵'
    expect(longestCommonSubstring('A买B时', '买B时GD')).to be '买B时'
    expect(longestCommonSubstring('After test买时 case', 'another_test买时')).to be 'test买时'
  end

end
