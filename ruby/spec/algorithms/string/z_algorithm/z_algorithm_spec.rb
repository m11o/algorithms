    
describe zAlgorithm do
  it 'should find word positions in given text' do
    expect(zAlgorithm('abcbcglx', 'abca')).to eq []
    expect(zAlgorithm('abca', 'abca')).to eq [0]
    expect(zAlgorithm('abca', 'abcadfd')).to eq []
    expect(zAlgorithm('abcbcglabcx', 'abc')).to eq [0, 7]
    expect(zAlgorithm('abcbcglx', 'bcgl')).to eq [3]
    expect(zAlgorithm('abcbcglx', 'cglx')).to eq [4]
    expect(zAlgorithm('abcxabcdabxabcdabcdabcy', 'abcdabcy')).to eq [15]
    expect(zAlgorithm('abcxabcdabxabcdabcdabcy', 'abcdabca')).to eq []
    expect(zAlgorithm('abcxabcdabxaabcdabcabcdabcdabcy', 'abcdabca')).to eq [12]
    expect(zAlgorithm('abcxabcdabxaabaabaaaabcdabcdabcy', 'aabaabaaa')).to eq [11]
  end

end
