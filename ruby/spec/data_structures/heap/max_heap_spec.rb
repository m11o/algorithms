    
describe MaxHeap do
  it 'should create an empty max heap' do
    maxHeap = MaxHeap.new()
    
    expect(maxHeap.peek()).to eq nil
    expect(maxHeap.isEmpty()).to be true
  end

    
  it 'should add items to the heap and heapify it up' do
    maxHeap = MaxHeap.new()
    
    maxHeap.add(5);

    expect(maxHeap.isEmpty()).to be false
    expect(maxHeap.peek()).to be 5
    expect(maxHeap.to_s).to be '5'
    
    maxHeap.add(3);

    expect(maxHeap.peek()).to be 5
    expect(maxHeap.to_s).to be '5,3'
    
    maxHeap.add(10);

    expect(maxHeap.peek()).to be 10
    expect(maxHeap.to_s).to be '10,3,5'
    
    maxHeap.add(1);

    expect(maxHeap.peek()).to be 10
    expect(maxHeap.to_s).to be '10,3,5,1'
    
    maxHeap.add(1);

    expect(maxHeap.peek()).to be 10
    expect(maxHeap.to_s).to be '10,3,5,1,1'
    
    expect(maxHeap.poll()).to be 10
    expect(maxHeap.to_s).to be '5,3,1,1'
    
    expect(maxHeap.poll()).to be 5
    expect(maxHeap.to_s).to be '3,1,1'
    
    expect(maxHeap.poll()).to be 3
    expect(maxHeap.to_s).to be '1,1'
  end

    
  it 'should poll items from the heap and heapify it down' do
    maxHeap = MaxHeap.new()
    
    maxHeap.add(5);

    maxHeap.add(3);

    maxHeap.add(10);

    maxHeap.add(11);

    maxHeap.add(1);

    
    expect(maxHeap.to_s).to be '11,10,5,3,1'
    
    expect(maxHeap.poll()).to be 11
    expect(maxHeap.to_s).to be '10,3,5,1'
    
    expect(maxHeap.poll()).to be 10
    expect(maxHeap.to_s).to be '5,3,1'
    
    expect(maxHeap.poll()).to be 5
    expect(maxHeap.to_s).to be '3,1'
    
    expect(maxHeap.poll()).to be 3
    expect(maxHeap.to_s).to be '1'
    
    expect(maxHeap.poll()).to be 1
    expect(maxHeap.to_s).to be ''
    
    expect(maxHeap.poll()).to eq nil
    expect(maxHeap.to_s).to be ''
  end

    
  it 'should heapify down through the right branch as well' do
    maxHeap = MaxHeap.new()
    
    maxHeap.add(3);

    maxHeap.add(12);

    maxHeap.add(10);

    
    expect(maxHeap.to_s).to be '12,3,10'
    
    maxHeap.add(11);

    expect(maxHeap.to_s).to be '12,11,10,3'
    
    expect(maxHeap.poll()).to be 12
    expect(maxHeap.to_s).to be '11,3,10'
  end

    
  it 'should be possible to find item indices in heap' do
    maxHeap = MaxHeap.new()
    
    maxHeap.add(3);

    maxHeap.add(12);

    maxHeap.add(10);

    maxHeap.add(11);

    maxHeap.add(11);

    
    expect(maxHeap.to_s).to be '12,11,10,3,11'
    
    expect(maxHeap.find(5)).to eq []
    expect(maxHeap.find(12)).to eq [0]
    expect(maxHeap.find(11)).to eq [1, 4]
  end

    
  it 'should be possible to remove items from heap with heapify down' do
    maxHeap = MaxHeap.new()
    
    maxHeap.add(3);

    maxHeap.add(12);

    maxHeap.add(10);

    maxHeap.add(11);

    maxHeap.add(11);

    
    expect(maxHeap.to_s).to be '12,11,10,3,11'
    
    expect(maxHeap.remove(12).to eq '11,11,10,3'
    expect(maxHeap.remove(12).peek()).to eq 11
    expect(maxHeap.remove(11).to eq '10,3'
    expect(maxHeap.remove(10).peek()).to eq 3
  end

    
  it 'should be possible to remove items from heap with heapify up' do
    maxHeap = MaxHeap.new()
    
    maxHeap.add(3);

    maxHeap.add(10);

    maxHeap.add(5);

    maxHeap.add(6);

    maxHeap.add(7);

    maxHeap.add(4);

    maxHeap.add(6);

    maxHeap.add(8);

    maxHeap.add(2);

    maxHeap.add(1);

    
    expect(maxHeap.to_s).to be '10,8,6,7,6,4,5,3,2,1'
    expect(maxHeap.remove(4).to eq '10,8,6,7,6,1,5,3,2'
    expect(maxHeap.remove(3).to eq '10,8,6,7,6,1,5,2'
    expect(maxHeap.remove(5).to eq '10,8,6,7,6,1,2'
    expect(maxHeap.remove(10).to eq '8,7,6,2,6,1'
    expect(maxHeap.remove(6).to eq '8,7,1,2'
    expect(maxHeap.remove(2).to eq '8,7,1'
    expect(maxHeap.remove(1).to eq '8,7'
    expect(maxHeap.remove(7).to eq '8'
    expect(maxHeap.remove(8).to eq ''
  end

    
  it 'should be possible to remove items from heap with custom finding comparator' do
    maxHeap = MaxHeap.new()
    maxHeap.add('a');

    maxHeap.add('bb');

    maxHeap.add('ccc');

    maxHeap.add('dddd');

    
    expect(maxHeap.to_s).to be 'dddd,ccc,bb,a'
    
    comparator = Comparator.new((a, b)
    if (a.length === b.length) {

    return 0;

    }

    
    return a.length < b.length ? -1 : 1;

    end

    
    maxHeap.remove('hey', comparator);

    expect(maxHeap.to_s).to be 'dddd,a,bb'
  end

end
