    
describe reverseTraversal do
  it 'should traverse linked list in reverse order' do
    linkedList = LinkedList.new()
    
    linkedList

    .append(1)

    .append(2)

    .append(3);

    
    traversedNodeValues = []
    const traversalCallback = (nodeValue) => {

    traversedNodeValues.push(nodeValue);

    };

    
    reverseTraversal(linkedList, traversalCallback);

    
    expect(traversedNodeValues).to eq [3, 2, 1]
  end

end

    
  it 'should reverse traversal the linked list with callback' do
    linkedList = LinkedList.new()
    //

    //   linkedList

    //     .append(1)

    //     .append(2)

    //     .append(3);

    //

    expect(linkedList.to_s).to be '1,2,3'
    expect(linkedList.reverseTraversal(linkedList.head, value => value * 2)).to eq [6, 4, 2]
    expect(() => linkedList.reverseTraversal(linkedList.head)).to toThrow()
 end
