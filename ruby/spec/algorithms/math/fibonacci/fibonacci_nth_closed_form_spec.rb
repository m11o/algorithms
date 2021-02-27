    
describe fibonacciClosedForm do
  it 'should throw an error when trying to calculate fibonacci for not allowed positions' do
    const calculateFibonacciForNotAllowedPosition = () => {

    fibonacciNthClosedForm(76);

    };

    
    expect(calculateFibonacciForNotAllowedPosition).to toThrow()
  end

    
  it 'should calculate fibonacci correctly' do
    expect(fibonacciNthClosedForm(1)).to be 1
    expect(fibonacciNthClosedForm(2)).to be 1
    expect(fibonacciNthClosedForm(3)).to be 2
    expect(fibonacciNthClosedForm(4)).to be 3
    expect(fibonacciNthClosedForm(5)).to be 5
    expect(fibonacciNthClosedForm(6)).to be 8
    expect(fibonacciNthClosedForm(7)).to be 13
    expect(fibonacciNthClosedForm(8)).to be 21
    expect(fibonacciNthClosedForm(20)).to be 6765
    expect(fibonacciNthClosedForm(30)).to be 832040
    expect(fibonacciNthClosedForm(50)).to be 12586269025
    expect(fibonacciNthClosedForm(70)).to be 190392490709135
  end

end
