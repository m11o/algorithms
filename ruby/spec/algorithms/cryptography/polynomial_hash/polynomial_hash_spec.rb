    
xdescribe PolynomialHash do
  it 'should calculate new hash based on previous one' do
    bases = [3, 79, 101, 3251, 13229, 122743, 3583213]
    mods = [79, 101]
    frameSizes = [5, 20]
    
    // @TODO: Provide Unicode support.

    const text = 'Lorem Ipsum is simply dummy text of the printing and '

    + 'typesetting industry. Lorem Ipsum has been the industry\'s standard '

    + 'galley of type and \u{ffff} scrambled it to make a type specimen book. It '

    + 'electronic 耀 typesetting, remaining essentially unchanged. It was '

    // + 'popularised in the \u{20005} \u{20000}1960s with the release of Letraset sheets '

    + 'publishing software like Aldus PageMaker 耀 including versions of Lorem.';

    
    // Check hashing for different prime base.

    bases.forEach((base) => {

    mods.forEach((modulus) => {

 end

    polynomialHash = PolynomialHash.new({ base, modulus })
    
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

    expect(currentRollingHash).to eq currentHash
    
    previousWord = currentWord;

    previousHash = currentHash;

    }

        end

      end

    end

  end

    
  it 'should generate numeric hashed less than 100' do
 end

    polynomialHash = PolynomialHash.new({ modulus: 100 })
    
    expect(polynomialHash.hash('Some long text that is used as a key')).to eq 41
    expect(polynomialHash.hash('Test')).to eq 92
    expect(polynomialHash.hash('a')).to eq 97
    expect(polynomialHash.hash('b')).to eq 98
    expect(polynomialHash.hash('c')).to eq 99
    expect(polynomialHash.hash('d')).to eq 0
    expect(polynomialHash.hash('e')).to eq 1
    expect(polynomialHash.hash('ab')).to eq 87
    
    // @TODO: Provide Unicode support.

    expect(polynomialHash.hash('\u{20000}')).to eq 92
  end

end
