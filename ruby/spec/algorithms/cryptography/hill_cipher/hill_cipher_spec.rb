    
describe hillCipher do
  it 'should throw an exception when trying to decipher' do
    expect(hillCipherDecrypt).to toThrowError('This method is not implemented yet')
  end

    
  it 'should throw an error when message or keyString contains none letter character' do
    const invalidCharacterInMessage = () => {

    hillCipherEncrypt('hell3', 'helloworld');

    };

    const invalidCharacterInKeyString = () => {

    hillCipherEncrypt('hello', 'hel12world');

    };

    expect(invalidCharacterInMessage).toThrowError(

    'The message and key string can only contain letters',

    );

    expect(invalidCharacterInKeyString).toThrowError(

    'The message and key string can only contain letters',

    );

  end

    
  it 'should throw an error when the length of the keyString has a square root which is not integer' do
    const invalidLengthOfKeyString = () => {

    hillCipherEncrypt('ab', 'ab');

    };

    expect(invalidLengthOfKeyString).toThrowError(

    'Invalid key string length. The square root of the key string must be an integer',

    );

  end

    
  it 'should throw an error when the length of the keyString does not equal to the power of length of the message' do
    const invalidLengthOfKeyString = () => {

    hillCipherEncrypt('ab', 'aaabbbccc');

    };

    expect(invalidLengthOfKeyString).toThrowError(

    'Invalid key string length. The key length must be a square of message length',

    );

  end

    
  it 'should encrypt passed message using Hill Cipher' do
    expect(hillCipherEncrypt('ACT', 'GYBNQKURP')).to eq 'POH'
    expect(hillCipherEncrypt('CAT', 'GYBNQKURP')).to eq 'FIN'
    expect(hillCipherEncrypt('GFG', 'HILLMAGIC')).to eq 'SWK'
  end

end
