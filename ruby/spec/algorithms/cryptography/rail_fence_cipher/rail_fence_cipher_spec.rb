    
describe railFenceCipher do
  it 'encodes a string correctly for base=3' do
    expect(encodeRailFenceCipher('', 3)).to be ''
    expect(encodeRailFenceCipher('12345', 3)).toBe(

    '15243',

    );

    expect(encodeRailFenceCipher('WEAREDISCOVEREDFLEEATONCE', 3)).toBe(

    'WECRLTEERDSOEEFEAOCAIVDEN',

    );

    expect(encodeRailFenceCipher('Hello, World!', 3)).toBe(

    'Hoo!el,Wrdl l',

    );

  end

    
  it 'decodes a string correctly for base=3' do
    expect(decodeRailFenceCipher('', 3)).to be ''
    expect(decodeRailFenceCipher('WECRLTEERDSOEEFEAOCAIVDEN', 3)).toBe(

    'WEAREDISCOVEREDFLEEATONCE',

    );

    expect(decodeRailFenceCipher('Hoo!el,Wrdl l', 3)).toBe(

    'Hello, World!',

    );

    expect(decodeRailFenceCipher('15243', 3)).toBe(

    '12345',

    );

  end

    
  it 'encodes a string correctly for base=4' do
    expect(encodeRailFenceCipher('', 4)).to be ''
    expect(encodeRailFenceCipher('THEYAREATTACKINGFROMTHENORTH', 4)).toBe(

    'TEKOOHRACIRMNREATANFTETYTGHH',

    );

  end

    
  it 'decodes a string correctly for base=4' do
    expect(decodeRailFenceCipher('', 4)).to be ''
    expect(decodeRailFenceCipher('TEKOOHRACIRMNREATANFTETYTGHH', 4)).toBe(

    'THEYAREATTACKINGFROMTHENORTH',

    );

  end

end
