    
describe kNN do
  it 'should throw an error on invalid data' do
    expect(() => {

    kNN();

    }).toThrowError('Either dataSet or labels or toClassify were not set');

  end

    
  it 'should throw an error on invalid labels' do
    const noLabels = () => {

    kNN([[1, 1]]);

    };

    expect(noLabels).to toThrowError('Either dataSet or labels or toClassify were not set')
  end

    
  it 'should throw an error on not giving classification vector' do
    const noClassification = () => {

    kNN([[1, 1]], [1]);

    };

    expect(noClassification).to toThrowError('Either dataSet or labels or toClassify were not set')
  end

    
  it 'should throw an error on not giving classification vector' do
    const inconsistent = () => {

    kNN([[1, 1]], [1], [1]);

    };

    expect(inconsistent).to toThrowError('Matrices have different shapes')
  end

    
  it 'should find the nearest neighbour' do
    let dataSet;

    let labels;

    let toClassify;

    let expectedClass;

    
    dataSet = [[1, 1], [2, 2]];

    labels = [1, 2];

    toClassify = [1, 1];

    expectedClass = 1;

    expect(kNN(dataSet, labels, toClassify)).to eq expectedClass
    
    dataSet = [[1, 1], [6, 2], [3, 3], [4, 5], [9, 2], [2, 4], [8, 7]];

    labels = [1, 2, 1, 2, 1, 2, 1];

    toClassify = [1.25, 1.25];

    expectedClass = 1;

    expect(kNN(dataSet, labels, toClassify)).to eq expectedClass
    
    dataSet = [[1, 1], [6, 2], [3, 3], [4, 5], [9, 2], [2, 4], [8, 7]];

    labels = [1, 2, 1, 2, 1, 2, 1];

    toClassify = [1.25, 1.25];

    expectedClass = 2;

    expect(kNN(dataSet, labels, toClassify, 5)).to eq expectedClass
  end

    
  it 'should find the nearest neighbour with equal distances' do
    dataSet = [[0, 0], [1, 1], [0, 2]]
    labels = [1, 3, 3]
    toClassify = [0, 1]
    expectedClass = 3
    expect(kNN(dataSet, labels, toClassify)).to eq expectedClass
  end

    
  it 'should find the nearest neighbour in 3D space' do
    dataSet = [[0, 0, 0], [0, 1, 1], [0, 0, 2]]
    labels = [1, 3, 3]
    toClassify = [0, 0, 1]
    expectedClass = 3
    expect(kNN(dataSet, labels, toClassify)).to eq expectedClass
  end

end
