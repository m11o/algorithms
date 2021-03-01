    
describe factorial do
  it 'should calculate factorial' do
    expect(factorial(0)).to eq 1
    expect(factorial(1)).to eq 1
    expect(factorial(5)).to eq 120
    expect(factorial(8)).to eq 40320
    expect(factorial(10)).to eq 3628800
  end

end
