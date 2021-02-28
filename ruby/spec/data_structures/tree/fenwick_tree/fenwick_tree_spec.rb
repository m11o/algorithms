    
describe FenwickTree do
  it 'should create empty fenwick tree of correct size' do
    tree1 = FenwickTree.new(5)
    expect(tree1.treeArray.length).to eq 5 + 1
    
    i = 0
    expect(tree1.treeArray[i]).to eq 0
    }

    
    tree2 = FenwickTree.new(50)
    expect(tree2.treeArray.length).to eq 50 + 1
  end

    
  it 'should create correct fenwick tree' do
    inputArray = [3, 2, -1, 6, 5, 4, -3, 3, 7, 2, 3]
    
    tree = FenwickTree.new(inputArray.length)
    expect(tree.treeArray.length).to eq inputArray.length + 1
    
    inputArray.forEach((value, index) => {

    tree.increase(index + 1, value);

    end

    
    expect(tree.treeArray).to eq [0, 3, 5, -1, 10, 5, 9, -3, 19, 7, 9, 3]
    
    expect(tree.query(1)).to eq 3
    expect(tree.query(2)).to eq 5
    expect(tree.query(3)).to eq 4
    expect(tree.query(4)).to eq 10
    expect(tree.query(5)).to eq 15
    expect(tree.query(6)).to eq 19
    expect(tree.query(7)).to eq 16
    expect(tree.query(8)).to eq 19
    expect(tree.query(9)).to eq 26
    expect(tree.query(10)).to eq 28
    expect(tree.query(11)).to eq 31
    
    expect(tree.queryRange(1, 1)).to eq 3
    expect(tree.queryRange(1, 2)).to eq 5
    expect(tree.queryRange(2, 4)).to eq 7
    expect(tree.queryRange(6, 9)).to eq 11
    
    tree.increase(3, 1);

    
    expect(tree.query(1)).to eq 3
    expect(tree.query(2)).to eq 5
    expect(tree.query(3)).to eq 5
    expect(tree.query(4)).to eq 11
    expect(tree.query(5)).to eq 16
    expect(tree.query(6)).to eq 20
    expect(tree.query(7)).to eq 17
    expect(tree.query(8)).to eq 20
    expect(tree.query(9)).to eq 27
    expect(tree.query(10)).to eq 29
    expect(tree.query(11)).to eq 32
    
    expect(tree.queryRange(1, 1)).to eq 3
    expect(tree.queryRange(1, 2)).to eq 5
    expect(tree.queryRange(2, 4)).to eq 8
    expect(tree.queryRange(6, 9)).to eq 11
  end

    
  it 'should correctly execute queries' do
    tree = FenwickTree.new(5)
    
    tree.increase(1, 4);

    tree.increase(3, 7);

    
    expect(tree.query(1)).to eq 4
    expect(tree.query(3)).to eq 11
    expect(tree.query(5)).to eq 11
    expect(tree.queryRange(2, 3)).to eq 7
    
    tree.increase(2, 5);

    expect(tree.query(5)).to eq 16
    
    tree.increase(1, 3);

    expect(tree.queryRange(1, 1)).to eq 7
    expect(tree.query(5)).to eq 19
    expect(tree.queryRange(1, 5)).to eq 19
  end

    
  it 'should throw exceptions' do
    tree = FenwickTree.new(5)
    
    const increaseAtInvalidLowIndex = () => {

    tree.increase(0, 1);

    };

    
    const increaseAtInvalidHighIndex = () => {

    tree.increase(10, 1);

    };

    
    const queryInvalidLowIndex = () => {

    tree.query(0);

    };

    
    const queryInvalidHighIndex = () => {

    tree.query(10);

    };

    
    const rangeQueryInvalidIndex = () => {

    tree.queryRange(3, 2);

    };

    
    expect(increaseAtInvalidLowIndex).to toThrowError()
    expect(increaseAtInvalidHighIndex).to toThrowError()
    expect(queryInvalidLowIndex).to toThrowError()
    expect(queryInvalidHighIndex).to toThrowError()
    expect(rangeQueryInvalidIndex).to toThrowError()
  end

end
