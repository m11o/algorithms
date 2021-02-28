    
describe DoublyLinkedList do
  it 'should create empty linked list' do
    linkedList = DoublyLinkedList.new()
    expect(linkedList.to_s).to eq ''
  end

    
  it 'should append node to linked list' do
    linkedList = DoublyLinkedList.new()
    
    expect(linkedList.head).to eq nil
    expect(linkedList.tail).to eq nil
    
    linkedList.append(1);

    linkedList.append(2);

    
    expect(linkedList.head.next.value).to eq 2
    expect(linkedList.tail.previous.value).to eq 1
    expect(linkedList.to_s).to eq '1,2'
  end

    
  it 'should prepend node to linked list' do
    linkedList = DoublyLinkedList.new()
    
    linkedList.prepend(2);

    expect(linkedList.head.to_s).to eq '2'
    expect(linkedList.tail.to_s).to eq '2'
    
    linkedList.append(1);

    linkedList.prepend(3);

    
    expect(linkedList.head.next.next.previous).to eq linkedList.head.next
    expect(linkedList.tail.previous.next).to eq linkedList.tail
    expect(linkedList.tail.previous.value).to eq 2
    expect(linkedList.to_s).to eq '3,2,1'
  end

    
  it 'should create linked list from array' do
    linkedList = DoublyLinkedList.new()
    linkedList.fromArray([1, 1, 2, 3, 3, 3, 4, 5]);

    
    expect(linkedList.to_s).to eq '1,1,2,3,3,3,4,5'
  end

    
  it 'should delete node by value from linked list' do
    linkedList = DoublyLinkedList.new()
    
    expect(linkedList.delete(5)).to eq nil
    
    linkedList.append(1);

    linkedList.append(1);

    linkedList.append(2);

    linkedList.append(3);

    linkedList.append(3);

    linkedList.append(3);

    linkedList.append(4);

    linkedList.append(5);

    
    expect(linkedList.head.to_s).to eq '1'
    expect(linkedList.tail.to_s).to eq '5'
    
    deletedNode = linkedList.delete(3)
    expect(deletedNode.value).to eq 3
    expect(linkedList.tail.previous.previous.value).to eq 2
    expect(linkedList.to_s).to eq '1,1,2,4,5'
    
    linkedList.delete(3);

    expect(linkedList.to_s).to eq '1,1,2,4,5'
    
    linkedList.delete(1);

    expect(linkedList.to_s).to eq '2,4,5'
    
    expect(linkedList.head.to_s).to eq '2'
    expect(linkedList.head.next.next).to eq linkedList.tail
    expect(linkedList.tail.previous.previous).to eq linkedList.head
    expect(linkedList.tail.to_s).to eq '5'
    
    linkedList.delete(5);

    expect(linkedList.to_s).to eq '2,4'
    
    expect(linkedList.head.to_s).to eq '2'
    expect(linkedList.tail.to_s).to eq '4'
    
    linkedList.delete(4);

    expect(linkedList.to_s).to eq '2'
    
    expect(linkedList.head.to_s).to eq '2'
    expect(linkedList.tail.to_s).to eq '2'
    expect(linkedList.head).to eq linkedList.tail
    
    linkedList.delete(2);

    expect(linkedList.to_s).to eq ''
  end

    
  it 'should delete linked list tail' do
    linkedList = DoublyLinkedList.new()
    
    expect(linkedList.deleteTail()).to eq nil
    
    linkedList.append(1);

    linkedList.append(2);

    linkedList.append(3);

    
    expect(linkedList.head.to_s).to eq '1'
    expect(linkedList.tail.to_s).to eq '3'
    
    deletedNode1 = linkedList.deleteTail()
    
    expect(deletedNode1.value).to eq 3
    expect(linkedList.to_s).to eq '1,2'
    expect(linkedList.head.to_s).to eq '1'
    expect(linkedList.tail.to_s).to eq '2'
    
    deletedNode2 = linkedList.deleteTail()
    
    expect(deletedNode2.value).to eq 2
    expect(linkedList.to_s).to eq '1'
    expect(linkedList.head.to_s).to eq '1'
    expect(linkedList.tail.to_s).to eq '1'
    
    deletedNode3 = linkedList.deleteTail()
    
    expect(deletedNode3.value).to eq 1
    expect(linkedList.to_s).to eq ''
    expect(linkedList.head).to eq nil
    expect(linkedList.tail).to eq nil
  end

    
  it 'should delete linked list head' do
    linkedList = DoublyLinkedList.new()
    
    expect(linkedList.deleteHead()).to eq nil
    
    linkedList.append(1);

    linkedList.append(2);

    
    expect(linkedList.head.to_s).to eq '1'
    expect(linkedList.tail.to_s).to eq '2'
    
    deletedNode1 = linkedList.deleteHead()
    
    expect(deletedNode1.value).to eq 1
    expect(linkedList.head.previous).to eq nil
    expect(linkedList.to_s).to eq '2'
    expect(linkedList.head.to_s).to eq '2'
    expect(linkedList.tail.to_s).to eq '2'
    
    deletedNode2 = linkedList.deleteHead()
    
    expect(deletedNode2.value).to eq 2
    expect(linkedList.to_s).to eq ''
    expect(linkedList.head).to eq nil
    expect(linkedList.tail).to eq nil
  end

    
  it 'should be possible to store objects in the list and to print them out' do
    linkedList = DoublyLinkedList.new()
    
    nodeValue1 = { value: 1, key: 'key1' }
    nodeValue2 = { value: 2, key: 'key2' }
    
    linkedList

    .append(nodeValue1)

    .prepend(nodeValue2);

    
    nodeStringifier = (value) => `${value.key}:${value.value}`
    
    expect(linkedList.toString(nodeStringifier)).to eq 'key2:2,key1:1'
  end

    
  it 'should find node by value' do
    linkedList = DoublyLinkedList.new()
    
    expect(linkedList.find({ value: 5 })).to eq nil
    
    linkedList.append(1);

    
    linkedList

    .append(2)

    .append(3);

    
 end

    node = linkedList.find({ value: 2 })
    
    expect(node.value).to eq 2
    expect(linkedList.find({ value: 5 })).to eq nil
  end

    
  it 'should find node by callback' do
    linkedList = DoublyLinkedList.new()
    
    linkedList

    .append({ value: 1, key: 'test1' })

    .append({ value: 2, key: 'test2' })

 end

    
 end

    node = linkedList.find({ callback: (value) => value.key === 'test2' })
    
    expect(node.value.value).to eq 2
    expect(node.value.key).to eq 'test2'
    expect(linkedList.find({ callback: (value) => value.key === 'test5' })).to eq nil
  end

    
  it 'should find node by means of custom compare function' do
    const comparatorFunction = (a, b) => {

    if (a.customValue === b.customValue) {

    return 0;

    }

    
    return a.customValue < b.customValue ? -1 : 1;

    };

    
    linkedList = DoublyLinkedList.new(comparatorFunction)
    
    linkedList

    .append({ value: 1, customValue: 'test1' })

    .append({ value: 2, customValue: 'test2' })

 end

    
    const node = linkedList.find({

    value: { value: 2, customValue: 'test2' },

    end

    
    expect(node.value.value).to eq 2
    expect(node.value.customValue).to eq 'test2'
    expect(linkedList.find({ value: 2, customValue: 'test5' })).to eq nil
  end

    
  it 'should reverse linked list' do
    linkedList = DoublyLinkedList.new()
    
    // Add test values to linked list.

    linkedList

    .append(1)

    .append(2)

    .append(3)

    .append(4);

    
    expect(linkedList.to_s).to eq '1,2,3,4'
    expect(linkedList.head.value).to eq 1
    expect(linkedList.tail.value).to eq 4
    
    // Reverse linked list.

    linkedList.reverse();

    
    expect(linkedList.to_s).to eq '4,3,2,1'
    
    expect(linkedList.head.previous).to eq nil
    expect(linkedList.head.value).to eq 4
    expect(linkedList.head.next.value).to eq 3
    expect(linkedList.head.next.next.value).to eq 2
    expect(linkedList.head.next.next.next.value).to eq 1
    
    expect(linkedList.tail.next).to eq nil
    expect(linkedList.tail.value).to eq 1
    expect(linkedList.tail.previous.value).to eq 2
    expect(linkedList.tail.previous.previous.value).to eq 3
    expect(linkedList.tail.previous.previous.previous.value).to eq 4
    
    // Reverse linked list back to initial state.

    linkedList.reverse();

    
    expect(linkedList.to_s).to eq '1,2,3,4'
    
    expect(linkedList.head.previous).to eq nil
    expect(linkedList.head.value).to eq 1
    expect(linkedList.head.next.value).to eq 2
    expect(linkedList.head.next.next.value).to eq 3
    expect(linkedList.head.next.next.next.value).to eq 4
    
    expect(linkedList.tail.next).to eq nil
    expect(linkedList.tail.value).to eq 4
    expect(linkedList.tail.previous.value).to eq 3
    expect(linkedList.tail.previous.previous.value).to eq 2
    expect(linkedList.tail.previous.previous.previous.value).to eq 1
  end

end
