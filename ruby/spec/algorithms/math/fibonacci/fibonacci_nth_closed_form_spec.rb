    
describe fibonacciClosedForm do
  it 'should throw an error when trying to calculate fibonacci for not allowed positions' do
    const calculateFibonacciForNotAllowedPosition = () => {

    fibonacciNthClosedForm(76);

    };

    
    expect(calculateFibonacciForNotAllowedPosition).to toThrow()
  end

    
  it 'should calculate fibonacci correctly' do
    expect(fibonacciNthClosedForm(1)).to eq 1
    expect(fibonacciNthClosedForm(2)).to eq 1
    expect(fibonacciNthClosedForm(3)).to eq 2
    expect(fibonacciNthClosedForm(4)).to eq 3
    expect(fibonacciNthClosedForm(5)).to eq 5
    expect(fibonacciNthClosedForm(6)).to eq 8
    expect(fibonacciNthClosedForm(7)).to eq 13
    expect(fibonacciNthClosedForm(8)).to eq 21
    expect(fibonacciNthClosedForm(20)).to eq 6765
    expect(fibonacciNthClosedForm(30)).to eq 832040
    expect(fibonacciNthClosedForm(50)).to eq 12586269025
    expect(fibonacciNthClosedForm(70)).to eq 190392490709135
  end

end
