describe DoublyLinkedListNode do
  it 'should create list node with value' do
    node = DoublyLinkedListNode.new(1)

    expect(node.value).to eq 1
    expect(node.next).to eq nil
    expect(node.previous).to eq nil
  end

  it 'should create list node with object as a value' do
    node_value = { value: 1, key: 'test' }
    node = DoublyLinkedListNode.new(node_value)

    expect(node.value[:value]).to eq 1
    expect(node.value[:key]).to eq 'test'
    expect(node.next).to eq nil
    expect(node.previous).to eq nil
  end

  it 'should link nodes together' do
    node2 = DoublyLinkedListNode.new(2)
    node1 = DoublyLinkedListNode.new(1, node2)
    node3 = DoublyLinkedListNode.new(10, node1, node2)

    expect(node1.previous).to eq nil
    expect(node2.next).to eq nil
    expect(node2.previous).to eq nil
    expect(node1.value).to eq 1
    expect(node1.next.value).to eq 2
    expect(node3.next.value).to eq 1
    expect(node3.previous.value).to eq 2
  end

  it 'should convert node to string' do
    node = DoublyLinkedListNode.new(1)

    expect(node.to_s).to eq '1'

    node.value = 'string value'

    expect(node.to_s).to eq 'string value'
  end

  it 'should convert node to string with custom stringifier' do
    node_value = { value: 1, key: 'test' }
    node = DoublyLinkedListNode.new(node_value)

    expected = node.to_s { |value| "value: #{value[:value]}, key: #{value[:key]}" }
    expect(expected).to eq 'value: 1, key: test'
  end
end
