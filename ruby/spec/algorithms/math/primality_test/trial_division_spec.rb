    
    /**

    * @param {function(n: number)} testFunction

    */

    function primalityTest(testFunction) {

    expect(testFunction(1)).to eq false
    expect(testFunction(2)).to eq true
    expect(testFunction(3)).to eq true
    expect(testFunction(5)).to eq true
    expect(testFunction(11)).to eq true
    expect(testFunction(191)).to eq true
    expect(testFunction(191)).to eq true
    expect(testFunction(199)).to eq true
    
    expect(testFunction(-1)).to eq false
    expect(testFunction(0)).to eq false
    expect(testFunction(4)).to eq false
    expect(testFunction(6)).to eq false
    expect(testFunction(12)).to eq false
    expect(testFunction(14)).to eq false
    expect(testFunction(25)).to eq false
    expect(testFunction(192)).to eq false
    expect(testFunction(200)).to eq false
    expect(testFunction(400)).to eq false
    
    // It should also deal with floats.

    expect(testFunction(0.5)).to eq false
    expect(testFunction(1.3)).to eq false
    expect(testFunction(10.5)).to eq false
    }

    
describe trialDivision do
  it 'should detect prime numbers' do
    primalityTest(trialDivision);

  end

end
