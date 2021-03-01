    
describe euclideanAlgorithm do
  it 'should calculate GCD recursively' do
    expect(euclideanAlgorithm(0, 0)).to eq 0
    expect(euclideanAlgorithm(2, 0)).to eq 2
    expect(euclideanAlgorithm(0, 2)).to eq 2
    expect(euclideanAlgorithm(1, 2)).to eq 1
    expect(euclideanAlgorithm(2, 1)).to eq 1
    expect(euclideanAlgorithm(6, 6)).to eq 6
    expect(euclideanAlgorithm(2, 4)).to eq 2
    expect(euclideanAlgorithm(4, 2)).to eq 2
    expect(euclideanAlgorithm(12, 4)).to eq 4
    expect(euclideanAlgorithm(4, 12)).to eq 4
    expect(euclideanAlgorithm(5, 13)).to eq 1
    expect(euclideanAlgorithm(27, 13)).to eq 1
    expect(euclideanAlgorithm(24, 60)).to eq 12
    expect(euclideanAlgorithm(60, 24)).to eq 12
    expect(euclideanAlgorithm(252, 105)).to eq 21
    expect(euclideanAlgorithm(105, 252)).to eq 21
    expect(euclideanAlgorithm(1071, 462)).to eq 21
    expect(euclideanAlgorithm(462, 1071)).to eq 21
    expect(euclideanAlgorithm(462, -1071)).to eq 21
    expect(euclideanAlgorithm(-462, -1071)).to eq 21
  end

end
