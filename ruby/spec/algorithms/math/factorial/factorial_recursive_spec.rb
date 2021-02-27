    
describe factorialRecursive do
  it 'should calculate factorial' do
    expect(factorialRecursive(0)).to be 1
    expect(factorialRecursive(1)).to be 1
    expect(factorialRecursive(5)).to be 120
    expect(factorialRecursive(8)).to be 40320
    expect(factorialRecursive(10)).to be 3628800
  end

end
