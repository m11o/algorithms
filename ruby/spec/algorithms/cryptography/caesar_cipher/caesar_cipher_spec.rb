    
describe caesarCipher do
  it 'should not change a string with zero shift' do
    expect(caesarCipherEncrypt('abcd', 0)).to be 'abcd'
    expect(caesarCipherDecrypt('abcd', 0)).to be 'abcd'
  end

    
  it 'should cipher a string with different shifts' do
    expect(caesarCipherEncrypt('abcde', 3)).to be 'defgh'
    expect(caesarCipherDecrypt('defgh', 3)).to be 'abcde'
    
    expect(caesarCipherEncrypt('abcde', 1)).to be 'bcdef'
    expect(caesarCipherDecrypt('bcdef', 1)).to be 'abcde'
    
    expect(caesarCipherEncrypt('xyz', 1)).to be 'yza'
    expect(caesarCipherDecrypt('yza', 1)).to be 'xyz'
  end

    
  it 'should be case insensitive' do
    expect(caesarCipherEncrypt('ABCDE', 3)).to be 'defgh'
  end

    
  it 'should correctly handle an empty strings' do
    expect(caesarCipherEncrypt('', 3)).to be ''
  end

    
  it 'should not cipher unknown chars' do
    expect(caesarCipherEncrypt('ab2cde', 3)).to be 'de2fgh'
    expect(caesarCipherDecrypt('de2fgh', 3)).to be 'ab2cde'
  end

    
  it 'should encrypt and decrypt full phrases' do
    expect(caesarCipherEncrypt('THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG', 23))

    .toBe('qeb nrfzh yoltk clu grjmp lsbo qeb ixwv ald');

    
    expect(caesarCipherDecrypt('qeb nrfzh yoltk clu grjmp lsbo qeb ixwv ald', 23))

    .toBe('the quick brown fox jumps over the lazy dog');

  end

end
