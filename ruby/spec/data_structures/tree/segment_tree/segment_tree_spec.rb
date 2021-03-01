    
describe SegmentTree do
  it 'should build tree for input array #0 with length of power of two' do
    array = [-1, 2]
    segmentTree = SegmentTree.new(array, Math.min, Infinity)
    
    expect(segmentTree.segmentTree).to eq [-1, -1, 2]
    expect(segmentTree.segmentTree.length).to eq (2 * array.length) - 1
  end

    
  it 'should build tree for input array #1 with length of power of two' do
    array = [-1, 2, 4, 0]
    segmentTree = SegmentTree.new(array, Math.min, Infinity)
    
    expect(segmentTree.segmentTree).to eq [-1, -1, 0, -1, 2, 4, 0]
    expect(segmentTree.segmentTree.length).to eq (2 * array.length) - 1
  end

    
  it 'should build tree for input array #0 with length not of power of two' do
    array = [0, 1, 2]
    segmentTree = SegmentTree.new(array, Math.min, Infinity)
    
    expect(segmentTree.segmentTree).to eq [0, 0, 2, 0, 1, null, null]
    expect(segmentTree.segmentTree.length).to eq (2 * 4) - 1
  end

    
  it 'should build tree for input array #1 with length not of power of two' do
    array = [-1, 3, 4, 0, 2, 1]
    segmentTree = SegmentTree.new(array, Math.min, Infinity)
    
    expect(segmentTree.segmentTree).toEqual([

    -1, -1, 0, -1, 4, 0, 1, -1, 3, null, null, 0, 2, null, null,

    ]);

    expect(segmentTree.segmentTree.length).to eq (2 * 8) - 1
  end

    
  it 'should build max array' do
    array = [-1, 2, 4, 0]
    segmentTree = SegmentTree.new(array, Math.max, -Infinity)
    
    expect(segmentTree.segmentTree).to eq [4, 2, 4, -1, 2, 4, 0]
    expect(segmentTree.segmentTree.length).to eq (2 * array.length) - 1
  end

    
  it 'should build sum array' do
    array = [-1, 2, 4, 0]
    segmentTree = SegmentTree.new(array, (a, b)
    
    expect(segmentTree.segmentTree).to eq [5, 1, 4, -1, 2, 4, 0]
    expect(segmentTree.segmentTree.length).to eq (2 * array.length) - 1
  end

    
  it 'should do min range query on power of two length array' do
    array = [-1, 3, 4, 0, 2, 1]
    segmentTree = SegmentTree.new(array, Math.min, Infinity)
    
    expect(segmentTree.rangeQuery(0, 5)).to eq -1
    expect(segmentTree.rangeQuery(0, 2)).to eq -1
    expect(segmentTree.rangeQuery(1, 3)).to eq 0
    expect(segmentTree.rangeQuery(2, 4)).to eq 0
    expect(segmentTree.rangeQuery(4, 5)).to eq 1
    expect(segmentTree.rangeQuery(2, 2)).to eq 4
  end

    
  it 'should do min range query on not power of two length array' do
    array = [-1, 2, 4, 0]
    segmentTree = SegmentTree.new(array, Math.min, Infinity)
    
    expect(segmentTree.rangeQuery(0, 4)).to eq -1
    expect(segmentTree.rangeQuery(0, 1)).to eq -1
    expect(segmentTree.rangeQuery(1, 3)).to eq 0
    expect(segmentTree.rangeQuery(1, 2)).to eq 2
    expect(segmentTree.rangeQuery(2, 3)).to eq 0
    expect(segmentTree.rangeQuery(2, 2)).to eq 4
  end

    
  it 'should do max range query' do
    array = [-1, 3, 4, 0, 2, 1]
    segmentTree = SegmentTree.new(array, Math.max, -Infinity)
    
    expect(segmentTree.rangeQuery(0, 5)).to eq 4
    expect(segmentTree.rangeQuery(0, 1)).to eq 3
    expect(segmentTree.rangeQuery(1, 3)).to eq 4
    expect(segmentTree.rangeQuery(2, 4)).to eq 4
    expect(segmentTree.rangeQuery(4, 5)).to eq 2
    expect(segmentTree.rangeQuery(3, 3)).to eq 0
  end

    
  it 'should do sum range query' do
    array = [-1, 3, 4, 0, 2, 1]
    segmentTree = SegmentTree.new(array, (a, b)
    
    expect(segmentTree.rangeQuery(0, 5)).to eq 9
    expect(segmentTree.rangeQuery(0, 1)).to eq 2
    expect(segmentTree.rangeQuery(1, 3)).to eq 7
    expect(segmentTree.rangeQuery(2, 4)).to eq 6
    expect(segmentTree.rangeQuery(4, 5)).to eq 3
    expect(segmentTree.rangeQuery(3, 3)).to eq 0
  end

end
