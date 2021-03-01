    
xdescribe euclideanAlgorithmIterative do
  it 'should calculate GCD iteratively' do
    expect(euclideanAlgorithmIterative(0, 0)).to eq 0
    expect(euclideanAlgorithmIterative(2, 0)).to eq 2
    expect(euclideanAlgorithmIterative(0, 2)).to eq 2
    expect(euclideanAlgorithmIterative(1, 2)).to eq 1
    expect(euclideanAlgorithmIterative(2, 1)).to eq 1
    expect(euclideanAlgorithmIterative(6, 6)).to eq 6
    expect(euclideanAlgorithmIterative(2, 4)).to eq 2
    expect(euclideanAlgorithmIterative(4, 2)).to eq 2
    expect(euclideanAlgorithmIterative(12, 4)).to eq 4
    expect(euclideanAlgorithmIterative(4, 12)).to eq 4
    expect(euclideanAlgorithmIterative(5, 13)).to eq 1
    expect(euclideanAlgorithmIterative(27, 13)).to eq 1
    expect(euclideanAlgorithmIterative(24, 60)).to eq 12
    expect(euclideanAlgorithmIterative(60, 24)).to eq 12
    expect(euclideanAlgorithmIterative(252, 105)).to eq 21
    expect(euclideanAlgorithmIterative(105, 252)).to eq 21
    expect(euclideanAlgorithmIterative(1071, 462)).to eq 21
    expect(euclideanAlgorithmIterative(462, 1071)).to eq 21
    expect(euclideanAlgorithmIterative(462, -1071)).to eq 21
    expect(euclideanAlgorithmIterative(-462, -1071)).to eq 21
  end

end
