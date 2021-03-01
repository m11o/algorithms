    
describe AvlTree do
  it 'should do simple left-left rotation' do
    tree = AvlTree.new()
    
    tree.insert(4);

    tree.insert(3);

    tree.insert(2);

    
    expect(tree.to_s).to eq '2,3,4'
    expect(tree.root.value).to eq 3
    expect(tree.root.height).to eq 1
    
    tree.insert(1);

    
    expect(tree.to_s).to eq '1,2,3,4'
    expect(tree.root.value).to eq 3
    expect(tree.root.height).to eq 2
    
    tree.insert(0);

    
    expect(tree.to_s).to eq '0,1,2,3,4'
    expect(tree.root.value).to eq 3
    expect(tree.root.left.value).to eq 1
    expect(tree.root.height).to eq 2
  end

    
  it 'should do complex left-left rotation' do
    tree = AvlTree.new()
    
    tree.insert(30);

    tree.insert(20);

    tree.insert(40);

    tree.insert(10);

    
    expect(tree.root.value).to eq 30
    expect(tree.root.height).to eq 2
    expect(tree.to_s).to eq '10,20,30,40'
    
    tree.insert(25);

    expect(tree.root.value).to eq 30
    expect(tree.root.height).to eq 2
    expect(tree.to_s).to eq '10,20,25,30,40'
    
    tree.insert(5);

    expect(tree.root.value).to eq 20
    expect(tree.root.height).to eq 2
    expect(tree.to_s).to eq '5,10,20,25,30,40'
  end

    
  it 'should do simple right-right rotation' do
    tree = AvlTree.new()
    
    tree.insert(2);

    tree.insert(3);

    tree.insert(4);

    
    expect(tree.to_s).to eq '2,3,4'
    expect(tree.root.value).to eq 3
    expect(tree.root.height).to eq 1
    
    tree.insert(5);

    
    expect(tree.to_s).to eq '2,3,4,5'
    expect(tree.root.value).to eq 3
    expect(tree.root.height).to eq 2
    
    tree.insert(6);

    
    expect(tree.to_s).to eq '2,3,4,5,6'
    expect(tree.root.value).to eq 3
    expect(tree.root.right.value).to eq 5
    expect(tree.root.height).to eq 2
  end

    
  it 'should do complex right-right rotation' do
    tree = AvlTree.new()
    
    tree.insert(30);

    tree.insert(20);

    tree.insert(40);

    tree.insert(50);

    
    expect(tree.root.value).to eq 30
    expect(tree.root.height).to eq 2
    expect(tree.to_s).to eq '20,30,40,50'
    
    tree.insert(35);

    expect(tree.root.value).to eq 30
    expect(tree.root.height).to eq 2
    expect(tree.to_s).to eq '20,30,35,40,50'
    
    tree.insert(55);

    expect(tree.root.value).to eq 40
    expect(tree.root.height).to eq 2
    expect(tree.to_s).to eq '20,30,35,40,50,55'
  end

    
  it 'should do left-right rotation' do
    tree = AvlTree.new()
    
    tree.insert(30);

    tree.insert(20);

    tree.insert(25);

    
    expect(tree.root.height).to eq 1
    expect(tree.root.value).to eq 25
    expect(tree.to_s).to eq '20,25,30'
  end

    
  it 'should do right-left rotation' do
    tree = AvlTree.new()
    
    tree.insert(30);

    tree.insert(40);

    tree.insert(35);

    
    expect(tree.root.height).to eq 1
    expect(tree.root.value).to eq 35
    expect(tree.to_s).to eq '30,35,40'
  end

    
  it 'should create balanced tree: case #1' do
    // @see: https://www.youtube.com/watch?v=rbg7Qf8GkQ4&t=839s

    tree = AvlTree.new()
    
    tree.insert(1);

    tree.insert(2);

    tree.insert(3);

    
    expect(tree.root.value).to eq 2
    expect(tree.root.height).to eq 1
    expect(tree.to_s).to eq '1,2,3'
    
    tree.insert(6);

    
    expect(tree.root.value).to eq 2
    expect(tree.root.height).to eq 2
    expect(tree.to_s).to eq '1,2,3,6'
    
    tree.insert(15);

    
    expect(tree.root.value).to eq 2
    expect(tree.root.height).to eq 2
    expect(tree.to_s).to eq '1,2,3,6,15'
    
    tree.insert(-2);

    
    expect(tree.root.value).to eq 2
    expect(tree.root.height).to eq 2
    expect(tree.to_s).to eq '-2,1,2,3,6,15'
    
    tree.insert(-5);

    
    expect(tree.root.value).to eq 2
    expect(tree.root.height).to eq 2
    expect(tree.to_s).to eq '-5,-2,1,2,3,6,15'
    
    tree.insert(-8);

    
    expect(tree.root.value).to eq 2
    expect(tree.root.height).to eq 3
    expect(tree.to_s).to eq '-8,-5,-2,1,2,3,6,15'
  end

    
  it 'should create balanced tree: case #2' do
    // @see https://www.youtube.com/watch?v=7m94k2Qhg68

    tree = AvlTree.new()
    
    tree.insert(43);

    tree.insert(18);

    tree.insert(22);

    tree.insert(9);

    tree.insert(21);

    tree.insert(6);

    
    expect(tree.root.value).to eq 18
    expect(tree.root.height).to eq 2
    expect(tree.to_s).to eq '6,9,18,21,22,43'
    
    tree.insert(8);

    
    expect(tree.root.value).to eq 18
    expect(tree.root.height).to eq 2
    expect(tree.to_s).to eq '6,8,9,18,21,22,43'
  end

    
  it 'should do left right rotation and keeping left right node safe' do
    tree = AvlTree.new()
    
    tree.insert(30);

    tree.insert(15);

    tree.insert(40);

    tree.insert(10);

    tree.insert(18);

    tree.insert(35);

    tree.insert(45);

    tree.insert(5);

    tree.insert(12);

    
    expect(tree.to_s).to eq '5,10,12,15,18,30,35,40,45'
    expect(tree.root.height).to eq 3
    
    tree.insert(11);

    
    expect(tree.to_s).to eq '5,10,11,12,15,18,30,35,40,45'
    expect(tree.root.height).to eq 3
  end

    
  it 'should do left right rotation and keeping left right node safe' do
    tree = AvlTree.new()
    
    tree.insert(30);

    tree.insert(15);

    tree.insert(40);

    tree.insert(10);

    tree.insert(18);

    tree.insert(35);

    tree.insert(45);

    tree.insert(42);

    tree.insert(47);

    
    expect(tree.to_s).to eq '10,15,18,30,35,40,42,45,47'
    expect(tree.root.height).to eq 3
    
    tree.insert(43);

    
    expect(tree.to_s).to eq '10,15,18,30,35,40,42,43,45,47'
    expect(tree.root.height).to eq 3
  end

    
  it 'should remove values from the tree with right-right rotation' do
    tree = AvlTree.new()
    
    tree.insert(10);

    tree.insert(20);

    tree.insert(30);

    tree.insert(40);

    
    expect(tree.to_s).to eq '10,20,30,40'
    
    tree.remove(10);

    
    expect(tree.to_s).to eq '20,30,40'
    expect(tree.root.value).to eq 30
    expect(tree.root.left.value).to eq 20
    expect(tree.root.right.value).to eq 40
    expect(tree.root.balanceFactor).to eq 0
  end

    
  it 'should remove values from the tree with left-left rotation' do
    tree = AvlTree.new()
    
    tree.insert(10);

    tree.insert(20);

    tree.insert(30);

    tree.insert(5);

    
    expect(tree.to_s).to eq '5,10,20,30'
    
    tree.remove(30);

    
    expect(tree.to_s).to eq '5,10,20'
    expect(tree.root.value).to eq 10
    expect(tree.root.left.value).to eq 5
    expect(tree.root.right.value).to eq 20
    expect(tree.root.balanceFactor).to eq 0
  end

    
  it 'should keep balance after removal' do
    tree = AvlTree.new()
    
    tree.insert(1);

    tree.insert(2);

    tree.insert(3);

    tree.insert(4);

    tree.insert(5);

    tree.insert(6);

    tree.insert(7);

    tree.insert(8);

    tree.insert(9);

    
    expect(tree.to_s).to eq '1,2,3,4,5,6,7,8,9'
    expect(tree.root.value).to eq 4
    expect(tree.root.height).to eq 3
    expect(tree.root.balanceFactor).to eq -1
    
    tree.remove(8);

    
    expect(tree.root.value).to eq 4
    expect(tree.root.balanceFactor).to eq -1
    
    tree.remove(9);

    
    expect(tree.contains(8)).to eq 
    expect(tree.contains(9)).to eq 
    expect(tree.to_s).to eq '1,2,3,4,5,6,7'
    expect(tree.root.value).to eq 4
    expect(tree.root.height).to eq 2
    expect(tree.root.balanceFactor).to eq 0
  end

end
