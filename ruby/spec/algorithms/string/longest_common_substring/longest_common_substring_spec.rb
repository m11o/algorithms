    
xdescribe longestCommonSubstring do
  it 'should find longest common substring between two strings' do
    expect(longestCommonSubstring('', '')).to eq ''
    expect(longestCommonSubstring('ABC', '')).to eq ''
    expect(longestCommonSubstring('', 'ABC')).to eq ''
    expect(longestCommonSubstring('ABABC', 'BABCA')).to eq 'BABC'
    expect(longestCommonSubstring('BABCA', 'ABCBA')).to eq 'ABC'
    expect(longestCommonSubstring(

    'Algorithms and data structures implemented in JavaScript',

    'Here you may find Algorithms and data structures that are implemented in JavaScript',

    )).toBe('Algorithms and data structures ');

  end

    
  it 'should handle unicode correctly' do
    expect(longestCommonSubstring('𐌵𐌵**ABC', '𐌵𐌵--ABC')).to eq 'ABC'
    expect(longestCommonSubstring('𐌵𐌵**A', '𐌵𐌵--A')).to eq '𐌵𐌵'
    expect(longestCommonSubstring('A买B时', '买B时GD')).to eq '买B时'
    expect(longestCommonSubstring('After test买时 case', 'another_test买时')).to eq 'test买时'
  end

end
