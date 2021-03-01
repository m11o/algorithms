    
describe BinarySearchTree do
  it 'should create binary search tree' do
    bst = BinarySearchTree.new()
    
    expect(bst.root.value).to eq nil
    expect(bst.root.left).to eq nil
    expect(bst.root.right).to eq nil
  end

    
  it 'should insert values' do
    bst = BinarySearchTree.new()
    
    insertedNode1 = bst.insert(10)
    insertedNode2 = bst.insert(20)
    bst.insert(5);

    
    expect(bst.to_s).to eq '5,10,20'
    expect(insertedNode1.value).to eq 10
    expect(insertedNode2.value).to eq 20
  end

    
  it 'should check if value exists' do
    bst = BinarySearchTree.new()
    
    bst.insert(10);

    bst.insert(20);

    bst.insert(5);

    
    expect(bst.contains(20)).to eq true
    expect(bst.contains(40)).to eq false
  end

    
  it 'should remove nodes' do
    bst = BinarySearchTree.new()
    
    bst.insert(10);

    bst.insert(20);

    bst.insert(5);

    
    expect(bst.to_s).to eq '5,10,20'
    
    removed1 = bst.remove(5)
    expect(bst.to_s).to eq '10,20'
    expect(removed1).to eq true
    
    removed2 = bst.remove(20)
    expect(bst.to_s).to eq '10'
    expect(removed2).to eq true
  end

    
  it 'should insert object values' do
    const nodeValueCompareFunction = (a, b) => {

    normalizedA = a || { value: null }
    normalizedB = b || { value: null }
    
    if (normalizedA.value === normalizedB.value) {

    return 0;

    }

    
    return normalizedA.value < normalizedB.value ? -1 : 1;

    };

    
    obj1 = { key: 'obj1', value: 1, toString: () => 'obj1' }
    obj2 = { key: 'obj2', value: 2, toString: () => 'obj2' }
    obj3 = { key: 'obj3', value: 3, toString: () => 'obj3' }
    
    bst = BinarySearchTree.new(nodeValueCompareFunction)
    
    bst.insert(obj2);

    bst.insert(obj3);

    bst.insert(obj1);

    
    expect(bst.to_s).to eq 'obj1,obj2,obj3'
  end

    
  it 'should be traversed to sorted array' do
    bst = BinarySearchTree.new()
    
    bst.insert(10);

    bst.insert(-10);

    bst.insert(20);

    bst.insert(-20);

    bst.insert(25);

    bst.insert(6);

    
    expect(bst.to_s).to eq '-20,-10,6,10,20,25'
    expect(bst.root.height).to eq 2
    
    bst.insert(4);

    
    expect(bst.to_s).to eq '-20,-10,4,6,10,20,25'
    expect(bst.root.height).to eq 3
  end

end
