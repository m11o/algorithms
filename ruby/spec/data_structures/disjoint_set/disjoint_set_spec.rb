    
describe DisjointSet do
  it 'should throw error when trying to union and check not existing sets' do
    function mergeNotExistingSets() {

    disjointSet = DisjointSet.new()
    
    disjointSet.union('A', 'B');

    }

    
    function checkNotExistingSets() {

    disjointSet = DisjointSet.new()
    
    disjointSet.inSameSet('A', 'B');

    }

    
    expect(mergeNotExistingSets).to toThrow()
    expect(checkNotExistingSets).to toThrow()
  end

    
  it 'should do basic manipulations on disjoint set' do
    disjointSet = DisjointSet.new()
    
    expect(disjointSet.find('A')).to eq nil
    expect(disjointSet.find('B')).to eq nil
    
    disjointSet.makeSet('A');

    
    expect(disjointSet.find('A')).to eq 'A'
    expect(disjointSet.find('B')).to eq nil
    
    disjointSet.makeSet('B');

    
    expect(disjointSet.find('A')).to eq 'A'
    expect(disjointSet.find('B')).to eq 'B'
    
    disjointSet.makeSet('C');

    
    expect(disjointSet.inSameSet('A', 'B')).to eq false
    
    disjointSet.union('A', 'B');

    
    expect(disjointSet.find('A')).to eq 'A'
    expect(disjointSet.find('B')).to eq 'A'
    expect(disjointSet.inSameSet('A', 'B')).to eq true
    expect(disjointSet.inSameSet('B', 'A')).to eq true
    expect(disjointSet.inSameSet('A', 'C')).to eq false
    
    disjointSet.union('A', 'A');

    
    disjointSet.union('B', 'C');

    
    expect(disjointSet.find('A')).to eq 'A'
    expect(disjointSet.find('B')).to eq 'A'
    expect(disjointSet.find('C')).to eq 'A'
    
    expect(disjointSet.inSameSet('A', 'B')).to eq true
    expect(disjointSet.inSameSet('B', 'C')).to eq true
    expect(disjointSet.inSameSet('A', 'C')).to eq true
    
    disjointSet

    .makeSet('E')

    .makeSet('F')

    .makeSet('G')

    .makeSet('H')

    .makeSet('I');

    
    disjointSet

    .union('E', 'F')

    .union('F', 'G')

    .union('G', 'H')

    .union('H', 'I');

    
    expect(disjointSet.inSameSet('A', 'I')).to eq false
    expect(disjointSet.inSameSet('E', 'I')).to eq true
    
    disjointSet.union('I', 'C');

    
    expect(disjointSet.find('I')).to eq 'E'
    expect(disjointSet.inSameSet('A', 'I')).to eq true
  end

    
  it 'should union smaller set with bigger one making bigger one to be new root' do
    disjointSet = DisjointSet.new()
    
    disjointSet

    .makeSet('A')

    .makeSet('B')

    .makeSet('C')

    .union('B', 'C')

    .union('A', 'C');

    
    expect(disjointSet.find('A')).to eq 'B'
  end

    
  it 'should do basic manipulations on disjoint set with custom key extractor' do
    keyExtractor = (value) => value.key
    
    disjointSet = DisjointSet.new(keyExtractor)
    
    itemA = { key: 'A', value: 1 }
    itemB = { key: 'B', value: 2 }
    itemC = { key: 'C', value: 3 }
    
    expect(disjointSet.find(itemA)).to eq nil
    expect(disjointSet.find(itemB)).to eq nil
    
    disjointSet.makeSet(itemA);

    
    expect(disjointSet.find(itemA)).to eq 'A'
    expect(disjointSet.find(itemB)).to eq nil
    
    disjointSet.makeSet(itemB);

    
    expect(disjointSet.find(itemA)).to eq 'A'
    expect(disjointSet.find(itemB)).to eq 'B'
    
    disjointSet.makeSet(itemC);

    
    expect(disjointSet.inSameSet(itemA, itemB)).to eq false
    
    disjointSet.union(itemA, itemB);

    
    expect(disjointSet.find(itemA)).to eq 'A'
    expect(disjointSet.find(itemB)).to eq 'A'
    expect(disjointSet.inSameSet(itemA, itemB)).to eq true
    expect(disjointSet.inSameSet(itemB, itemA)).to eq true
    expect(disjointSet.inSameSet(itemA, itemC)).to eq false
    
    disjointSet.union(itemA, itemC);

    
    expect(disjointSet.find(itemA)).to eq 'A'
    expect(disjointSet.find(itemB)).to eq 'A'
    expect(disjointSet.find(itemC)).to eq 'A'
    
    expect(disjointSet.inSameSet(itemA, itemB)).to eq true
    expect(disjointSet.inSameSet(itemB, itemC)).to eq true
    expect(disjointSet.inSameSet(itemA, itemC)).to eq true
  end

end
