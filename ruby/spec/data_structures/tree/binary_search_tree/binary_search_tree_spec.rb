describe BinarySearchTree do
  let(:bst) { BinarySearchTree.new }

  it 'should create binary search tree' do
    expect(bst.root.value).to eq nil
    expect(bst.root.left).to eq nil
    expect(bst.root.right).to eq nil
  end

  it 'should insert values' do
    inserted_node1 = bst.insert(10)
    inserted_node2 = bst.insert(20)
    bst.insert(5)

    expect(bst.to_s).to eq '5,10,20'
    expect(inserted_node1.value).to eq 10
    expect(inserted_node2.value).to eq 20
  end

  it 'should check if value exists' do
    bst.insert(10)
    bst.insert(20)
    bst.insert(5)

    expect(bst.include?(20)).to eq true
    expect(bst.include?(40)).to eq false
  end

  it 'should remove nodes' do
    bst.insert(10)
    bst.insert(20)
    bst.insert(5)

    expect(bst.to_s).to eq '5,10,20'

    removed1 = bst.remove(5)
    expect(bst.to_s).to eq '10,20'
    expect(removed1).to eq true

    removed2 = bst.remove(20)
    expect(bst.to_s).to eq '10'
    expect(removed2).to eq true
  end

  it 'should be traversed to sorted array' do
    bst.insert(10)
    bst.insert(-10)
    bst.insert(20)
    bst.insert(-20)
    bst.insert(25)
    bst.insert(6)

    expect(bst.to_s).to eq '-20,-10,6,10,20,25'
    expect(bst.root.height).to eq 2

    bst.insert(4)

    expect(bst.to_s).to eq '-20,-10,4,6,10,20,25'
    expect(bst.root.height).to eq 3
  end
end
