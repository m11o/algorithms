    
describe DoublyLinkedListNode do
  it 'should create list node with value' do
    node = DoublyLinkedListNode.new(1)
    
    expect(node.value).to be 1
    expect(node.next).to eq nil
    expect(node.previous).to eq nil
  end

    
  it 'should create list node with object as a value' do
    nodeValue = { value: 1, key: 'test' }
    node = DoublyLinkedListNode.new(nodeValue)
    
    expect(node.value.value).to be 1
    expect(node.value.key).to be 'test'
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
    expect(node1.value).to be 1
    expect(node1.next.value).to be 2
    expect(node3.next.value).to be 1
    expect(node3.previous.value).to be 2
  end

    
  it 'should convert node to string' do
    node = DoublyLinkedListNode.new(1)
    
    expect(node.to_s).to be '1'
    
    node.value = 'string value';

    expect(node.to_s).to be 'string value'
  end

    
  it 'should convert node to string with custom stringifier' do
    nodeValue = { value: 1, key: 'test' }
    node = DoublyLinkedListNode.new(nodeValue)
    toStringCallback = (value) => `value: ${value.value}, key: ${value.key}`
    
    expect(node.toString(toStringCallback)).to be 'value: 1, key: test'
  end

end
