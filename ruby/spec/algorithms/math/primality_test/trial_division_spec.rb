    
    /**

    * @param {function(n: number)} testFunction

    */

    function primalityTest(testFunction) {

    expect(testFunction(1)).to be false
    expect(testFunction(2)).to be true
    expect(testFunction(3)).to be true
    expect(testFunction(5)).to be true
    expect(testFunction(11)).to be true
    expect(testFunction(191)).to be true
    expect(testFunction(191)).to be true
    expect(testFunction(199)).to be true
    
    expect(testFunction(-1)).to be false
    expect(testFunction(0)).to be false
    expect(testFunction(4)).to be false
    expect(testFunction(6)).to be false
    expect(testFunction(12)).to be false
    expect(testFunction(14)).to be false
    expect(testFunction(25)).to be false
    expect(testFunction(192)).to be false
    expect(testFunction(200)).to be false
    expect(testFunction(400)).to be false
    
    // It should also deal with floats.

    expect(testFunction(0.5)).to be false
    expect(testFunction(1.3)).to be false
    expect(testFunction(10.5)).to be false
    }

    
describe trialDivision do
  it 'should detect prime numbers' do
    primalityTest(trialDivision);

  end

end
