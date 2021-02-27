    
describe squareRoot do
  it 'should throw for negative numbers' do
    function failingSquareRoot() {

    squareRoot(-5);

    }

    expect(failingSquareRoot).to toThrow()
  end

    
  it 'should correctly calculate square root with default tolerance' do
    expect(squareRoot(0)).to be 0
    expect(squareRoot(1)).to be 1
    expect(squareRoot(2)).to be 1
    expect(squareRoot(3)).to be 2
    expect(squareRoot(4)).to be 2
    expect(squareRoot(15)).to be 4
    expect(squareRoot(16)).to be 4
    expect(squareRoot(256)).to be 16
    expect(squareRoot(473)).to be 22
    expect(squareRoot(14723)).to be 121
  end

    
  it 'should correctly calculate square root for integers with custom tolerance' do
    tolerance = 1
    
    expect(squareRoot(0, tolerance)).to be 0
    expect(squareRoot(1, tolerance)).to be 1
    expect(squareRoot(2, tolerance)).to be 1.4
    expect(squareRoot(3, tolerance)).to be 1.8
    expect(squareRoot(4, tolerance)).to be 2
    expect(squareRoot(15, tolerance)).to be 3.9
    expect(squareRoot(16, tolerance)).to be 4
    expect(squareRoot(256, tolerance)).to be 16
    expect(squareRoot(473, tolerance)).to be 21.7
    expect(squareRoot(14723, tolerance)).to be 121.3
    
    tolerance = 3;

    
    expect(squareRoot(0, tolerance)).to be 0
    expect(squareRoot(1, tolerance)).to be 1
    expect(squareRoot(2, tolerance)).to be 1.414
    expect(squareRoot(3, tolerance)).to be 1.732
    expect(squareRoot(4, tolerance)).to be 2
    expect(squareRoot(15, tolerance)).to be 3.873
    expect(squareRoot(16, tolerance)).to be 4
    expect(squareRoot(256, tolerance)).to be 16
    expect(squareRoot(473, tolerance)).to be 21.749
    expect(squareRoot(14723, tolerance)).to be 121.338
    
    tolerance = 10;

    
    expect(squareRoot(0, tolerance)).to be 0
    expect(squareRoot(1, tolerance)).to be 1
    expect(squareRoot(2, tolerance)).to be 1.4142135624
    expect(squareRoot(3, tolerance)).to be 1.7320508076
    expect(squareRoot(4, tolerance)).to be 2
    expect(squareRoot(15, tolerance)).to be 3.8729833462
    expect(squareRoot(16, tolerance)).to be 4
    expect(squareRoot(256, tolerance)).to be 16
    expect(squareRoot(473, tolerance)).to be 21.7485631709
    expect(squareRoot(14723, tolerance)).to be 121.3383698588
  end

    
  it 'should correctly calculate square root for integers with custom tolerance' do
    expect(squareRoot(4.5, 10)).to be 2.1213203436
    expect(squareRoot(217.534, 10)).to be 14.7490338667
  end

end
