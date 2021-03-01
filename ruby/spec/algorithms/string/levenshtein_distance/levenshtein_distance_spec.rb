    
xdescribe levenshteinDistance do
  it 'should calculate edit distance between two strings' do
    expect(levenshteinDistance('', '')).to eq 0
    expect(levenshteinDistance('a', '')).to eq 1
    expect(levenshteinDistance('', 'a')).to eq 1
    expect(levenshteinDistance('abc', '')).to eq 3
    expect(levenshteinDistance('', 'abc')).to eq 3
    
    // Should just add I to the beginning.

    expect(levenshteinDistance('islander', 'slander')).to eq 1
    
    // Needs to substitute M by K, T by M and add an A to the end

    expect(levenshteinDistance('mart', 'karma')).to eq 3
    
    // Substitute K by S, E by I and insert G at the end.

    expect(levenshteinDistance('kitten', 'sitting')).to eq 3
    
    // Should add 4 letters FOOT at the beginning.

    expect(levenshteinDistance('ball', 'football')).to eq 4
    
    // Should delete 4 letters FOOT at the beginning.

    expect(levenshteinDistance('football', 'foot')).to eq 4
    
    // Needs to substitute the first 5 chars: INTEN by EXECU

    expect(levenshteinDistance('intention', 'execution')).to eq 5
  end

end
