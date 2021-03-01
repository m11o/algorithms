    
describe Queue do
  it 'should create empty queue' do
    queue = Queue.new()
    expect(queue).not.toBeNull();

    expect(queue.linkedList).not.toBeNull();

  end

    
  it 'should enqueue data to queue' do
    queue = Queue.new()
    
    queue.enqueue(1);

    queue.enqueue(2);

    
    expect(queue.to_s).to eq '1,2'
  end

    
  it 'should be possible to enqueue/dequeue objects' do
    queue = Queue.new()
    
 end

 end

    
    stringifier = (value) => `${value.key}:${value.value}`
    
    expect(queue.toString(stringifier)).to eq 'key1:test1,key2:test2'
    expect(queue.dequeue().value).to eq 'test1'
    expect(queue.dequeue().value).to eq 'test2'
  end

    
  it 'should peek data from queue' do
    queue = Queue.new()
    
    expect(queue.peek()).to eq nil
    
    queue.enqueue(1);

    queue.enqueue(2);

    
    expect(queue.peek()).to eq 1
    expect(queue.peek()).to eq 1
  end

    
  it 'should check if queue is empty' do
    queue = Queue.new()
    
    expect(queue.isEmpty()).to eq true
    
    queue.enqueue(1);

    
    expect(queue.isEmpty()).to eq false
  end

    
  it 'should dequeue from queue in FIFO order' do
    queue = Queue.new()
    
    queue.enqueue(1);

    queue.enqueue(2);

    
    expect(queue.dequeue()).to eq 1
    expect(queue.dequeue()).to eq 2
    expect(queue.dequeue()).to eq nil
    expect(queue.isEmpty()).to eq true
  end

end
