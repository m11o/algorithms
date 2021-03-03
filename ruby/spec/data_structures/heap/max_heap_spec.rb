describe MaxHeap do
  let(:max_heap) { MaxHeap.new }

  it 'should create an empty max heap' do
    expect(max_heap.peek).to eq nil
    expect(max_heap.empty?).to eq true
  end

  it 'should add items to the heap and heapify it up' do
    max_heap.add(5)

    expect(max_heap.empty?).to eq false
    expect(max_heap.peek).to eq 5
    expect(max_heap.to_s).to eq '5'

    max_heap.add(3)

    expect(max_heap.peek).to eq 5
    expect(max_heap.to_s).to eq '5,3'

    max_heap.add(10)

    expect(max_heap.peek).to eq 10
    expect(max_heap.to_s).to eq '10,3,5'

    max_heap.add(1)

    expect(max_heap.peek).to eq 10
    expect(max_heap.to_s).to eq '10,3,5,1'

    max_heap.add(1)

    expect(max_heap.peek).to eq 10
    expect(max_heap.to_s).to eq '10,3,5,1,1'

    expect(max_heap.poll).to eq 10
    expect(max_heap.to_s).to eq '5,3,1,1'

    expect(max_heap.poll).to eq 5
    expect(max_heap.to_s).to eq '3,1,1'

    expect(max_heap.poll).to eq 3
    expect(max_heap.to_s).to eq '1,1'
  end

  it 'should poll items from the heap and heapify it down' do
    max_heap.add(5)
    max_heap.add(3)
    max_heap.add(10)
    max_heap.add(11)
    max_heap.add(1)

    expect(max_heap.to_s).to eq '11,10,5,3,1'

    expect(max_heap.poll).to eq 11
    expect(max_heap.to_s).to eq '10,3,5,1'

    expect(max_heap.poll).to eq 10
    expect(max_heap.to_s).to eq '5,3,1'

    expect(max_heap.poll).to eq 5
    expect(max_heap.to_s).to eq '3,1'

    expect(max_heap.poll).to eq 3
    expect(max_heap.to_s).to eq '1'

    expect(max_heap.poll).to eq 1
    expect(max_heap.to_s).to eq ''

    expect(max_heap.poll).to eq nil
    expect(max_heap.to_s).to eq ''
  end

  it 'should heapify down through the right branch as well' do
    max_heap.add(3)
    max_heap.add(12)
    max_heap.add(10)

    expect(max_heap.to_s).to eq '12,3,10'

    max_heap.add(11)

    expect(max_heap.to_s).to eq '12,11,10,3'

    expect(max_heap.poll).to eq 12
    expect(max_heap.to_s).to eq '11,3,10'
  end

  it 'should be possible to find item indices in heap' do
    max_heap.add(3)
    max_heap.add(12)
    max_heap.add(10)
    max_heap.add(11)
    max_heap.add(11)

    expect(max_heap.to_s).to eq '12,11,10,3,11'

    expect(max_heap.find(5)).to eq []
    expect(max_heap.find(12)).to eq [0]
    expect(max_heap.find(11)).to eq [1, 4]
  end

  it 'should be possible to remove items from heap with heapify down' do
    max_heap.add(3)
    max_heap.add(12)
    max_heap.add(10)
    max_heap.add(11)
    max_heap.add(11)

    expect(max_heap.to_s).to eq '12,11,10,3,11'

    expect(max_heap.remove(12).to_s).to eq '11,11,10,3'
    expect(max_heap.remove(12).peek).to eq 11
    expect(max_heap.remove(11).to_s).to eq '10,3'
    expect(max_heap.remove(10).peek).to eq 3
  end

  it 'should be possible to remove items from heap with heapify up' do
    max_heap.add(3)
    max_heap.add(10)
    max_heap.add(5)
    max_heap.add(6)
    max_heap.add(7)
    max_heap.add(4)
    max_heap.add(6)
    max_heap.add(8)
    max_heap.add(2)
    max_heap.add(1)

    expect(max_heap.to_s).to eq '10,8,6,7,6,4,5,3,2,1'
    expect(max_heap.remove(4).to_s).to eq '10,8,6,7,6,1,5,3,2'
    expect(max_heap.remove(3).to_s).to eq '10,8,6,7,6,1,5,2'
    expect(max_heap.remove(5).to_s).to eq '10,8,6,7,6,1,2'
    expect(max_heap.remove(10).to_s).to eq '8,7,6,2,6,1'
    expect(max_heap.remove(6).to_s).to eq '8,7,1,2'
    expect(max_heap.remove(2).to_s).to eq '8,7,1'
    expect(max_heap.remove(1).to_s).to eq '8,7'
    expect(max_heap.remove(7).to_s).to eq '8'
    expect(max_heap.remove(8).to_s).to eq ''
  end
end
