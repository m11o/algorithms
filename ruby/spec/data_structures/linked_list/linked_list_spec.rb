describe LinkedList do
  let(:linked_list) { LinkedList.new }

  it 'should create empty linked list' do
    expect(linked_list.to_s).to eq ''
  end

  it 'should append node to linked list' do
    expect(linked_list.head).to eq nil
    expect(linked_list.tail).to eq nil

    linked_list.append 1
    linked_list.append 2

    expect(linked_list.to_s).to eq '1,2'
    expect(linked_list.tail.next).to eq nil
  end

  it 'should prepend node to linked list' do
    linked_list.prepend 2
    expect(linked_list.head.to_s).to eq '2'
    expect(linked_list.tail.to_s).to eq '2'

    linked_list.append(1)
    linked_list.prepend(3)

    expect(linked_list.to_s).to eq '3,2,1'
  end

  it 'should delete node by value from linked list' do
    expect(linked_list.delete(5)).to eq nil

    linked_list.append 1
    linked_list.append 1
    linked_list.append 2
    linked_list.append 3
    linked_list.append 3
    linked_list.append 3
    linked_list.append 4
    linked_list.append 5

    expect(linked_list.head.to_s).to eq '1'
    expect(linked_list.tail.to_s).to eq '5'

    delete_node = linked_list.delete(3)
    expect(delete_node.value).to eq 3
    expect(linked_list.to_s).to eq '1,1,2,4,5'

    linked_list.delete(3)
    expect(linked_list.to_s).to eq '1,1,2,4,5'

    linked_list.delete(1)
    expect(linked_list.to_s).to eq '2,4,5'
    expect(linked_list.head.to_s).to eq '2'
    expect(linked_list.tail.to_s).to eq '5'

    linked_list.delete(5)
    expect(linked_list.to_s).to eq '2,4'
    expect(linked_list.head.to_s).to eq '2'
    expect(linked_list.tail.to_s).to eq '4'

    linked_list.delete(4)
    expect(linked_list.to_s).to eq '2'
    expect(linked_list.head.to_s).to eq '2'
    expect(linked_list.tail.to_s).to eq '2'

    linked_list.delete(2)
    expect(linked_list.to_s).to eq ''
  end

  it 'should delete linked list tail' do
    linked_list.append 1
    linked_list.append 2
    linked_list.append 3

    expect(linked_list.head.to_s).to eq '1'
    expect(linked_list.tail.to_s).to eq '3'

    delete_node1 = linked_list.delete_tail

    expect(delete_node1.value).to eq 3
    expect(linked_list.to_s).to eq '1,2'
    expect(linked_list.head.to_s).to eq '1'
    expect(linked_list.tail.to_s).to eq '2'

    delete_node2 = linked_list.delete_tail

    expect(delete_node2.value).to eq 2
    expect(linked_list.to_s).to eq '1'
    expect(linked_list.head.to_s).to eq '1'
    expect(linked_list.tail.to_s).to eq '1'

    delete_node3 = linked_list.delete_tail

    expect(delete_node3.value).to eq 1
    expect(linked_list.to_s).to eq ''
    expect(linked_list.head.to_s).to eq ''
    expect(linked_list.tail.to_s).to eq ''
  end

  it 'should delete linked list head' do
    expect(linked_list.delete_head).to eq nil

    linked_list.append 1
    linked_list.append 2

    expect(linked_list.head.to_s).to eq '1'
    expect(linked_list.tail.to_s).to eq '2'

    delete_node1 = linked_list.delete_head

    expect(delete_node1.value).to eq 1
    expect(linked_list.to_s).to eq '2'
    expect(linked_list.head.to_s).to eq '2'
    expect(linked_list.tail.to_s).to eq '2'

    delete_node2 = linked_list.delete_head

    expect(delete_node2.value).to eq 2
    expect(linked_list.to_s).to eq ''
    expect(linked_list.head.to_s).to eq ''
    expect(linked_list.tail.to_s).to eq ''
  end

  it 'should be possible to store objects in the list and to print them out' do
    node_value1 = { value: 1, key: 'key1' }
    node_value2 = { value: 2, key: 'key2' }

    linked_list.append(node_value1).prepend(node_value2)

    expected = linked_list.to_s { |value| "#{value[:key]}:#{value[:value]}" }
    expect(expected).to eq 'key2:2,key1:1'
  end

  it 'should find node by value' do
    expect(linked_list.find(5)).to eq nil

    linked_list.append 1
    expect(linked_list.find(1).value).to eq 1

    linked_list.append(2).append(3)

    expect(linked_list.find(2).value).to eq 2
    expect(linked_list.find(5)).to eq nil
  end

  it 'should find node by callback' do
    linked_list.append(value: 1, key: 'test1')
    linked_list.append(value: 2, key: 'test2')
    linked_list.append(value: 3, key: 'test3')

    node = linked_list.find { |value| value[:key] == 'test2' }

    expect(node.value[:value]).to eq 2
    expect(node.value[:key]).to eq 'test2'

    expect(linked_list.find { |value| value[:key] == 'test5' }).to eq nil
  end

  it 'should create linked list from array' do
    linked_list.from_array [1, 1, 2, 3, 3, 3, 4, 5]

    expect(linked_list.to_s).to eq '1,1,2,3,3,3,4,5'
  end

  it 'should convert to array' do
    linked_list.append 1
    linked_list.append 2
    linked_list.append 3

    expect(linked_list.to_a.join(',')).to eq '1,2,3'
  end

  it 'should reverse linked list' do
    linked_list.append 1
    linked_list.append 2
    linked_list.append 3

    expect(linked_list.to_s).to eq '1,2,3'
    expect(linked_list.head.value).to eq 1
    expect(linked_list.tail.value).to eq 3

    linked_list.reverse!

    expect(linked_list.to_s).to eq '3,2,1'
    expect(linked_list.head.value).to eq 3
    expect(linked_list.tail.value).to eq 1

    linked_list.reverse!

    expect(linked_list.to_s).to eq '1,2,3'
    expect(linked_list.head.value).to eq 1
    expect(linked_list.tail.value).to eq 3
  end

  it 'should blank list is true' do
    expect(linked_list.empty?).to eq true

    linked_list.append 1

    expect(linked_list.empty?).to eq false
  end
end
