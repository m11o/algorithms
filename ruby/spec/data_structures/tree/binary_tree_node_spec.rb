describe BinaryTreeNode do
  it 'should create node' do
    node = BinaryTreeNode.new

    expect(node.value).to eq nil
    expect(node.left).to eq nil
    expect(node.right).to eq nil

    left_node = BinaryTreeNode.new(1)
    right_node = BinaryTreeNode.new(3)
    root_node = BinaryTreeNode.new(2)

    root_node.left = left_node
    root_node.right = right_node

    expect(root_node.value).to eq 2
    expect(root_node.left.value).to eq 1
    expect(root_node.right.value).to eq 3
  end

  it 'should set parent' do
    left_node = BinaryTreeNode.new(1)
    right_node = BinaryTreeNode.new(3)
    root_node = BinaryTreeNode.new(2)

    root_node.left = left_node
    root_node.right = right_node

    expect(root_node.parent).to eq nil
    expect(root_node.left.parent.value).to eq 2
    expect(root_node.right.parent.value).to eq 2
    expect(root_node.right.parent).to eq root_node
  end

  it 'should traverse node' do
    left_node = BinaryTreeNode.new(1)
    right_node = BinaryTreeNode.new(3)
    root_node = BinaryTreeNode.new(2)

    root_node.left = left_node
    root_node.right = right_node

    expect(root_node.traverse_in_order).to match_array [1, 2, 3]
    expect(root_node.to_s).to eq '1,2,3'
  end

  it 'should remove child node' do
    left_node = BinaryTreeNode.new(1)
    right_node = BinaryTreeNode.new(3)
    root_node = BinaryTreeNode.new(2)

    root_node.left = left_node
    root_node.right = right_node

    expect(root_node.traverse_in_order).to match_array [1, 2, 3]

    expect(root_node.remove_child(root_node.left)).to eq true
    expect(root_node.traverse_in_order).to match_array [2, 3]

    expect(root_node.remove_child(root_node.right)).to eq true
    expect(root_node.traverse_in_order).to match_array [2]

    expect(root_node.remove_child(root_node.right)).to eq false
    expect(root_node.traverse_in_order).to match_array [2]
  end

  it 'should replace child node' do
    left_node = BinaryTreeNode.new(1)
    right_node = BinaryTreeNode.new(3)
    root_node = BinaryTreeNode.new(2)

    root_node.left = left_node
    root_node.right = right_node

    expect(root_node.traverse_in_order).to match_array [1, 2, 3]

    replacement_node = BinaryTreeNode.new(5)
    right_node.right = replacement_node

    expect(root_node.traverse_in_order).to eq [1, 2, 3, 5]

    expect(root_node.replace_child(root_node.right, root_node.right.right)).to eq true
    expect(root_node.right.value).to eq 5
    expect(root_node.right.right).to eq nil
    expect(root_node.traverse_in_order).to eq [1, 2, 5]

    expect(root_node.replace_child(root_node.right, root_node.right.right)).to eq false
    expect(root_node.traverse_in_order).to eq [1, 2, 5]

    expect(root_node.replace_child(root_node.right, replacement_node)).to eq true
    expect(root_node.traverse_in_order).to eq [1, 2, 5]

    expect(root_node.replace_child(root_node.left, replacement_node)).to eq true
    expect(root_node.traverse_in_order).to eq [5, 2, 5]

    expect(root_node.replace_child(BinaryTreeNode.new, BinaryTreeNode.new)).to eq false
  end

  it 'should calculate node height' do
    root = BinaryTreeNode.new(1)
    left = BinaryTreeNode.new(3)
    right = BinaryTreeNode.new(2)
    grand_left = BinaryTreeNode.new(5)
    grand_right = BinaryTreeNode.new(6)
    grand_grand_left = BinaryTreeNode.new(7)

    expect(root.height).to eq 0
    expect(root.balance_factor).to eq 0

    root.left = left
    root.right = right

    expect(root.height).to eq 1
    expect(left.height).to eq 0
    expect(root.balance_factor).to eq 0

    left.left = grand_left
    left.right = grand_right

    expect(root.height).to eq 2
    expect(left.height).to eq 1
    expect(grand_left.height).to eq 0
    expect(grand_right.height).to eq 0
    expect(root.balance_factor).to eq 1

    grand_left.left = grand_grand_left

    expect(root.height).to eq 3
    expect(left.height).to eq 2
    expect(grand_left.height).to eq 1
    expect(grand_right.height).to eq 0
    expect(grand_grand_left.height).to eq 0
    expect(root.balance_factor).to eq 2
  end

  it 'should calculate node height for right nodes as well' do
    root = BinaryTreeNode.new(1)
    right = BinaryTreeNode.new(2)

    root.right = right

    expect(root.height).to eq 1
    expect(right.height).to eq 0
    expect(root.balance_factor).to eq(-1)
  end

  it 'should set null for left and right node' do
    root = BinaryTreeNode.new(2)
    left = BinaryTreeNode.new(1)
    right = BinaryTreeNode.new(3)

    root.left = left
    root.right = right

    expect(root.left.value).to eq 1
    expect(root.right.value).to eq 3

    root.left = nil
    root.right = nil

    expect(root.left).to eq nil
    expect(root.right).to eq nil
  end

  it 'should be possible to create node with object as a value' do
    obj1 = { key: 'object_1' }
    obj2 = { key: 'object_2' }

    node1 = BinaryTreeNode.new(obj1)
    node2 = BinaryTreeNode.new(obj2)

    node1.left = node2

    expect(node1.value).to eq obj1
    expect(node2.value).to eq obj2
    expect(node1.left.value).to eq obj2

    node1.remove_child(node2)

    expect(node1.value).to eq obj1
    expect(node2.value).to eq obj2
    expect(node1.left).to eq nil

    block = ->(_value) { 'object_1' }
    expect(node1.to_s(&block)).to eq 'object_1'
    expect(node2.to_s).to eq '{:key=>"object_2"}'
  end

  it 'should be possible to attach meta information to the node' do
    red_node = BinaryTreeNode.new(1)
    black_node = BinaryTreeNode.new(2)

    red_node.meta.set('color', 'red')
    black_node.meta.set('color', 'black')

    expect(red_node.meta.get('color')).to eq 'red'
    expect(black_node.meta.get('color')).to eq 'black'
  end

  it 'should detect right uncle' do
    grand_parent = BinaryTreeNode.new('grand-parent')
    parent = BinaryTreeNode.new('parent')
    uncle = BinaryTreeNode.new('uncle')
    child = BinaryTreeNode.new('child')

    expect(grand_parent.uncle).to eq nil
    expect(parent.uncle).to eq nil

    grand_parent.left = parent

    expect(parent.uncle).to eq nil
    expect(child.uncle).to eq nil

    parent.left = child

    expect(child.uncle).to eq nil

    grand_parent.right = uncle

    expect(parent.uncle).to eq nil
    expect(child.uncle).to eq uncle
  end

  it 'should detect left uncle' do
    grand_parent = BinaryTreeNode.new('grand-parent')
    parent = BinaryTreeNode.new('parent')
    uncle = BinaryTreeNode.new('uncle')
    child = BinaryTreeNode.new('child')

    expect(grand_parent.uncle).to eq nil
    expect(parent.uncle).to eq nil

    grand_parent.right = parent

    expect(parent.uncle).to eq nil
    expect(child.uncle).to eq nil

    parent.right = child

    expect(child.uncle).to eq nil

    grand_parent.left = uncle

    expect(parent.uncle).to eq nil
    expect(child.uncle).to eq uncle
  end

  it 'should be possible to set node values' do
    node = BinaryTreeNode.new('initial_value')

    expect(node.value).to eq 'initial_value'

    node.value = 'new_value'

    expect(node.value).to eq 'new_value'
  end

  it 'should be possible to copy node' do
    root = BinaryTreeNode.new('root')
    left = BinaryTreeNode.new('left')
    right = BinaryTreeNode.new('right')

    root.left = left
    root.right = right

    expect(root.to_s).to eq 'left,root,right'

    new_root = BinaryTreeNode.new('new_root')
    new_left = BinaryTreeNode.new('new_left')
    new_right = BinaryTreeNode.new('new_right')

    new_root.left = new_left
    new_root.right = new_right

    expect(new_root.to_s).to eq 'new_left,new_root,new_right'

    BinaryTreeNode.copy_node(root, new_root)

    expect(root.to_s).to eq 'left,root,right'
    expect(new_root.to_s).to eq 'left,root,right'
  end
end
