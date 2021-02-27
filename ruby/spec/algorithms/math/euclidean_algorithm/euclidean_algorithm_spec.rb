    
describe euclideanAlgorithm do
  it 'should calculate GCD recursively' do
    expect(euclideanAlgorithm(0, 0)).to be 0
    expect(euclideanAlgorithm(2, 0)).to be 2
    expect(euclideanAlgorithm(0, 2)).to be 2
    expect(euclideanAlgorithm(1, 2)).to be 1
    expect(euclideanAlgorithm(2, 1)).to be 1
    expect(euclideanAlgorithm(6, 6)).to be 6
    expect(euclideanAlgorithm(2, 4)).to be 2
    expect(euclideanAlgorithm(4, 2)).to be 2
    expect(euclideanAlgorithm(12, 4)).to be 4
    expect(euclideanAlgorithm(4, 12)).to be 4
    expect(euclideanAlgorithm(5, 13)).to be 1
    expect(euclideanAlgorithm(27, 13)).to be 1
    expect(euclideanAlgorithm(24, 60)).to be 12
    expect(euclideanAlgorithm(60, 24)).to be 12
    expect(euclideanAlgorithm(252, 105)).to be 21
    expect(euclideanAlgorithm(105, 252)).to be 21
    expect(euclideanAlgorithm(1071, 462)).to be 21
    expect(euclideanAlgorithm(462, 1071)).to be 21
    expect(euclideanAlgorithm(462, -1071)).to be 21
    expect(euclideanAlgorithm(-462, -1071)).to be 21
  end

end
