xdescribe BinarySearchTreeNode do
  it 'should create binary search tree' do
    bst_node = BinarySearchTreeNode.new(2)

    expect(bst_node.value).to eq 2
    expect(bst_node.left).to eq nil
    expect(bst_node.right).to eq nil
  end

  it 'should insert in itself if it is empty' do
    bst_node = BinarySearchTreeNode.new
    bst_node.insert(1)

    expect(bst_node.value).to eq 1
    expect(bst_node.left).to eq nil
    expect(bst_node.right).to eq nil
  end

  it 'should insert nodes in correct order' do
    bst_node = BinarySearchTreeNode.new(2)
    inserted_node1 = bst_node.insert(1)

    expect(inserted_node1.value).to eq 1
    expect(bst_node.to_s).to eq '1,2'
    expect(bst_node.include?(1)).to eq true
    expect(bst_node.include?(3)).to eq false

    inserted_node2 = bst_node.insert(3)

    expect(inserted_node2.value).to eq 3
    expect(bst_node.to_s).to eq '1,2,3'
    expect(bst_node.include?(3)).to eq true
    expect(bst_node.include?(4)).to eq false

    bst_node.insert(7)

    expect(bst_node.to_s).to eq '1,2,3,7'
    expect(bst_node.include?(7)).to eq true
    expect(bst_node.include?(8)).to eq false

    bst_node.insert(4)

    expect(bst_node.to_s).to eq '1,2,3,4,7'
    expect(bst_node.include?(4)).to eq true
    expect(bst_node.include?(8)).to eq false

    bst_node.insert(6)

    expect(bst_node.to_s).to eq '1,2,3,4,6,7'
    expect(bst_node.include?(6)).to eq true
    expect(bst_node.include?(8)).to eq false
  end

  it 'should not insert duplicates' do
    bst_node = BinarySearchTreeNode.new(2)
    bst_node.insert(1)

    expect(bst_node.to_s).to eq '1,2'
    expect(bst_node.include?(1)).to eq true
    expect(bst_node.include?(3)).to eq false

    bst_node.insert(1)

    expect(bst_node.to_s).to eq '1,2'
    expect(bst_node.include?(1)).to eq true
    expect(bst_node.include?(3)).to eq false
  end

  it 'should find min node' do
    node = BinarySearchTreeNode.new(10)
    node.insert(20)
    node.insert(30)
    node.insert(5)
    node.insert(40)
    node.insert(1)

    expect(node.find_min).not_to eq nil
    expect(node.find_min.value).to eq 1
  end

  it 'should be possible to attach meta information to binary search tree nodes' do
    node = BinarySearchTreeNode.new(10)

    node.insert(20)

    node1 = node.insert(30)
    node.insert(5)
    node.insert(40)

    node2 = node.insert(1)

    node.meta.set('color', 'red')
    node1.meta.set('color', 'black')
    node2.meta.set('color', 'white')

    expect(node.meta.get('color')).to eq 'red'
    expect(node.find_min).not_to eq nil
    expect(node.find_min.value).to eq 1
    expect(node.find_min.meta.get('color')).to eq 'white'
    expect(node.find(30).meta.get('color')).to eq 'black'
  end

  it 'should find node' do
    node = BinarySearchTreeNode.new(10)
    node.insert(20)
    node.insert(30)
    node.insert(5)
    node.insert(40)
    node.insert(1)

    expect(node.find(6)).to eq nil
    expect(node.find(5)).not_to eq nil
    expect(node.find(5).value).to eq 5
  end

  it 'should remove leaf nodes' do
    bst_root_node = BinarySearchTreeNode.new
    bst_root_node.insert(10)
    bst_root_node.insert(20)
    bst_root_node.insert(5)

    expect(bst_root_node.to_s).to eq '5,10,20'

    removed1 = bst_root_node.remove(5)
    expect(bst_root_node.to_s).to eq '10,20'
    expect(removed1).to eq true

    removed2 = bst_root_node.remove(20)
    expect(bst_root_node.to_s).to eq '10'
    expect(removed2).to eq true
  end

  it 'should remove nodes with one child' do
    bst_root_node = BinarySearchTreeNode.new
    bst_root_node.insert(10)
    bst_root_node.insert(20)
    bst_root_node.insert(5)
    bst_root_node.insert(30)

    expect(bst_root_node.to_s).to eq '5,10,20,30'

    bst_root_node.remove(20)

    expect(bst_root_node.to_s).to eq '5,10,30'

    bst_root_node.insert(1)

    expect(bst_root_node.to_s).to eq '1,5,10,30'

    bst_root_node.remove(5)

    expect(bst_root_node.to_s).to eq '1,10,30'
  end

  it 'should remove nodes with two children' do
    bst_root_node = BinarySearchTreeNode.new
    bst_root_node.insert(10)
    bst_root_node.insert(20)
    bst_root_node.insert(5)
    bst_root_node.insert(30)
    bst_root_node.insert(15)
    bst_root_node.insert(25)

    expect(bst_root_node.to_s).to eq '5,10,15,20,25,30'
    expect(bst_root_node.find(20).left.value).to eq 15
    expect(bst_root_node.find(20).right.value).to eq 30

    bst_root_node.remove(20)

    expect(bst_root_node.to_s).to eq '5,10,15,25,30'

    bst_root_node.remove(15)

    expect(bst_root_node.to_s).to eq '5,10,25,30'

    bst_root_node.remove(10)

    expect(bst_root_node.to_s).to eq '5,25,30'
    expect(bst_root_node.value).to eq 25

    bst_root_node.remove(25)

    expect(bst_root_node.to_s).to eq '5,30'

    bst_root_node.remove(5)

    expect(bst_root_node.to_s).to eq '30'
  end

  it 'should remove node with no parent' do
    bst_root_node = BinarySearchTreeNode.new
    expect(bst_root_node.to_s).to eq ''

    bst_root_node.insert(1)
    bst_root_node.insert(2)

    expect(bst_root_node.to_s).to eq '1,2'

    bst_root_node.remove(1)

    expect(bst_root_node.to_s).to eq '2'

    bst_root_node.remove(2)

    expect(bst_root_node.to_s).to eq ''
  end

  it 'should throw error when trying to remove not existing node' do
    bst_root_node = BinarySearchTreeNode.new

    bst_root_node.insert(10)
    bst_root_node.insert(20)

    def remove_not_existing_element_from_tree(bst_root_node)
      bst_root_node.remove(30)
    end

    expect { remove_not_existing_element_from_tree(bst_root_node) }.to raise_error Exception
  end

  it 'should abandon removed node' do
    root_node = BinarySearchTreeNode.new('foo')
    root_node.insert('bar')

    child_node = root_node.find('bar')
    root_node.remove('bar')

    expect(child_node.parent).to eq nil
  end
end
