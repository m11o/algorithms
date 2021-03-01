    
xdescribe BinaryTreeNode do
  it 'should create node' do
    node = BinaryTreeNode.new()
    
    
    expect(node.value).to eq nil
    expect(node.left).to eq nil
    expect(node.right).to eq nil
    
    leftNode = BinaryTreeNode.new(1)
    rightNode = BinaryTreeNode.new(3)
    rootNode = BinaryTreeNode.new(2)
    
    rootNode

    .setLeft(leftNode)

    .setRight(rightNode);

    
    expect(rootNode.value).to eq 2
    expect(rootNode.left.value).to eq 1
    expect(rootNode.right.value).to eq 3
  end

    
  it 'should set parent' do
    leftNode = BinaryTreeNode.new(1)
    rightNode = BinaryTreeNode.new(3)
    rootNode = BinaryTreeNode.new(2)
    
    rootNode

    .setLeft(leftNode)

    .setRight(rightNode);

    
    expect(rootNode.parent).to eq nil
    expect(rootNode.left.parent.value).to eq 2
    expect(rootNode.right.parent.value).to eq 2
    expect(rootNode.right.parent).to eq rootNode
  end

    
  it 'should traverse node' do
    leftNode = BinaryTreeNode.new(1)
    rightNode = BinaryTreeNode.new(3)
    rootNode = BinaryTreeNode.new(2)
    
    rootNode

    .setLeft(leftNode)

    .setRight(rightNode);

    
    expect(rootNode.traverseInOrder()).to eq [1, 2, 3]
    
    expect(rootNode.to_s).to eq '1,2,3'
  end

    
  it 'should remove child node' do
    leftNode = BinaryTreeNode.new(1)
    rightNode = BinaryTreeNode.new(3)
    rootNode = BinaryTreeNode.new(2)
    
    rootNode

    .setLeft(leftNode)

    .setRight(rightNode);

    
    expect(rootNode.traverseInOrder()).to eq [1, 2, 3]
    
    expect(rootNode.removeChild(rootNode.left)).to eq true
    expect(rootNode.traverseInOrder()).to eq [2, 3]
    
    expect(rootNode.removeChild(rootNode.right)).to eq true
    expect(rootNode.traverseInOrder()).to eq [2]
    
    expect(rootNode.removeChild(rootNode.right)).to eq false
    expect(rootNode.traverseInOrder()).to eq [2]
  end

    
  it 'should replace child node' do
    leftNode = BinaryTreeNode.new(1)
    rightNode = BinaryTreeNode.new(3)
    rootNode = BinaryTreeNode.new(2)
    
    rootNode

    .setLeft(leftNode)

    .setRight(rightNode);

    
    expect(rootNode.traverseInOrder()).to eq [1, 2, 3]
    
    replacementNode = BinaryTreeNode.new(5)
    rightNode.setRight(replacementNode);

    
    expect(rootNode.traverseInOrder()).to eq [1, 2, 3, 5]
    
    expect(rootNode.replaceChild(rootNode.right, rootNode.right.right)).to eq true
    expect(rootNode.right.value).to eq 5
    expect(rootNode.right.right).to eq nil
    expect(rootNode.traverseInOrder()).to eq [1, 2, 5]
    
    expect(rootNode.replaceChild(rootNode.right, rootNode.right.right)).to eq false
    expect(rootNode.traverseInOrder()).to eq [1, 2, 5]
    
    expect(rootNode.replaceChild(rootNode.right, replacementNode)).to eq true
    expect(rootNode.traverseInOrder()).to eq [1, 2, 5]
    
    expect(rootNode.replaceChild(rootNode.left, replacementNode)).to eq true
    expect(rootNode.traverseInOrder()).to eq [5, 2, 5]
    
    expect(rootNode.replaceChild(new BinaryTreeNode(), new BinaryTreeNode())).to eq false
  end

    
  it 'should calculate node height' do
    root = BinaryTreeNode.new(1)
    left = BinaryTreeNode.new(3)
    right = BinaryTreeNode.new(2)
    grandLeft = BinaryTreeNode.new(5)
    grandRight = BinaryTreeNode.new(6)
    grandGrandLeft = BinaryTreeNode.new(7)
    
    expect(root.height).to eq 0
    expect(root.balanceFactor).to eq 0
    
    root

    .setLeft(left)

    .setRight(right);

    
    expect(root.height).to eq 1
    expect(left.height).to eq 0
    expect(root.balanceFactor).to eq 0
    
    left

    .setLeft(grandLeft)

    .setRight(grandRight);

    
    expect(root.height).to eq 2
    expect(left.height).to eq 1
    expect(grandLeft.height).to eq 0
    expect(grandRight.height).to eq 0
    expect(root.balanceFactor).to eq 1
    
    grandLeft.setLeft(grandGrandLeft);

    
    expect(root.height).to eq 3
    expect(left.height).to eq 2
    expect(grandLeft.height).to eq 1
    expect(grandRight.height).to eq 0
    expect(grandGrandLeft.height).to eq 0
    expect(root.balanceFactor).to eq 2
  end

    
  it 'should calculate node height for right nodes as well' do
    root = BinaryTreeNode.new(1)
    right = BinaryTreeNode.new(2)
    
    root.setRight(right);

    
    expect(root.height).to eq 1
    expect(right.height).to eq 0
    expect(root.balanceFactor).to eq -1
  end

    
  it 'should set null for left and right node' do
    root = BinaryTreeNode.new(2)
    left = BinaryTreeNode.new(1)
    right = BinaryTreeNode.new(3)
    
    root.setLeft(left);

    root.setRight(right);

    
    expect(root.left.value).to eq 1
    expect(root.right.value).to eq 3
    
    root.setLeft(null);

    root.setRight(null);

    
    expect(root.left).to eq nil
    expect(root.right).to eq nil
  end

    
  it 'should be possible to create node with object as a value' do
    obj1 = { key: 'object_1', toString: () => 'object_1' }
    obj2 = { key: 'object_2' }
    
    node1 = BinaryTreeNode.new(obj1)
    node2 = BinaryTreeNode.new(obj2)
    
    node1.setLeft(node2);

    
    expect(node1.value).to eq obj1
    expect(node2.value).to eq obj2
    expect(node1.left.value).to eq obj2
    
    node1.removeChild(node2);

    
    expect(node1.value).to eq obj1
    expect(node2.value).to eq obj2
    expect(node1.left).to eq nil
    
    expect(node1.to_s).to eq 'object_1'
    expect(node2.to_s).to eq '[object Object]'
  end

    
  it 'should be possible to attach meta information to the node' do
    redNode = BinaryTreeNode.new(1)
    blackNode = BinaryTreeNode.new(2)
    
    redNode.meta.set('color', 'red');

    blackNode.meta.set('color', 'black');

    
    expect(redNode.meta.get('color')).to eq 'red'
    expect(blackNode.meta.get('color')).to eq 'black'
  end

    
  it 'should detect right uncle' do
    grandParent = BinaryTreeNode.new('grand-parent')
    parent = BinaryTreeNode.new('parent')
    uncle = BinaryTreeNode.new('uncle')
    child = BinaryTreeNode.new('child')
    
    expect(grandParent.uncle).not.toBeDefined();

    expect(parent.uncle).not.toBeDefined();

    
    grandParent.setLeft(parent);

    
    expect(parent.uncle).not.toBeDefined();

    expect(child.uncle).not.toBeDefined();

    
    parent.setLeft(child);

    
    expect(child.uncle).not.toBeDefined();

    
    grandParent.setRight(uncle);

    
    expect(parent.uncle).not.toBeDefined();

    expect(child.uncle).to eq uncle
  end

    
  it 'should detect left uncle' do
    grandParent = BinaryTreeNode.new('grand-parent')
    parent = BinaryTreeNode.new('parent')
    uncle = BinaryTreeNode.new('uncle')
    child = BinaryTreeNode.new('child')
    
    expect(grandParent.uncle).not.toBeDefined();

    expect(parent.uncle).not.toBeDefined();

    
    grandParent.setRight(parent);

    
    expect(parent.uncle).not.toBeDefined();

    expect(child.uncle).not.toBeDefined();

    
    parent.setRight(child);

    
    expect(child.uncle).not.toBeDefined();

    
    grandParent.setLeft(uncle);

    
    expect(parent.uncle).not.toBeDefined();

    expect(child.uncle).to eq uncle
  end

    
  it 'should be possible to set node values' do
    node = BinaryTreeNode.new('initial_value')
    
    expect(node.value).to eq 'initial_value'
    
    node.setValue('new_value');

    
    expect(node.value).to eq 'new_value'
  end

    
  it 'should be possible to copy node' do
    root = BinaryTreeNode.new('root')
    left = BinaryTreeNode.new('left')
    right = BinaryTreeNode.new('right')
    
    root

    .setLeft(left)

    .setRight(right);

    
    expect(root.to_s).to eq 'left,root,right'
    
    newRoot = BinaryTreeNode.new('new_root')
    newLeft = BinaryTreeNode.new('new_left')
    newRight = BinaryTreeNode.new('new_right')
    
    newRoot

    .setLeft(newLeft)

    .setRight(newRight);

    
    expect(newRoot.to_s).to eq 'new_left,new_root,new_right'
    
    BinaryTreeNode.copyNode(root, newRoot);

    
    expect(root.to_s).to eq 'left,root,right'
    expect(newRoot.to_s).to eq 'left,root,right'
  end

end
