    
xdescribe cartesianProduct do
  it 'should return null if there is not enough info for calculation' do
    product1 = cartesianProduct([1], null)
    product2 = cartesianProduct([], null)
    
    expect(product1).to eq nil
    expect(product2).to eq nil
  end

    
  it 'should calculate the product of two sets' do
    product1 = cartesianProduct([1], [1])
    product2 = cartesianProduct([1, 2], [3, 5])
    
    expect(product1).to eq [[1, 1]]
    expect(product2).to eq [[1, 3], [1, 5], [2, 3], [2, 5]]
  end

end
