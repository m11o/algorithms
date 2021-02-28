    
describe rabinKarp do
  it 'should find substring in a string' do
    expect(rabinKarp('', '')).to eq 0
    expect(rabinKarp('a', '')).to eq 0
    expect(rabinKarp('a', 'a')).to eq 0
    expect(rabinKarp('ab', 'b')).to eq 1
    expect(rabinKarp('abcbcglx', 'abca')).to eq -1
    expect(rabinKarp('abcbcglx', 'bcgl')).to eq 3
    expect(rabinKarp('abcxabcdabxabcdabcdabcy', 'abcdabcy')).to eq 15
    expect(rabinKarp('abcxabcdabxabcdabcdabcy', 'abcdabca')).to eq -1
    expect(rabinKarp('abcxabcdabxaabcdabcabcdabcdabcy', 'abcdabca')).to eq 12
    expect(rabinKarp('abcxabcdabxaabaabaaaabcdabcdabcy', 'aabaabaaa')).to eq 11
    expect(rabinKarp('^ !/\'#\'pp', ' !/\'#\'pp')).to eq 1
  end

    
  it 'should work with bigger texts' do
    const text = 'Lorem Ipsum is simply dummy text of the printing and '

    + 'typesetting industry. Lorem Ipsum has been the industry\'s standard '

    + 'dummy text ever since the 1500s, when an unknown printer took a '

    + 'galley of type and scrambled it to make a type specimen book. It '

    + 'has survived not only five centuries, but also the leap into '

    + 'electronic typesetting, remaining essentially unchanged. It was '

    + 'popularised in the 1960s with the release of Letraset sheets '

    + 'containing Lorem Ipsum passages, and more recently with desktop'

    + 'publishing software like Aldus PageMaker including versions of Lorem '

    + 'Ipsum.';

    
    expect(rabinKarp(text, 'Lorem')).to eq 0
    expect(rabinKarp(text, 'versions')).to eq 549
    expect(rabinKarp(text, 'versions of Lorem Ipsum.')).to eq 549
    expect(rabinKarp(text, 'versions of Lorem Ipsum:')).to eq -1
    expect(rabinKarp(text, 'Lorem Ipsum passages, and more recently with')).to eq 446
  end

    
  it 'should work with UTF symbols' do
    expect(rabinKarp('a\u{ffff}', '\u{ffff}')).to eq 1
    expect(rabinKarp('\u0000耀\u0000', '耀\u0000')).to eq 1
    // @TODO: Provide Unicode support.

    expect(rabinKarp('a\u{20000}', '\u{20000}')).to eq 1
  end

end
