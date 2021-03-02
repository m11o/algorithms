describe Stack do
  let(:stack) { Stack.new }

  it 'should create empty stack' do
    expect(stack).not_to eq nil
    expect(stack.linked_list).not_to eq nil
  end

  it 'should stack data to stack' do
    stack.push(1)
    stack.push(2)

    expect(stack.to_s).to eq '2,1'
  end

  it 'should peek data from stack' do
    expect(stack.peek).to eq nil

    stack.push(1)
    stack.push(2)

    expect(stack.peek).to eq 2
    expect(stack.peek).to eq 2
  end

  it 'should check if stack is empty' do
    expect(stack.empty?).to eq true

    stack.push(1)

    expect(stack.empty?).to eq false
  end

  it 'should pop data from stack' do
    stack.push(1)
    stack.push(2)

    expect(stack.pop).to eq 2
    expect(stack.pop).to eq 1
    expect(stack.pop).to eq nil
    expect(stack.empty?).to eq true
  end

  it 'should be possible to push/pop objects' do
    stack.push({ value: 'test1', key: 'key1' })
    stack.push({ value: 'test2', key: 'key2' })

    expected = stack.to_s { |value| "#{value[:key]}:#{value[:value]}" }
    expect(expected).to eq 'key2:test2,key1:test1'
    expect(stack.pop[:value]).to eq 'test2'
    expect(stack.pop[:value]).to eq 'test1'
  end

  it 'should be possible to convert stack to array' do
    expect(stack.peek).to eq nil

    stack.push(1)
    stack.push(2)
    stack.push(3)

    expect(stack.to_a).to eq [3, 2, 1]
  end
end
