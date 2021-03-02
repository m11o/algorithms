xdescribe PriorityQueue do
  let(:priority_queue) { PriorityQueue.new }

  it 'should insert items to the queue and respect priorities' do
    priority_queue.add(10, 1)

    expect(priority_queue.peek).to eq 10

    priority_queue.add(5, 2)

    expect(priority_queue.peek).to eq 10

    priority_queue.add(100, 0)

    expect(priority_queue.peek).to eq 100
  end

  it 'should be possible to use objects in priority queue' do
    user1 = { name: 'Mike' }
    user2 = { name: 'Bill' }
    user3 = { name: 'Jane' }

    priority_queue.add(user1, 1)

    expect(priority_queue.peek).to eq user1

    priority_queue.add(user2, 2)

    expect(priority_queue.peek).to eq user1

    priority_queue.add(user3, 0)

    expect(priority_queue.peek).to eq user3
  end

  it 'should poll from queue with respect to priorities' do
    priority_queue.add(10, 1)
    priority_queue.add(5, 2)
    priority_queue.add(100, 0)
    priority_queue.add(200, 0)

    expect(priority_queue.poll).to eq 100
    expect(priority_queue.poll).to eq 200
    expect(priority_queue.poll).to eq 10
    expect(priority_queue.poll).to eq 5
  end

  it 'should be possible to change priority of head node' do
    priority_queue.add(10, 1)
    priority_queue.add(5, 2)
    priority_queue.add(100, 0)
    priority_queue.add(200, 0)

    expect(priority_queue.peek).to eq 100

    priority_queue.change_priority(100, 10)
    priority_queue.change_priority(10, 20)

    expect(priority_queue.poll).to eq 200
    expect(priority_queue.poll).to eq 5
    expect(priority_queue.poll).to eq 100
    expect(priority_queue.poll).to eq 10
  end

  it 'should be possible to change priority of internal nodes' do
    priority_queue.add(10, 1)
    priority_queue.add(5, 2)
    priority_queue.add(100, 0)
    priority_queue.add(200, 0)

    expect(priority_queue.peek).to eq 100

    priority_queue.change_priority(200, 10)
    priority_queue.change_priority(10, 20)

    expect(priority_queue.poll).to eq 100
    expect(priority_queue.poll).to eq 5
    expect(priority_queue.poll).to eq 200
    expect(priority_queue.poll).to eq 10
  end

  it 'should be possible to change priority along with node addition' do
    priority_queue.add(10, 1)
    priority_queue.add(5, 2)
    priority_queue.add(100, 0)
    priority_queue.add(200, 0)

    priority_queue.change_priority(200, 10)
    priority_queue.change_priority(10, 20)

    priority_queue.add(15, 15)

    expect(priority_queue.poll).to eq 100
    expect(priority_queue.poll).to eq 5
    expect(priority_queue.poll).to eq 200
    expect(priority_queue.poll).to eq 15
    expect(priority_queue.poll).to eq 10
  end

  it 'should be possible to search in priority queue by value' do
    priority_queue.add(10, 1)
    priority_queue.add(5, 2)
    priority_queue.add(100, 0)
    priority_queue.add(200, 0)
    priority_queue.add(15, 15)

    expect(priority_queue.value?(70)).to eq false
    expect(priority_queue.value?(15)).to eq true
  end
end
