describe RedBlackTree do
  let(:tree) { RedBlackTree.new }

  it 'should always color first inserted node as black' do
    first_inserted_node = tree.insert(10)

    expect(tree.node_colored?(first_inserted_node)).to eq true
    expect(tree.node_black?(first_inserted_node)).to eq true
    expect(tree.node_red?(first_inserted_node)).to eq false

    expect(tree.to_s).to eq '10'
    expect(tree.root.height).to eq 0
  end

  it 'should always color new leaf node as red' do
    first_inserted_node = tree.insert(10)
    second_inserted_node = tree.insert(15)
    third_inserted_node = tree.insert(5)

    expect(tree.node_black?(first_inserted_node)).to eq true
    expect(tree.node_red?(second_inserted_node)).to eq true
    expect(tree.node_red?(third_inserted_node)).to eq true

    expect(tree.to_s).to eq '5,10,15'
    expect(tree.root.height).to eq 1
  end

  it 'should balance itself' do
    tree.insert(5)
    tree.insert(10)
    tree.insert(15)
    tree.insert(20)
    tree.insert(25)
    tree.insert(30)

    expect(tree.to_s).to eq '5,10,15,20,25,30'
    expect(tree.root.height).to eq 3
  end

  it 'should balance itself when parent is black' do
    node1 = tree.insert(10)

    expect(tree.node_black?(node1)).to eq true

    node2 = tree.insert(-10)

    expect(tree.node_black?(node1)).to eq true
    expect(tree.node_red?(node2)).to eq true

    node3 = tree.insert(20)

    expect(tree.node_black?(node1)).to eq true
    expect(tree.node_red?(node2)).to eq true
    expect(tree.node_red?(node3)).to eq true

    node4 = tree.insert(-20)

    expect(tree.node_black?(node1)).to eq true
    expect(tree.node_black?(node2)).to eq true
    expect(tree.node_black?(node3)).to eq true
    expect(tree.node_red?(node4)).to eq true

    node5 = tree.insert(25)

    expect(tree.node_black?(node1)).to eq true
    expect(tree.node_black?(node2)).to eq true
    expect(tree.node_black?(node3)).to eq true
    expect(tree.node_red?(node4)).to eq true
    expect(tree.node_red?(node5)).to eq true

    node6 = tree.insert(6)

    expect(tree.node_black?(node1)).to eq true
    expect(tree.node_black?(node2)).to eq true
    expect(tree.node_black?(node3)).to eq true
    expect(tree.node_red?(node4)).to eq true
    expect(tree.node_red?(node5)).to eq true
    expect(tree.node_red?(node6)).to eq true

    expect(tree.to_s).to eq '-20,-10,6,10,20,25'
    expect(tree.root.height).to eq 2

    node7 = tree.insert(4)

    expect(tree.root.left.value).to eq node2.value

    expect(tree.to_s).to eq '-20,-10,4,6,10,20,25'
    expect(tree.root.height).to eq 3

    expect(tree.node_black?(node1)).to eq true
    expect(tree.node_red?(node2)).to eq true
    expect(tree.node_black?(node3)).to eq true
    expect(tree.node_black?(node4)).to eq true
    expect(tree.node_black?(node4)).to eq true
    expect(tree.node_red?(node5)).to eq true
    expect(tree.node_black?(node6)).to eq true
    expect(tree.node_red?(node7)).to eq true
  end

  it 'should balance itself when uncle is red' do
    node1 = tree.insert(10)
    node2 = tree.insert(-10)
    node3 = tree.insert(20)
    node4 = tree.insert(-20)
    node5 = tree.insert(6)
    node6 = tree.insert(15)
    node7 = tree.insert(25)
    node8 = tree.insert(2)
    node9 = tree.insert(8)

    expect(tree.to_s).to eq '-20,-10,2,6,8,10,15,20,25'
    expect(tree.root.height).to eq 3

    expect(tree.node_black?(node1)).to eq true
    expect(tree.node_red?(node2)).to eq true
    expect(tree.node_black?(node3)).to eq true
    expect(tree.node_black?(node4)).to eq true
    expect(tree.node_black?(node5)).to eq true
    expect(tree.node_red?(node6)).to eq true
    expect(tree.node_red?(node7)).to eq true
    expect(tree.node_red?(node8)).to eq true
    expect(tree.node_red?(node9)).to eq true

    node10 = tree.insert(4)

    expect(tree.to_s).to eq '-20,-10,2,4,6,8,10,15,20,25'
    expect(tree.root.height).to eq 3
    expect(tree.root.value).to eq node5.value
    expect(tree.node_black?(node5)).to eq true
    expect(tree.node_red?(node1)).to eq true
    expect(tree.node_red?(node2)).to eq true
    expect(tree.node_red?(node10)).to eq true
    expect(tree.node_red?(node6)).to eq true
    expect(tree.node_red?(node7)).to eq true
    expect(tree.node_black?(node4)).to eq true
    expect(tree.node_black?(node8)).to eq true
    expect(tree.node_black?(node9)).to eq true
    expect(tree.node_black?(node3)).to eq true
  end

  it 'should do left-left rotation' do
    node1 = tree.insert(10)
    node2 = tree.insert(-10)
    node3 = tree.insert(20)
    node4 = tree.insert(7)
    node5 = tree.insert(15)

    expect(tree.to_s).to eq '-10,7,10,15,20'
    expect(tree.root.height).to eq 2

    expect(tree.node_black?(node1)).to eq true
    expect(tree.node_black?(node2)).to eq true
    expect(tree.node_black?(node3)).to eq true
    expect(tree.node_red?(node4)).to eq true
    expect(tree.node_red?(node5)).to eq true

    node6 = tree.insert(13)

    expect(tree.to_s).to eq '-10,7,10,13,15,20'
    expect(tree.root.height).to eq 2

    expect(tree.node_black?(node1)).to eq true
    expect(tree.node_black?(node2)).to eq true
    expect(tree.node_black?(node5)).to eq true
    expect(tree.node_red?(node4)).to eq true
    expect(tree.node_red?(node6)).to eq true
    expect(tree.node_red?(node3)).to eq true
  end

  it 'should do left-right rotation' do
    node1 = tree.insert(10)
    node2 = tree.insert(-10)
    node3 = tree.insert(20)
    node4 = tree.insert(7)
    node5 = tree.insert(15)

    expect(tree.to_s).to eq '-10,7,10,15,20'
    expect(tree.root.height).to eq 2

    expect(tree.node_black?(node1)).to eq true
    expect(tree.node_black?(node2)).to eq true
    expect(tree.node_black?(node3)).to eq true
    expect(tree.node_red?(node4)).to eq true
    expect(tree.node_red?(node5)).to eq true

    node6 = tree.insert(17)

    expect(tree.to_s).to eq '-10,7,10,15,17,20'
    expect(tree.root.height).to eq 2

    expect(tree.node_black?(node1)).to eq true
    expect(tree.node_black?(node2)).to eq true
    expect(tree.node_black?(node6)).to eq true
    expect(tree.node_red?(node4)).to eq true
    expect(tree.node_red?(node5)).to eq true
    expect(tree.node_red?(node3)).to eq true
  end

  it 'should do recoloring, left-left and left-right rotation' do
    node1 = tree.insert(10)
    node2 = tree.insert(-10)
    node3 = tree.insert(20)
    node4 = tree.insert(-20)
    node5 = tree.insert(6)
    node6 = tree.insert(15)
    node7 = tree.insert(30)
    node8 = tree.insert(1)
    node9 = tree.insert(9)

    expect(tree.to_s).to eq '-20,-10,1,6,9,10,15,20,30'
    expect(tree.root.height).to eq 3

    expect(tree.node_black?(node1)).to eq true
    expect(tree.node_red?(node2)).to eq true
    expect(tree.node_black?(node3)).to eq true
    expect(tree.node_black?(node4)).to eq true
    expect(tree.node_black?(node5)).to eq true
    expect(tree.node_red?(node6)).to eq true
    expect(tree.node_red?(node7)).to eq true
    expect(tree.node_red?(node8)).to eq true
    expect(tree.node_red?(node9)).to eq true

    tree.insert(4)

    expect(tree.to_s).to eq '-20,-10,1,4,6,9,10,15,20,30'
    expect(tree.root.height).to eq 3
  end

  it 'should do right-left rotation' do
    node1 = tree.insert(10)
    node2 = tree.insert(-10)
    node3 = tree.insert(20)
    node4 = tree.insert(-20)
    node5 = tree.insert(6)
    node6 = tree.insert(30)

    expect(tree.to_s).to eq '-20,-10,6,10,20,30'
    expect(tree.root.height).to eq 2

    expect(tree.node_black?(node1)).to eq true
    expect(tree.node_black?(node2)).to eq true
    expect(tree.node_black?(node3)).to eq true
    expect(tree.node_red?(node4)).to eq true
    expect(tree.node_red?(node5)).to eq true
    expect(tree.node_red?(node6)).to eq true

    node7 = tree.insert(25)

    right_node = tree.root.right
    right_left_node = right_node.left
    right_right_node = right_node.right

    expect(right_node.value).to eq node7.value
    expect(right_left_node.value).to eq node3.value
    expect(right_right_node.value).to eq node6.value

    expect(tree.to_s).to eq '-20,-10,6,10,20,25,30'
    expect(tree.root.height).to eq 2

    expect(tree.node_black?(node1)).to eq true
    expect(tree.node_black?(node2)).to eq true
    expect(tree.node_black?(node7)).to eq true
    expect(tree.node_red?(node4)).to eq true
    expect(tree.node_red?(node5)).to eq true
    expect(tree.node_red?(node3)).to eq true
    expect(tree.node_red?(node6)).to eq true
  end

  it 'should do left-left rotation with left grand-parent' do
    tree.insert(20)
    tree.insert(15)
    tree.insert(25)
    tree.insert(10)
    tree.insert(5)

    expect(tree.to_s).to eq '5,10,15,20,25'
    expect(tree.root.height).to eq 2
  end

  it 'should do right-right rotation with left grand-parent' do
    tree.insert(20)
    tree.insert(15)
    tree.insert(25)
    tree.insert(17)
    tree.insert(19)

    expect(tree.to_s).to eq '15,17,19,20,25'
    expect(tree.root.height).to eq 2
  end

  it 'should throw an error when trying to remove node' do
    def remove_node_from_red_black_tree(tree)
      tree.remove(1)
    end

    expect { remove_node_from_red_black_tree(tree) }.to raise_error NotImplementedError
  end
end
