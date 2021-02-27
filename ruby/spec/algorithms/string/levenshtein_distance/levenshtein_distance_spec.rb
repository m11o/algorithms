    
describe levenshteinDistance do
  it 'should calculate edit distance between two strings' do
    expect(levenshteinDistance('', '')).to be 0
    expect(levenshteinDistance('a', '')).to be 1
    expect(levenshteinDistance('', 'a')).to be 1
    expect(levenshteinDistance('abc', '')).to be 3
    expect(levenshteinDistance('', 'abc')).to be 3
    
    // Should just add I to the beginning.

    expect(levenshteinDistance('islander', 'slander')).to be 1
    
    // Needs to substitute M by K, T by M and add an A to the end

    expect(levenshteinDistance('mart', 'karma')).to be 3
    
    // Substitute K by S, E by I and insert G at the end.

    expect(levenshteinDistance('kitten', 'sitting')).to be 3
    
    // Should add 4 letters FOOT at the beginning.

    expect(levenshteinDistance('ball', 'football')).to be 4
    
    // Should delete 4 letters FOOT at the beginning.

    expect(levenshteinDistance('football', 'foot')).to be 4
    
    // Needs to substitute the first 5 chars: INTEN by EXECU

    expect(levenshteinDistance('intention', 'execution')).to be 5
  end

end
