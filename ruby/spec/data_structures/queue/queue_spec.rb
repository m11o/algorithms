describe Queue do
  let(:queue) { Queue.new }

  it 'should create empty queue' do
    expect(queue).not_to be eq nil
    expect(queue.linked_list).not_to eq nil
  end


  it 'should enqueue data to queue' do
    queue.enqueue(1)
    queue.enqueue(2)

    expect(queue.to_s).to eq '1,2'
  end


  it 'should be possible to enqueue/dequeue objects' do
    queue.enqueue({ value: 'test1', key: 'key1' })
    queue.enqueue({ value: 'test2', key: 'key2' })

    expected = queue.to_s { |value| "#{value[:key]}:#{value[:value]}" }

    expect(expected).to eq 'key1:test1,key2:test2'
    expect(queue.dequeue[:value]).to eq 'test1'
    expect(queue.dequeue[:value]).to eq 'test2'
  end


  it 'should peek data from queue' do
    expect(queue.peek).to eq nil

    queue.enqueue(1)
    queue.enqueue(2)

    expect(queue.peek).to eq 1
    expect(queue.peek).to eq 1
  end


  it 'should check if queue is empty' do
    expect(queue.empty?).to eq true

    queue.enqueue(1)

    expect(queue.empty?).to eq false
  end


  it 'should dequeue from queue in FIFO order' do
    queue.enqueue(1)
    queue.enqueue(2)

    expect(queue.dequeue).to eq 1
    expect(queue.dequeue).to eq 2
    expect(queue.dequeue).to eq nil
    expect(queue.empty?).to eq true
  end
end
