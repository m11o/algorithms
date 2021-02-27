    
describe rabinKarp do
  it 'should find substring in a string' do
    expect(rabinKarp('', '')).to be 0
    expect(rabinKarp('a', '')).to be 0
    expect(rabinKarp('a', 'a')).to be 0
    expect(rabinKarp('ab', 'b')).to be 1
    expect(rabinKarp('abcbcglx', 'abca')).to be -1
    expect(rabinKarp('abcbcglx', 'bcgl')).to be 3
    expect(rabinKarp('abcxabcdabxabcdabcdabcy', 'abcdabcy')).to be 15
    expect(rabinKarp('abcxabcdabxabcdabcdabcy', 'abcdabca')).to be -1
    expect(rabinKarp('abcxabcdabxaabcdabcabcdabcdabcy', 'abcdabca')).to be 12
    expect(rabinKarp('abcxabcdabxaabaabaaaabcdabcdabcy', 'aabaabaaa')).to be 11
    expect(rabinKarp('^ !/\'#\'pp', ' !/\'#\'pp')).to be 1
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

    
    expect(rabinKarp(text, 'Lorem')).to be 0
    expect(rabinKarp(text, 'versions')).to be 549
    expect(rabinKarp(text, 'versions of Lorem Ipsum.')).to be 549
    expect(rabinKarp(text, 'versions of Lorem Ipsum:')).to be -1
    expect(rabinKarp(text, 'Lorem Ipsum passages, and more recently with')).to be 446
  end

    
  it 'should work with UTF symbols' do
    expect(rabinKarp('a\u{ffff}', '\u{ffff}')).to be 1
    expect(rabinKarp('\u0000耀\u0000', '耀\u0000')).to be 1
    // @TODO: Provide Unicode support.

    expect(rabinKarp('a\u{20000}', '\u{20000}')).to be 1
  end

end
