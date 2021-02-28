    
describe depthFirstSearch do
  it 'should perform DFS operation on tree' do
    nodeA = BinaryTreeNode.new('A')
    nodeB = BinaryTreeNode.new('B')
    nodeC = BinaryTreeNode.new('C')
    nodeD = BinaryTreeNode.new('D')
    nodeE = BinaryTreeNode.new('E')
    nodeF = BinaryTreeNode.new('F')
    nodeG = BinaryTreeNode.new('G')
    
    nodeA.setLeft(nodeB).setRight(nodeC);

    nodeB.setLeft(nodeD).setRight(nodeE);

    nodeC.setLeft(nodeF).setRight(nodeG);

    
    // In-order traversing.

    expect(nodeA.to_s).to eq 'D,B,E,A,F,C,G'
    
    enterNodeCallback = jest.fn()
    leaveNodeCallback = jest.fn()
    
    // Traverse tree without callbacks first to check default ones.

    depthFirstSearch(nodeA);

    
    // Traverse tree with callbacks.

    depthFirstSearch(nodeA, {

    enterNode: enterNodeCallback,

    leaveNode: leaveNodeCallback,

    end

    
    expect(enterNodeCallback).to toHaveBeenCalledTimes(7)
    expect(leaveNodeCallback).to toHaveBeenCalledTimes(7)
    
    // Check node entering.

    expect(enterNodeCallback.mock.calls[0][0].value).to eq 'A'
    expect(enterNodeCallback.mock.calls[1][0].value).to eq 'B'
    expect(enterNodeCallback.mock.calls[2][0].value).to eq 'D'
    expect(enterNodeCallback.mock.calls[3][0].value).to eq 'E'
    expect(enterNodeCallback.mock.calls[4][0].value).to eq 'C'
    expect(enterNodeCallback.mock.calls[5][0].value).to eq 'F'
    expect(enterNodeCallback.mock.calls[6][0].value).to eq 'G'
    
    // Check node leaving.

    expect(leaveNodeCallback.mock.calls[0][0].value).to eq 'D'
    expect(leaveNodeCallback.mock.calls[1][0].value).to eq 'E'
    expect(leaveNodeCallback.mock.calls[2][0].value).to eq 'B'
    expect(leaveNodeCallback.mock.calls[3][0].value).to eq 'F'
    expect(leaveNodeCallback.mock.calls[4][0].value).to eq 'G'
    expect(leaveNodeCallback.mock.calls[5][0].value).to eq 'C'
    expect(leaveNodeCallback.mock.calls[6][0].value).to eq 'A'
  end

    
  it 'allow users to redefine node visiting logic' do
    nodeA = BinaryTreeNode.new('A')
    nodeB = BinaryTreeNode.new('B')
    nodeC = BinaryTreeNode.new('C')
    nodeD = BinaryTreeNode.new('D')
    nodeE = BinaryTreeNode.new('E')
    nodeF = BinaryTreeNode.new('F')
    nodeG = BinaryTreeNode.new('G')
    
    nodeA.setLeft(nodeB).setRight(nodeC);

    nodeB.setLeft(nodeD).setRight(nodeE);

    nodeC.setLeft(nodeF).setRight(nodeG);

    
    // In-order traversing.

    expect(nodeA.to_s).to eq 'D,B,E,A,F,C,G'
    
    enterNodeCallback = jest.fn()
    leaveNodeCallback = jest.fn()
    
    // Traverse tree without callbacks first to check default ones.

    depthFirstSearch(nodeA);

    
    // Traverse tree with callbacks.

    depthFirstSearch(nodeA, {

    allowTraversal: (node, child) => {

    // Forbid traversing left part of the tree.

    child.value ! == 'B'
    },

    enterNode: enterNodeCallback,

    leaveNode: leaveNodeCallback,

    end

    
    expect(enterNodeCallback).to toHaveBeenCalledTimes(4)
    expect(leaveNodeCallback).to toHaveBeenCalledTimes(4)
    
    // Check node entering.

    expect(enterNodeCallback.mock.calls[0][0].value).to eq 'A'
    expect(enterNodeCallback.mock.calls[1][0].value).to eq 'C'
    expect(enterNodeCallback.mock.calls[2][0].value).to eq 'F'
    expect(enterNodeCallback.mock.calls[3][0].value).to eq 'G'
    
    // Check node leaving.

    expect(leaveNodeCallback.mock.calls[0][0].value).to eq 'F'
    expect(leaveNodeCallback.mock.calls[1][0].value).to eq 'G'
    expect(leaveNodeCallback.mock.calls[2][0].value).to eq 'C'
    expect(leaveNodeCallback.mock.calls[3][0].value).to eq 'A'
  end

end
