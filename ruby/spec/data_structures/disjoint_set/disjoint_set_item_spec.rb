    
describe DisjointSetItem do
  it 'should do basic manipulation with disjoint set item' do
    itemA = DisjointSetItem.new('A')
    itemB = DisjointSetItem.new('B')
    itemC = DisjointSetItem.new('C')
    itemD = DisjointSetItem.new('D')
    
    expect(itemA.getRank()).to be 0
    expect(itemA.getChildren()).to eq []
    expect(itemA.getKey()).to be 'A'
    expect(itemA.getRoot()).to eq itemA
    expect(itemA.isRoot()).to be true
    expect(itemB.isRoot()).to be true
    
    itemA.addChild(itemB);

    itemD.setParent(itemC);

    
    expect(itemA.getRank()).to be 1
    expect(itemC.getRank()).to be 1
    
    expect(itemB.getRank()).to be 0
    expect(itemD.getRank()).to be 0
    
    expect(itemA.getChildren().length).to be 1
    expect(itemC.getChildren().length).to be 1
    
    expect(itemA.getChildren()[0]).to eq itemB
    expect(itemC.getChildren()[0]).to eq itemD
    
    expect(itemB.getChildren().length).to be 0
    expect(itemD.getChildren().length).to be 0
    
    expect(itemA.getRoot()).to eq itemA
    expect(itemB.getRoot()).to eq itemA
    
    expect(itemC.getRoot()).to eq itemC
    expect(itemD.getRoot()).to eq itemC
    
    expect(itemA.isRoot()).to be true
    expect(itemB.isRoot()).to be false
    expect(itemC.isRoot()).to be true
    expect(itemD.isRoot()).to be false
    
    itemA.addChild(itemC);

    
    expect(itemA.isRoot()).to be true
    expect(itemB.isRoot()).to be false
    expect(itemC.isRoot()).to be false
    expect(itemD.isRoot()).to be false
    
    expect(itemA.getRank()).to eq 3
    expect(itemB.getRank()).to eq 0
    expect(itemC.getRank()).to eq 1
  end

    
  it 'should do basic manipulation with disjoint set item with custom key extractor' do
    const keyExtractor = (value) => {

    return value.key;

    };

    
    itemA = DisjointSetItem.new({ key: 'A', value: 1 }, keyExtractor)
    itemB = DisjointSetItem.new({ key: 'B', value: 2 }, keyExtractor)
    itemC = DisjointSetItem.new({ key: 'C', value: 3 }, keyExtractor)
    itemD = DisjointSetItem.new({ key: 'D', value: 4 }, keyExtractor)
    
    expect(itemA.getRank()).to be 0
    expect(itemA.getChildren()).to eq []
    expect(itemA.getKey()).to be 'A'
    expect(itemA.getRoot()).to eq itemA
    expect(itemA.isRoot()).to be true
    expect(itemB.isRoot()).to be true
    
    itemA.addChild(itemB);

    itemD.setParent(itemC);

    
    expect(itemA.getRank()).to be 1
    expect(itemC.getRank()).to be 1
    
    expect(itemB.getRank()).to be 0
    expect(itemD.getRank()).to be 0
    
    expect(itemA.getChildren().length).to be 1
    expect(itemC.getChildren().length).to be 1
    
    expect(itemA.getChildren()[0]).to eq itemB
    expect(itemC.getChildren()[0]).to eq itemD
    
    expect(itemB.getChildren().length).to be 0
    expect(itemD.getChildren().length).to be 0
    
    expect(itemA.getRoot()).to eq itemA
    expect(itemB.getRoot()).to eq itemA
    
    expect(itemC.getRoot()).to eq itemC
    expect(itemD.getRoot()).to eq itemC
    
    expect(itemA.isRoot()).to be true
    expect(itemB.isRoot()).to be false
    expect(itemC.isRoot()).to be true
    expect(itemD.isRoot()).to be false
    
    itemA.addChild(itemC);

    
    expect(itemA.isRoot()).to be true
    expect(itemB.isRoot()).to be false
    expect(itemC.isRoot()).to be false
    expect(itemD.isRoot()).to be false
    
    expect(itemA.getRank()).to eq 3
    expect(itemB.getRank()).to eq 0
    expect(itemC.getRank()).to eq 1
  end

end
