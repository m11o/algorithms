describe LinkedListNode do
  it 'should create list node with value' do
    node = LinkedListNode.new 1

    expect(node.value).to eq 1
    expect(node.next).to eq nil
  end

  it 'should create list node with object as a value' do
    node = LinkedListNode.new value: 1, key: 'test'

    expect(node.value.value).to eq 1
    expect(node.value.key).to eq 'test'
    expect(node.next).to eq nil
  end

  it 'should link nodes together' do
    node2 = LinkedListNode.new 2
    node1 = LinkedListNode.new 1, node2

    expect(node2.next).to eq nil
    expect(node2.value).to eq 2
    expect(node1.value).to eq 1
    expect(node1.next.value).to eq 2
  end

  it 'should convert node to string' do
    node = LinkedListNode.new 1

    expect(node.to_s).to eq '1'

    node.value = 'string value'
    expect(node.to_s).to eq 'string value'
  end

  it 'should convert node to string with custom stringifier' do
    node = LinkedListNode.new value: 1, key: 'test'

    expected = node.to_s { |value| "value: #{value.value}, key: #{value.key}" }
    expect(expected).to eq 'value: 1, key: test'
  end
end
