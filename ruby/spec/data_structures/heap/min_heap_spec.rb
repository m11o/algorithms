xdescribe MinHeap do
  let(:min_heap) { MinHeap.new }

  it 'should create an empty min heap' do
    expect(min_heap.peek).to eq nil
    expect(min_heap.empty?).to eq true
  end

  it 'should add items to the heap and heapify it up' do
    min_heap.add(5)

    expect(min_heap.empty?).to eq false
    expect(min_heap.peek).to eq 5
    expect(min_heap.to_s).to eq '5'

    min_heap.add(3)

    expect(min_heap.peek).to eq 3
    expect(min_heap.to_s).to eq '3,5'

    min_heap.add(10)

    expect(min_heap.peek).to eq 3
    expect(min_heap.to_s).to eq '3,5,10'

    min_heap.add(1)

    expect(min_heap.peek).to eq 1
    expect(min_heap.to_s).to eq '1,3,10,5'

    min_heap.add(1)

    expect(min_heap.peek).to eq 1
    expect(min_heap.to_s).to eq '1,1,10,5,3'

    expect(min_heap.poll).to eq 1
    expect(min_heap.to_s).to eq '1,3,10,5'

    expect(min_heap.poll).to eq 1
    expect(min_heap.to_s).to eq '3,5,10'

    expect(min_heap.poll).to eq 3
    expect(min_heap.to_s).to eq '5,10'
  end

  it 'should poll items from the heap and heapify it down' do
    min_heap.add(5)
    min_heap.add(3)
    min_heap.add(10)
    min_heap.add(11)
    min_heap.add(1)

    expect(min_heap.to_s).to eq '1,3,10,11,5'

    expect(min_heap.poll).to eq 1
    expect(min_heap.to_s).to eq '3,5,10,11'

    expect(min_heap.poll).to eq 3
    expect(min_heap.to_s).to eq '5,11,10'

    expect(min_heap.poll).to eq 5
    expect(min_heap.to_s).to eq '10,11'

    expect(min_heap.poll).to eq 10
    expect(min_heap.to_s).to eq '11'

    expect(min_heap.poll).to eq 11
    expect(min_heap.to_s).to eq ''

    expect(min_heap.poll).to eq nil
    expect(min_heap.to_s).to eq ''
  end

  it 'should heapify down through the right branch as well' do
    min_heap.add(3)
    min_heap.add(12)
    min_heap.add(10)

    expect(min_heap.to_s).to eq '3,12,10'

    min_heap.add(11)

    expect(min_heap.to_s).to eq '3,11,10,12'

    expect(min_heap.poll).to eq 3
    expect(min_heap.to_s).to eq '10,11,12'
  end

  it 'should be possible to find item indices in heap' do
    min_heap.add(3)
    min_heap.add(12)
    min_heap.add(10)
    min_heap.add(11)
    min_heap.add(11)

    expect(min_heap.to_s).to eq '3,11,10,12,11'

    expect(min_heap.find(5)).to eq []
    expect(min_heap.find(3)).to eq [0]
    expect(min_heap.find(11)).to eq [1, 4]
  end

  it 'should be possible to remove items from heap with heapify down' do
    min_heap.add(3)
    min_heap.add(12)
    min_heap.add(10)
    min_heap.add(11)
    min_heap.add(11)

    expect(min_heap.to_s).to eq '3,11,10,12,11'

    expect(min_heap.remove(3)).to eq '10,11,11,12'
    expect(min_heap.remove(3).peek).to eq 10
    expect(min_heap.remove(11)).to eq '10,12'
    expect(min_heap.remove(3).peek).to eq 10
  end

  it 'should be possible to remove items from heap with heapify up' do
    min_heap.add(3)
    min_heap.add(10)
    min_heap.add(5)
    min_heap.add(6)
    min_heap.add(7)
    min_heap.add(4)
    min_heap.add(6)
    min_heap.add(8)
    min_heap.add(2)
    min_heap.add(1)

    expect(min_heap.to_s).to eq '1,2,4,6,3,5,6,10,8,7'
    expect(min_heap.remove(8)).to eq '1,2,4,6,3,5,6,10,7'
    expect(min_heap.remove(7)).to eq '1,2,4,6,3,5,6,10'
    expect(min_heap.remove(1)).to eq '2,3,4,6,10,5,6'
    expect(min_heap.remove(2)).to eq '3,6,4,6,10,5'
    expect(min_heap.remove(6)).to eq '3,5,4,10'
    expect(min_heap.remove(10)).to eq '3,5,4'
    expect(min_heap.remove(5)).to eq '3,4'
    expect(min_heap.remove(3)).to eq '4'
    expect(min_heap.remove(4)).to eq ''
  end

  it 'should remove values from heap and correctly re-order the tree' do
    min_heap.add(1)
    min_heap.add(2)
    min_heap.add(3)
    min_heap.add(4)
    min_heap.add(5)
    min_heap.add(6)
    min_heap.add(7)
    min_heap.add(8)
    min_heap.add(9)

    expect(min_heap.to_s).to eq '1,2,3,4,5,6,7,8,9'

    min_heap.remove(2)

    expect(min_heap.to_s).to eq '1,4,3,8,5,6,7,9'

    min_heap.remove(4)

    expect(min_heap.to_s).to eq '1,5,3,8,9,6,7'
  end
end
