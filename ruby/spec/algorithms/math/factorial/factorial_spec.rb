    
describe factorial do
  it 'should calculate factorial' do
    expect(factorial(0)).to be 1
    expect(factorial(1)).to be 1
    expect(factorial(5)).to be 120
    expect(factorial(8)).to be 40320
    expect(factorial(10)).to be 3628800
  end

end
