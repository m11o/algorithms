    
describe MinHeap do
  it 'should create an empty min heap' do
    minHeap = MinHeap.new()
    
    expect(minHeap.peek()).to eq nil
    expect(minHeap.isEmpty()).to eq true
  end

    
  it 'should add items to the heap and heapify it up' do
    minHeap = MinHeap.new()
    
    minHeap.add(5);

    expect(minHeap.isEmpty()).to eq false
    expect(minHeap.peek()).to eq 5
    expect(minHeap.to_s).to eq '5'
    
    minHeap.add(3);

    expect(minHeap.peek()).to eq 3
    expect(minHeap.to_s).to eq '3,5'
    
    minHeap.add(10);

    expect(minHeap.peek()).to eq 3
    expect(minHeap.to_s).to eq '3,5,10'
    
    minHeap.add(1);

    expect(minHeap.peek()).to eq 1
    expect(minHeap.to_s).to eq '1,3,10,5'
    
    minHeap.add(1);

    expect(minHeap.peek()).to eq 1
    expect(minHeap.to_s).to eq '1,1,10,5,3'
    
    expect(minHeap.poll()).to eq 1
    expect(minHeap.to_s).to eq '1,3,10,5'
    
    expect(minHeap.poll()).to eq 1
    expect(minHeap.to_s).to eq '3,5,10'
    
    expect(minHeap.poll()).to eq 3
    expect(minHeap.to_s).to eq '5,10'
  end

    
  it 'should poll items from the heap and heapify it down' do
    minHeap = MinHeap.new()
    
    minHeap.add(5);

    minHeap.add(3);

    minHeap.add(10);

    minHeap.add(11);

    minHeap.add(1);

    
    expect(minHeap.to_s).to eq '1,3,10,11,5'
    
    expect(minHeap.poll()).to eq 1
    expect(minHeap.to_s).to eq '3,5,10,11'
    
    expect(minHeap.poll()).to eq 3
    expect(minHeap.to_s).to eq '5,11,10'
    
    expect(minHeap.poll()).to eq 5
    expect(minHeap.to_s).to eq '10,11'
    
    expect(minHeap.poll()).to eq 10
    expect(minHeap.to_s).to eq '11'
    
    expect(minHeap.poll()).to eq 11
    expect(minHeap.to_s).to eq ''
    
    expect(minHeap.poll()).to eq nil
    expect(minHeap.to_s).to eq ''
  end

    
  it 'should heapify down through the right branch as well' do
    minHeap = MinHeap.new()
    
    minHeap.add(3);

    minHeap.add(12);

    minHeap.add(10);

    
    expect(minHeap.to_s).to eq '3,12,10'
    
    minHeap.add(11);

    expect(minHeap.to_s).to eq '3,11,10,12'
    
    expect(minHeap.poll()).to eq 3
    expect(minHeap.to_s).to eq '10,11,12'
  end

    
  it 'should be possible to find item indices in heap' do
    minHeap = MinHeap.new()
    
    minHeap.add(3);

    minHeap.add(12);

    minHeap.add(10);

    minHeap.add(11);

    minHeap.add(11);

    
    expect(minHeap.to_s).to eq '3,11,10,12,11'
    
    expect(minHeap.find(5)).to eq []
    expect(minHeap.find(3)).to eq [0]
    expect(minHeap.find(11)).to eq [1, 4]
  end

    
  it 'should be possible to remove items from heap with heapify down' do
    minHeap = MinHeap.new()
    
    minHeap.add(3);

    minHeap.add(12);

    minHeap.add(10);

    minHeap.add(11);

    minHeap.add(11);

    
    expect(minHeap.to_s).to eq '3,11,10,12,11'
    
    expect(minHeap.remove(3).to eq '10,11,11,12'
    expect(minHeap.remove(3).peek()).to eq 10
    expect(minHeap.remove(11).to eq '10,12'
    expect(minHeap.remove(3).peek()).to eq 10
  end

    
  it 'should be possible to remove items from heap with heapify up' do
    minHeap = MinHeap.new()
    
    minHeap.add(3);

    minHeap.add(10);

    minHeap.add(5);

    minHeap.add(6);

    minHeap.add(7);

    minHeap.add(4);

    minHeap.add(6);

    minHeap.add(8);

    minHeap.add(2);

    minHeap.add(1);

    
    expect(minHeap.to_s).to eq '1,2,4,6,3,5,6,10,8,7'
    expect(minHeap.remove(8).to eq '1,2,4,6,3,5,6,10,7'
    expect(minHeap.remove(7).to eq '1,2,4,6,3,5,6,10'
    expect(minHeap.remove(1).to eq '2,3,4,6,10,5,6'
    expect(minHeap.remove(2).to eq '3,6,4,6,10,5'
    expect(minHeap.remove(6).to eq '3,5,4,10'
    expect(minHeap.remove(10).to eq '3,5,4'
    expect(minHeap.remove(5).to eq '3,4'
    expect(minHeap.remove(3).to eq '4'
    expect(minHeap.remove(4).to eq ''
  end

    
  it 'should be possible to remove items from heap with custom finding comparator' do
    minHeap = MinHeap.new()
    minHeap.add('dddd');

    minHeap.add('ccc');

    minHeap.add('bb');

    minHeap.add('a');

    
    expect(minHeap.to_s).to eq 'a,bb,ccc,dddd'
    
    comparator = Comparator.new((a, b)
    if (a.length === b.length) {

    return 0;

    }

    
    return a.length < b.length ? -1 : 1;

    end

    
    minHeap.remove('hey', comparator);

    expect(minHeap.to_s).to eq 'a,bb,dddd'
  end

    
  it 'should remove values from heap and correctly re-order the tree' do
    minHeap = MinHeap.new()
    
    minHeap.add(1);

    minHeap.add(2);

    minHeap.add(3);

    minHeap.add(4);

    minHeap.add(5);

    minHeap.add(6);

    minHeap.add(7);

    minHeap.add(8);

    minHeap.add(9);

    
    expect(minHeap.to_s).to eq '1,2,3,4,5,6,7,8,9'
    
    minHeap.remove(2);

    expect(minHeap.to_s).to eq '1,4,3,8,5,6,7,9'
    
    minHeap.remove(4);

    expect(minHeap.to_s).to eq '1,5,3,8,9,6,7'
  end

end
