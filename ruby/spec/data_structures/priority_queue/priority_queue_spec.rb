    
describe PriorityQueue do
  it 'should create default priority queue' do
    priorityQueue = PriorityQueue.new()
    
  end

    
  it 'should insert items to the queue and respect priorities' do
    priorityQueue = PriorityQueue.new()
    
    priorityQueue.add(10, 1);

    expect(priorityQueue.peek()).to eq 10
    
    priorityQueue.add(5, 2);

    expect(priorityQueue.peek()).to eq 10
    
    priorityQueue.add(100, 0);

    expect(priorityQueue.peek()).to eq 100
  end

    
  it 'should be possible to use objects in priority queue' do
    priorityQueue = PriorityQueue.new()
    
    user1 = { name: 'Mike' }
    user2 = { name: 'Bill' }
    user3 = { name: 'Jane' }
    
    priorityQueue.add(user1, 1);

    expect(priorityQueue.peek()).to eq user1
    
    priorityQueue.add(user2, 2);

    expect(priorityQueue.peek()).to eq user1
    
    priorityQueue.add(user3, 0);

    expect(priorityQueue.peek()).to eq user3
  end

    
  it 'should poll from queue with respect to priorities' do
    priorityQueue = PriorityQueue.new()
    
    priorityQueue.add(10, 1);

    priorityQueue.add(5, 2);

    priorityQueue.add(100, 0);

    priorityQueue.add(200, 0);

    
    expect(priorityQueue.poll()).to eq 100
    expect(priorityQueue.poll()).to eq 200
    expect(priorityQueue.poll()).to eq 10
    expect(priorityQueue.poll()).to eq 5
  end

    
  it 'should be possible to change priority of head node' do
    priorityQueue = PriorityQueue.new()
    
    priorityQueue.add(10, 1);

    priorityQueue.add(5, 2);

    priorityQueue.add(100, 0);

    priorityQueue.add(200, 0);

    
    expect(priorityQueue.peek()).to eq 100
    
    priorityQueue.changePriority(100, 10);

    priorityQueue.changePriority(10, 20);

    
    expect(priorityQueue.poll()).to eq 200
    expect(priorityQueue.poll()).to eq 5
    expect(priorityQueue.poll()).to eq 100
    expect(priorityQueue.poll()).to eq 10
  end

    
  it 'should be possible to change priority of internal nodes' do
    priorityQueue = PriorityQueue.new()
    
    priorityQueue.add(10, 1);

    priorityQueue.add(5, 2);

    priorityQueue.add(100, 0);

    priorityQueue.add(200, 0);

    
    expect(priorityQueue.peek()).to eq 100
    
    priorityQueue.changePriority(200, 10);

    priorityQueue.changePriority(10, 20);

    
    expect(priorityQueue.poll()).to eq 100
    expect(priorityQueue.poll()).to eq 5
    expect(priorityQueue.poll()).to eq 200
    expect(priorityQueue.poll()).to eq 10
  end

    
  it 'should be possible to change priority along with node addition' do
    priorityQueue = PriorityQueue.new()
    
    priorityQueue.add(10, 1);

    priorityQueue.add(5, 2);

    priorityQueue.add(100, 0);

    priorityQueue.add(200, 0);

    
    priorityQueue.changePriority(200, 10);

    priorityQueue.changePriority(10, 20);

    
    priorityQueue.add(15, 15);

    
    expect(priorityQueue.poll()).to eq 100
    expect(priorityQueue.poll()).to eq 5
    expect(priorityQueue.poll()).to eq 200
    expect(priorityQueue.poll()).to eq 15
    expect(priorityQueue.poll()).to eq 10
  end

    
  it 'should be possible to search in priority queue by value' do
    priorityQueue = PriorityQueue.new()
    
    priorityQueue.add(10, 1);

    priorityQueue.add(5, 2);

    priorityQueue.add(100, 0);

    priorityQueue.add(200, 0);

    priorityQueue.add(15, 15);

    
    expect(priorityQueue.hasValue(70)).to eq false
    expect(priorityQueue.hasValue(15)).to eq true
  end

end
