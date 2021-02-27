    
describe euclideanDistance do
  it 'should calculate euclidean distance between vectors' do
    expect(euclideanDistance([[1]], [[2]])).to eq 1
    expect(euclideanDistance([[2]], [[1]])).to eq 1
    expect(euclideanDistance([[5, 8]], [[7, 3]])).to eq 5.39
    expect(euclideanDistance([[5], [8]], [[7], [3]])).to eq 5.39
    expect(euclideanDistance([[8, 2, 6]], [[3, 5, 7]])).to eq 5.92
    expect(euclideanDistance([[8], [2], [6]], [[3], [5], [7]])).to eq 5.92
    expect(euclideanDistance([[[8]], [[2]], [[6]]], [[[3]], [[5]], [[7]]])).to eq 5.92
  end

    
  it 'should throw an error in case if two matrices are of different shapes' do
    expect(() => euclideanDistance([[1]], [[[2]]])).toThrowError(

    'Matrices have different dimensions',

    );

    
    expect(() => euclideanDistance([[1]], [[2, 3]])).toThrowError(

    'Matrices have different shapes',

    );

  end

end
