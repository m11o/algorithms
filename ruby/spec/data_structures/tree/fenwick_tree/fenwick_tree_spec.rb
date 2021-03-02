xdescribe FenwickTree do
  it 'should create empty fenwick tree of correct size' do
    tree1 = FenwickTree.new(5)
    expect(tree1.tree_array.length).to eq 5 + 1

    5.times do |i|
      expect(tree1.tree_array[i]).to eq 0
    end

    tree2 = FenwickTree.new(50)
    expect(tree2.tree_array.length).to eq 50 + 1
  end

  it 'should create correct fenwick tree' do
    input_array = [3, 2, -1, 6, 5, 4, -3, 3, 7, 2, 3]

    tree = FenwickTree.new(input_array.length)
    expect(tree.tree_array.length).to eq input_array.length + 1

    input_array.each_with_index do |value, index|
      tree.increase(index + 1, value)
    end

    expect(tree.tree_array).to eq [0, 3, 5, -1, 10, 5, 9, -3, 19, 7, 9, 3]

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

    expect(tree.query_range(1, 1)).to eq 3
    expect(tree.query_range(1, 2)).to eq 5
    expect(tree.query_range(2, 4)).to eq 7
    expect(tree.query_range(6, 9)).to eq 11

    tree.increase(3, 1)

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

    expect(tree.query_range(1, 1)).to eq 3
    expect(tree.query_range(1, 2)).to eq 5
    expect(tree.query_range(2, 4)).to eq 8
    expect(tree.query_range(6, 9)).to eq 11
  end

  it 'should correctly execute queries' do
    tree = FenwickTree.new(5)
    tree.increase(1, 4)
    tree.increase(3, 7)

    expect(tree.query(1)).to eq 4
    expect(tree.query(3)).to eq 11
    expect(tree.query(5)).to eq 11
    expect(tree.query_range(2, 3)).to eq 7

    tree.increase(2, 5)

    expect(tree.query(5)).to eq 16

    tree.increase(1, 3)

    expect(tree.query_range(1, 1)).to eq 7
    expect(tree.query(5)).to eq 19
    expect(tree.query_range(1, 5)).to eq 19
  end

  it 'should throw exceptions' do
    tree = FenwickTree.new(5)

    def increase_at_invalid_low_index(tree)
      tree.increase(0, 1)
    end

    def increase_at_invalid_high_index(tree)
      tree.increase(10, 1)
    end

    def query_invalid_low_index(tree)
      tree.query(0)
    end

    def query_invalid_high_index(tree)
      tree.query(10)
    end

    def range_query_invalid_index(tree)
      tree.query_range(3, 2)
    end

    expect { increase_at_invalid_low_index(tree) }.to raise_error Exception
    expect { increase_at_invalid_high_index(tree) }.to raise_error Exception
    expect { query_invalid_low_index(tree) }.to raise_error Exception
    expect { query_invalid_high_index(tree) }.to raise_error Exception
    expect { range_query_invalid_index(tree) }.to raise_error Exception
  end
end
