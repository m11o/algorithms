    
xdescribe traversal do
  it 'should traverse linked list' do
    linkedList = LinkedList.new()
    
    linkedList

    .append(1)

    .append(2)

    .append(3);

    
    traversedNodeValues = []
    const traversalCallback = (nodeValue) => {

    traversedNodeValues.push(nodeValue);

    };

    
    traversal(linkedList, traversalCallback);

    
    expect(traversedNodeValues).to eq [1, 2, 3]
  end

end
