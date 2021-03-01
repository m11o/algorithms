    
xdescribe kMeans do
  it 'should throw an error on invalid data' do
    expect(() => {

    KMeans();

    }).toThrowError('The data is empty');

  end

    
  it 'should throw an error on inconsistent data' do
    expect(() => {

    KMeans([[1, 2], [1]], 2);

    }).toThrowError('Matrices have different shapes');

  end

    
  it 'should find the nearest neighbour' do
    data = [[1, 1], [6, 2], [3, 3], [4, 5], [9, 2], [2, 4], [8, 7]]
    k = 2
    expectedClusters = [0, 1, 0, 1, 1, 0, 1]
    expect(KMeans(data, k)).to eq expectedClusters
    
    expect(KMeans([[0, 0], [0, 1], [10, 10]], 2)).toEqual(

    [0, 0, 1],

    );

  end

    
  it 'should find the clusters with equal distances' do
    dataSet = [[0, 0], [1, 1], [2, 2]]
    k = 3
    expectedCluster = [0, 1, 2]
    expect(KMeans(dataSet, k)).to eq expectedCluster
  end

    
  it 'should find the nearest neighbour in 3D space' do
    dataSet = [[0, 0, 0], [0, 1, 0], [2, 0, 2]]
    k = 2
    expectedCluster = [1, 1, 0]
    expect(KMeans(dataSet, k)).to eq expectedCluster
  end

end
