xdescribe SegmentTree do
  it 'should build tree for input array #0 with length of power of two' do
    array = [-1, 2]
    segment_tree = SegmentTree.new(array, Math.min, Infinity)

    expect(segment_tree.segment_tree).to match_array [-1, -1, 2]
    expect(segment_tree.segment_tree.length).to eq (2 * array.length) - 1
  end

  it 'should build tree for input array #1 with length of power of two' do
    array = [-1, 2, 4, 0]
    segment_tree = SegmentTree.new(array, Math.min, Infinity)

    expect(segment_tree.segment_tree).to match_array [-1, -1, 0, -1, 2, 4, 0]
    expect(segment_tree.segment_tree.length).to eq (2 * array.length) - 1
  end

  it 'should build tree for input array #0 with length not of power of two' do
    array = [0, 1, 2]
    segment_tree = SegmentTree.new(array, Math.min, Infinity)

    expect(segment_tree.segment_tree).to match_array [0, 0, 2, 0, 1, nil, nil]
    expect(segment_tree.segment_tree.length).to eq (2 * 4) - 1
  end

  it 'should build tree for input array #1 with length not of power of two' do
    array = [-1, 3, 4, 0, 2, 1]
    segment_tree = SegmentTree.new(array, Math.min, Infinity)

    expect(segment_tree.segment_tree).to match_array [-1, -1, 0, -1, 4, 0, 1, -1, 3, nil, nil, 0, 2, nil, nil]
    expect(segment_tree.segment_tree.length).to eq (2 * 8) - 1
  end

  it 'should build max array' do
    array = [-1, 2, 4, 0]
    segment_tree = SegmentTree.new(array, Math.max, -Infinity)

    expect(segment_tree.segment_tree).to match_array [4, 2, 4, -1, 2, 4, 0]
    expect(segment_tree.segment_tree.length).to eq (2 * array.length) - 1
  end

  it 'should build sum array' do
    array = [-1, 2, 4, 0]
    segment_tree = SegmentTree.new(array) { |a, b| a + b }

    expect(segment_tree.segment_tree).to match_array [5, 1, 4, -1, 2, 4, 0]
    expect(segment_tree.segment_tree.length).to eq (2 * array.length) - 1
  end

  it 'should do min range query on power of two length array' do
    array = [-1, 3, 4, 0, 2, 1]
    segment_tree = SegmentTree.new(array, Math.min, Infinity)

    expect(segment_tree.range_query(0, 5)).to eq(-1)
    expect(segment_tree.range_query(0, 2)).to eq(-1)
    expect(segment_tree.range_query(1, 3)).to eq 0
    expect(segment_tree.range_query(2, 4)).to eq 0
    expect(segment_tree.range_query(4, 5)).to eq 1
    expect(segment_tree.range_query(2, 2)).to eq 4
  end

  it 'should do min range query on not power of two length array' do
    array = [-1, 2, 4, 0]
    segment_tree = SegmentTree.new(array, Math.min, Infinity)

    expect(segment_tree.range_query(0, 4)).to eq(-1)
    expect(segment_tree.range_query(0, 1)).to eq(-1)
    expect(segment_tree.range_query(1, 3)).to eq 0
    expect(segment_tree.range_query(1, 2)).to eq 2
    expect(segment_tree.range_query(2, 3)).to eq 0
    expect(segment_tree.range_query(2, 2)).to eq 4
  end

  it 'should do max range query' do
    array = [-1, 3, 4, 0, 2, 1]
    segment_tree = SegmentTree.new(array, Math.max, -Infinity)

    expect(segment_tree.range_query(0, 5)).to eq 4
    expect(segment_tree.range_query(0, 1)).to eq 3
    expect(segment_tree.range_query(1, 3)).to eq 4
    expect(segment_tree.range_query(2, 4)).to eq 4
    expect(segment_tree.range_query(4, 5)).to eq 2
    expect(segment_tree.range_query(3, 3)).to eq 0
  end

  it 'should do sum range query' do
    array = [-1, 3, 4, 0, 2, 1]
    segment_tree = SegmentTree.new(array) { |a, b| a + b }

    expect(segment_tree.range_query(0, 5)).to eq 9
    expect(segment_tree.range_query(0, 1)).to eq 2
    expect(segment_tree.range_query(1, 3)).to eq 7
    expect(segment_tree.range_query(2, 4)).to eq 6
    expect(segment_tree.range_query(4, 5)).to eq 3
    expect(segment_tree.range_query(3, 3)).to eq 0
  end
end
