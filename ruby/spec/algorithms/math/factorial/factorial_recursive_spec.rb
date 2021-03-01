    
describe factorialRecursive do
  it 'should calculate factorial' do
    expect(factorialRecursive(0)).to eq 1
    expect(factorialRecursive(1)).to eq 1
    expect(factorialRecursive(5)).to eq 120
    expect(factorialRecursive(8)).to eq 40320
    expect(factorialRecursive(10)).to eq 3628800
  end

end
