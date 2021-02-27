    
describe euclideanAlgorithmIterative do
  it 'should calculate GCD iteratively' do
    expect(euclideanAlgorithmIterative(0, 0)).to be 0
    expect(euclideanAlgorithmIterative(2, 0)).to be 2
    expect(euclideanAlgorithmIterative(0, 2)).to be 2
    expect(euclideanAlgorithmIterative(1, 2)).to be 1
    expect(euclideanAlgorithmIterative(2, 1)).to be 1
    expect(euclideanAlgorithmIterative(6, 6)).to be 6
    expect(euclideanAlgorithmIterative(2, 4)).to be 2
    expect(euclideanAlgorithmIterative(4, 2)).to be 2
    expect(euclideanAlgorithmIterative(12, 4)).to be 4
    expect(euclideanAlgorithmIterative(4, 12)).to be 4
    expect(euclideanAlgorithmIterative(5, 13)).to be 1
    expect(euclideanAlgorithmIterative(27, 13)).to be 1
    expect(euclideanAlgorithmIterative(24, 60)).to be 12
    expect(euclideanAlgorithmIterative(60, 24)).to be 12
    expect(euclideanAlgorithmIterative(252, 105)).to be 21
    expect(euclideanAlgorithmIterative(105, 252)).to be 21
    expect(euclideanAlgorithmIterative(1071, 462)).to be 21
    expect(euclideanAlgorithmIterative(462, 1071)).to be 21
    expect(euclideanAlgorithmIterative(462, -1071)).to be 21
    expect(euclideanAlgorithmIterative(-462, -1071)).to be 21
  end

end
