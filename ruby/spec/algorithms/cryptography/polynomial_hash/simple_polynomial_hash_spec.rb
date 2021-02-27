    
describe PolynomialHash do
  it 'should calculate new hash based on previous one' do
    bases = [3, 5]
    frameSizes = [5, 10]
    
    const text = 'Lorem Ipsum is simply dummy text of the printing and '

    + 'typesetting industry. Lorem Ipsum has been the industry\'s standard '

    + 'galley of type and \u{ffff} scrambled it to make a type specimen book. It '

    + 'electronic 耀 typesetting, remaining essentially unchanged. It was '

    + 'popularised in the 1960s with the release of Letraset sheets '

    + 'publishing software like Aldus 耀 PageMaker including versions of Lorem.';

    
    // Check hashing for different prime base.

    bases.forEach((base) => {

    polynomialHash = SimplePolynomialHash.new(base)
    
    // Check hashing for different word lengths.

    frameSizes.forEach((frameSize) => {

    previousWord = text.substr(0, frameSize)
    previousHash = polynomialHash.hash(previousWord)
    
    // Shift frame through the whole text.

    frameShift = 1
    currentWord = text.substr(frameShift, frameSize)
    currentHash = polynomialHash.hash(currentWord)
    currentRollingHash = polynomialHash.roll(previousHash, previousWord, currentWord)
    
    // Check that rolling hash is the same as directly calculated hash.

    expect(currentRollingHash).to be currentHash
    
    previousWord = currentWord;

    previousHash = currentHash;

    }

      end

    end

  end

    
  it 'should generate numeric hashed' do
    polynomialHash = SimplePolynomialHash.new()
    
    expect(polynomialHash.hash('Test')).to be 604944
    expect(polynomialHash.hash('a')).to be 97
    expect(polynomialHash.hash('b')).to be 98
    expect(polynomialHash.hash('c')).to be 99
    expect(polynomialHash.hash('d')).to be 100
    expect(polynomialHash.hash('e')).to be 101
    expect(polynomialHash.hash('ab')).to be 1763
    expect(polynomialHash.hash('abc')).to be 30374
  end

end
