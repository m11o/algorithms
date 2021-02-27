    
describe BinarySearchTreeNode do
  it 'should create binary search tree' do
    bstNode = BinarySearchTreeNode.new(2)
    
    expect(bstNode.value).to be 2
    expect(bstNode.left).to eq nil
    expect(bstNode.right).to eq nil
  end

    
  it 'should insert in itself if it is empty' do
    bstNode = BinarySearchTreeNode.new()
    bstNode.insert(1);

    
    expect(bstNode.value).to be 1
    expect(bstNode.left).to eq nil
    expect(bstNode.right).to eq nil
  end

    
  it 'should insert nodes in correct order' do
    bstNode = BinarySearchTreeNode.new(2)
    insertedNode1 = bstNode.insert(1)
    
    expect(insertedNode1.value).to be 1
    expect(bstNode.to_s).to be '1,2'
    expect(bstNode.contains(1)).to be true
    expect(bstNode.contains(3)).to be false
    
    insertedNode2 = bstNode.insert(3)
    
    expect(insertedNode2.value).to be 3
    expect(bstNode.to_s).to be '1,2,3'
    expect(bstNode.contains(3)).to be true
    expect(bstNode.contains(4)).to be false
    
    bstNode.insert(7);

    
    expect(bstNode.to_s).to be '1,2,3,7'
    expect(bstNode.contains(7)).to be true
    expect(bstNode.contains(8)).to be false
    
    bstNode.insert(4);

    
    expect(bstNode.to_s).to be '1,2,3,4,7'
    expect(bstNode.contains(4)).to be true
    expect(bstNode.contains(8)).to be false
    
    bstNode.insert(6);

    
    expect(bstNode.to_s).to be '1,2,3,4,6,7'
    expect(bstNode.contains(6)).to be true
    expect(bstNode.contains(8)).to be false
  end

    
  it 'should not insert duplicates' do
    bstNode = BinarySearchTreeNode.new(2)
    bstNode.insert(1);

    
    expect(bstNode.to_s).to be '1,2'
    expect(bstNode.contains(1)).to be true
    expect(bstNode.contains(3)).to be false
    
    bstNode.insert(1);

    
    expect(bstNode.to_s).to be '1,2'
    expect(bstNode.contains(1)).to be true
    expect(bstNode.contains(3)).to be false
  end

    
  it 'should find min node' do
    node = BinarySearchTreeNode.new(10)
    
    node.insert(20);

    node.insert(30);

    node.insert(5);

    node.insert(40);

    node.insert(1);

    
    expect(node.findMin()).not.toBeNull();

    expect(node.findMin().value).to be 1
  end

    
  it 'should be possible to attach meta information to binary search tree nodes' do
    node = BinarySearchTreeNode.new(10)
    
    node.insert(20);

    node1 = node.insert(30)
    node.insert(5);

    node.insert(40);

    node2 = node.insert(1)
    
    node.meta.set('color', 'red');

    node1.meta.set('color', 'black');

    node2.meta.set('color', 'white');

    
    expect(node.meta.get('color')).to be 'red'
    
    expect(node.findMin()).not.toBeNull();

    expect(node.findMin().value).to be 1
    expect(node.findMin().meta.get('color')).to be 'white'
    expect(node.find(30).meta.get('color')).to be 'black'
  end

    
  it 'should find node' do
    node = BinarySearchTreeNode.new(10)
    
    node.insert(20);

    node.insert(30);

    node.insert(5);

    node.insert(40);

    node.insert(1);

    
    expect(node.find(6)).to eq nil
    expect(node.find(5)).not.toBeNull();

    expect(node.find(5).value).to be 5
  end

    
  it 'should remove leaf nodes' do
    bstRootNode = BinarySearchTreeNode.new()
    
    bstRootNode.insert(10);

    bstRootNode.insert(20);

    bstRootNode.insert(5);

    
    expect(bstRootNode.to_s).to be '5,10,20'
    
    removed1 = bstRootNode.remove(5)
    expect(bstRootNode.to_s).to be '10,20'
    expect(removed1).to be true
    
    removed2 = bstRootNode.remove(20)
    expect(bstRootNode.to_s).to be '10'
    expect(removed2).to be true
  end

    
  it 'should remove nodes with one child' do
    bstRootNode = BinarySearchTreeNode.new()
    
    bstRootNode.insert(10);

    bstRootNode.insert(20);

    bstRootNode.insert(5);

    bstRootNode.insert(30);

    
    expect(bstRootNode.to_s).to be '5,10,20,30'
    
    bstRootNode.remove(20);

    expect(bstRootNode.to_s).to be '5,10,30'
    
    bstRootNode.insert(1);

    expect(bstRootNode.to_s).to be '1,5,10,30'
    
    bstRootNode.remove(5);

    expect(bstRootNode.to_s).to be '1,10,30'
  end

    
  it 'should remove nodes with two children' do
    bstRootNode = BinarySearchTreeNode.new()
    
    bstRootNode.insert(10);

    bstRootNode.insert(20);

    bstRootNode.insert(5);

    bstRootNode.insert(30);

    bstRootNode.insert(15);

    bstRootNode.insert(25);

    
    expect(bstRootNode.to_s).to be '5,10,15,20,25,30'
    expect(bstRootNode.find(20).left.value).to be 15
    expect(bstRootNode.find(20).right.value).to be 30
    
    bstRootNode.remove(20);

    expect(bstRootNode.to_s).to be '5,10,15,25,30'
    
    bstRootNode.remove(15);

    expect(bstRootNode.to_s).to be '5,10,25,30'
    
    bstRootNode.remove(10);

    expect(bstRootNode.to_s).to be '5,25,30'
    expect(bstRootNode.value).to be 25
    
    bstRootNode.remove(25);

    expect(bstRootNode.to_s).to be '5,30'
    
    bstRootNode.remove(5);

    expect(bstRootNode.to_s).to be '30'
  end

    
  it 'should remove node with no parent' do
    bstRootNode = BinarySearchTreeNode.new()
    expect(bstRootNode.to_s).to be ''
    
    bstRootNode.insert(1);

    bstRootNode.insert(2);

    expect(bstRootNode.to_s).to be '1,2'
    
    bstRootNode.remove(1);

    expect(bstRootNode.to_s).to be '2'
    
    bstRootNode.remove(2);

    expect(bstRootNode.to_s).to be ''
  end

    
  it 'should throw error when trying to remove not existing node' do
    bstRootNode = BinarySearchTreeNode.new()
    
    bstRootNode.insert(10);

    bstRootNode.insert(20);

    
    function removeNotExistingElementFromTree() {

    bstRootNode.remove(30);

    }

    
    expect(removeNotExistingElementFromTree).to toThrow()
  end

    
  it 'should be possible to use objects as node values' do
    const nodeValueComparatorCallback = (a, b) => {

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
    
    bstNode = BinarySearchTreeNode.new(obj2, nodeValueComparatorCallback)
    bstNode.insert(obj1);

    
    expect(bstNode.to_s).to be 'obj1,obj2'
    expect(bstNode.contains(obj1)).to be true
    expect(bstNode.contains(obj3)).to be false
    
    bstNode.insert(obj3);

    
    expect(bstNode.to_s).to be 'obj1,obj2,obj3'
    expect(bstNode.contains(obj3)).to be true
    
    expect(bstNode.findMin().value).to eq obj1
  end

    
  it 'should abandon removed node' do
    rootNode = BinarySearchTreeNode.new('foo')
    rootNode.insert('bar');

    childNode = rootNode.find('bar')
    rootNode.remove('bar');

    
    expect(childNode.parent).to eq nil
  end

end
