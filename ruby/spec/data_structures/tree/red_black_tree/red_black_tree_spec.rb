    
describe RedBlackTree do
  it 'should always color first inserted node as black' do
    tree = RedBlackTree.new()
    
    firstInsertedNode = tree.insert(10)
    
    expect(tree.isNodeColored(firstInsertedNode)).to be true
    expect(tree.isNodeBlack(firstInsertedNode)).to be true
    expect(tree.isNodeRed(firstInsertedNode)).to be false
    
    expect(tree.to_s).to be '10'
    expect(tree.root.height).to be 0
  end

    
  it 'should always color new leaf node as red' do
    tree = RedBlackTree.new()
    
    firstInsertedNode = tree.insert(10)
    secondInsertedNode = tree.insert(15)
    thirdInsertedNode = tree.insert(5)
    
    expect(tree.isNodeBlack(firstInsertedNode)).to be true
    expect(tree.isNodeRed(secondInsertedNode)).to be true
    expect(tree.isNodeRed(thirdInsertedNode)).to be true
    
    expect(tree.to_s).to be '5,10,15'
    expect(tree.root.height).to be 1
  end

    
  it 'should balance itself' do
    tree = RedBlackTree.new()
    
    tree.insert(5);

    tree.insert(10);

    tree.insert(15);

    tree.insert(20);

    tree.insert(25);

    tree.insert(30);

    
    expect(tree.to_s).to be '5,10,15,20,25,30'
    expect(tree.root.height).to be 3
  end

    
  it 'should balance itself when parent is black' do
    tree = RedBlackTree.new()
    
    node1 = tree.insert(10)
    
    expect(tree.isNodeBlack(node1)).to be true
    
    node2 = tree.insert(-10)
    
    expect(tree.isNodeBlack(node1)).to be true
    expect(tree.isNodeRed(node2)).to be true
    
    node3 = tree.insert(20)
    
    expect(tree.isNodeBlack(node1)).to be true
    expect(tree.isNodeRed(node2)).to be true
    expect(tree.isNodeRed(node3)).to be true
    
    node4 = tree.insert(-20)
    
    expect(tree.isNodeBlack(node1)).to be true
    expect(tree.isNodeBlack(node2)).to be true
    expect(tree.isNodeBlack(node3)).to be true
    expect(tree.isNodeRed(node4)).to be true
    
    node5 = tree.insert(25)
    
    expect(tree.isNodeBlack(node1)).to be true
    expect(tree.isNodeBlack(node2)).to be true
    expect(tree.isNodeBlack(node3)).to be true
    expect(tree.isNodeRed(node4)).to be true
    expect(tree.isNodeRed(node5)).to be true
    
    node6 = tree.insert(6)
    
    expect(tree.isNodeBlack(node1)).to be true
    expect(tree.isNodeBlack(node2)).to be true
    expect(tree.isNodeBlack(node3)).to be true
    expect(tree.isNodeRed(node4)).to be true
    expect(tree.isNodeRed(node5)).to be true
    expect(tree.isNodeRed(node6)).to be true
    
    expect(tree.to_s).to be '-20,-10,6,10,20,25'
    expect(tree.root.height).to be 2
    
    node7 = tree.insert(4)
    
    expect(tree.root.left.value).to eq node2.value
    
    expect(tree.to_s).to be '-20,-10,4,6,10,20,25'
    expect(tree.root.height).to be 3
    
    expect(tree.isNodeBlack(node1)).to be true
    expect(tree.isNodeRed(node2)).to be true
    expect(tree.isNodeBlack(node3)).to be true
    expect(tree.isNodeBlack(node4)).to be true
    expect(tree.isNodeBlack(node4)).to be true
    expect(tree.isNodeRed(node5)).to be true
    expect(tree.isNodeBlack(node6)).to be true
    expect(tree.isNodeRed(node7)).to be true
  end

    
  it 'should balance itself when uncle is red' do
    tree = RedBlackTree.new()
    
    node1 = tree.insert(10)
    node2 = tree.insert(-10)
    node3 = tree.insert(20)
    node4 = tree.insert(-20)
    node5 = tree.insert(6)
    node6 = tree.insert(15)
    node7 = tree.insert(25)
    node8 = tree.insert(2)
    node9 = tree.insert(8)
    
    expect(tree.to_s).to be '-20,-10,2,6,8,10,15,20,25'
    expect(tree.root.height).to be 3
    
    expect(tree.isNodeBlack(node1)).to be true
    expect(tree.isNodeRed(node2)).to be true
    expect(tree.isNodeBlack(node3)).to be true
    expect(tree.isNodeBlack(node4)).to be true
    expect(tree.isNodeBlack(node5)).to be true
    expect(tree.isNodeRed(node6)).to be true
    expect(tree.isNodeRed(node7)).to be true
    expect(tree.isNodeRed(node8)).to be true
    expect(tree.isNodeRed(node9)).to be true
    
    node10 = tree.insert(4)
    
    expect(tree.to_s).to be '-20,-10,2,4,6,8,10,15,20,25'
    expect(tree.root.height).to be 3
    
    expect(tree.root.value).to be node5.value
    
    expect(tree.isNodeBlack(node5)).to be true
    expect(tree.isNodeRed(node1)).to be true
    expect(tree.isNodeRed(node2)).to be true
    expect(tree.isNodeRed(node10)).to be true
    expect(tree.isNodeRed(node6)).to be true
    expect(tree.isNodeRed(node7)).to be true
    expect(tree.isNodeBlack(node4)).to be true
    expect(tree.isNodeBlack(node8)).to be true
    expect(tree.isNodeBlack(node9)).to be true
    expect(tree.isNodeBlack(node3)).to be true
  end

    
  it 'should do left-left rotation' do
    tree = RedBlackTree.new()
    
    node1 = tree.insert(10)
    node2 = tree.insert(-10)
    node3 = tree.insert(20)
    node4 = tree.insert(7)
    node5 = tree.insert(15)
    
    expect(tree.to_s).to be '-10,7,10,15,20'
    expect(tree.root.height).to be 2
    
    expect(tree.isNodeBlack(node1)).to be true
    expect(tree.isNodeBlack(node2)).to be true
    expect(tree.isNodeBlack(node3)).to be true
    expect(tree.isNodeRed(node4)).to be true
    expect(tree.isNodeRed(node5)).to be true
    
    node6 = tree.insert(13)
    
    expect(tree.to_s).to be '-10,7,10,13,15,20'
    expect(tree.root.height).to be 2
    
    expect(tree.isNodeBlack(node1)).to be true
    expect(tree.isNodeBlack(node2)).to be true
    expect(tree.isNodeBlack(node5)).to be true
    expect(tree.isNodeRed(node4)).to be true
    expect(tree.isNodeRed(node6)).to be true
    expect(tree.isNodeRed(node3)).to be true
  end

    
  it 'should do left-right rotation' do
    tree = RedBlackTree.new()
    
    node1 = tree.insert(10)
    node2 = tree.insert(-10)
    node3 = tree.insert(20)
    node4 = tree.insert(7)
    node5 = tree.insert(15)
    
    expect(tree.to_s).to be '-10,7,10,15,20'
    expect(tree.root.height).to be 2
    
    expect(tree.isNodeBlack(node1)).to be true
    expect(tree.isNodeBlack(node2)).to be true
    expect(tree.isNodeBlack(node3)).to be true
    expect(tree.isNodeRed(node4)).to be true
    expect(tree.isNodeRed(node5)).to be true
    
    node6 = tree.insert(17)
    
    expect(tree.to_s).to be '-10,7,10,15,17,20'
    expect(tree.root.height).to be 2
    
    expect(tree.isNodeBlack(node1)).to be true
    expect(tree.isNodeBlack(node2)).to be true
    expect(tree.isNodeBlack(node6)).to be true
    expect(tree.isNodeRed(node4)).to be true
    expect(tree.isNodeRed(node5)).to be true
    expect(tree.isNodeRed(node3)).to be true
  end

    
  it 'should do recoloring, left-left and left-right rotation' do
    tree = RedBlackTree.new()
    
    node1 = tree.insert(10)
    node2 = tree.insert(-10)
    node3 = tree.insert(20)
    node4 = tree.insert(-20)
    node5 = tree.insert(6)
    node6 = tree.insert(15)
    node7 = tree.insert(30)
    node8 = tree.insert(1)
    node9 = tree.insert(9)
    
    expect(tree.to_s).to be '-20,-10,1,6,9,10,15,20,30'
    expect(tree.root.height).to be 3
    
    expect(tree.isNodeBlack(node1)).to be true
    expect(tree.isNodeRed(node2)).to be true
    expect(tree.isNodeBlack(node3)).to be true
    expect(tree.isNodeBlack(node4)).to be true
    expect(tree.isNodeBlack(node5)).to be true
    expect(tree.isNodeRed(node6)).to be true
    expect(tree.isNodeRed(node7)).to be true
    expect(tree.isNodeRed(node8)).to be true
    expect(tree.isNodeRed(node9)).to be true
    
    tree.insert(4);

    
    expect(tree.to_s).to be '-20,-10,1,4,6,9,10,15,20,30'
    expect(tree.root.height).to be 3
  end

    
  it 'should do right-left rotation' do
    tree = RedBlackTree.new()
    
    node1 = tree.insert(10)
    node2 = tree.insert(-10)
    node3 = tree.insert(20)
    node4 = tree.insert(-20)
    node5 = tree.insert(6)
    node6 = tree.insert(30)
    
    expect(tree.to_s).to be '-20,-10,6,10,20,30'
    expect(tree.root.height).to be 2
    
    expect(tree.isNodeBlack(node1)).to be true
    expect(tree.isNodeBlack(node2)).to be true
    expect(tree.isNodeBlack(node3)).to be true
    expect(tree.isNodeRed(node4)).to be true
    expect(tree.isNodeRed(node5)).to be true
    expect(tree.isNodeRed(node6)).to be true
    
    node7 = tree.insert(25)
    
    rightNode = tree.root.right
    rightLeftNode = rightNode.left
    rightRightNode = rightNode.right
    
    expect(rightNode.value).to be node7.value
    expect(rightLeftNode.value).to be node3.value
    expect(rightRightNode.value).to be node6.value
    
    expect(tree.to_s).to be '-20,-10,6,10,20,25,30'
    expect(tree.root.height).to be 2
    
    expect(tree.isNodeBlack(node1)).to be true
    expect(tree.isNodeBlack(node2)).to be true
    expect(tree.isNodeBlack(node7)).to be true
    expect(tree.isNodeRed(node4)).to be true
    expect(tree.isNodeRed(node5)).to be true
    expect(tree.isNodeRed(node3)).to be true
    expect(tree.isNodeRed(node6)).to be true
  end

    
  it 'should do left-left rotation with left grand-parent' do
    tree = RedBlackTree.new()
    
    tree.insert(20);

    tree.insert(15);

    tree.insert(25);

    tree.insert(10);

    tree.insert(5);

    
    expect(tree.to_s).to be '5,10,15,20,25'
    expect(tree.root.height).to be 2
  end

    
  it 'should do right-right rotation with left grand-parent' do
    tree = RedBlackTree.new()
    
    tree.insert(20);

    tree.insert(15);

    tree.insert(25);

    tree.insert(17);

    tree.insert(19);

    
    expect(tree.to_s).to be '15,17,19,20,25'
    expect(tree.root.height).to be 2
  end

    
  it 'should throw an error when trying to remove node' do
    const removeNodeFromRedBlackTree = () => {

    tree = RedBlackTree.new()
    
    tree.remove(1);

    };

    
    expect(removeNodeFromRedBlackTree).to toThrowError()
  end

end
