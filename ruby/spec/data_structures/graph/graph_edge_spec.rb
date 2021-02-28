    
describe GraphEdge do
  it 'should create graph edge with default weight' do
    startVertex = GraphVertex.new('A')
    endVertex = GraphVertex.new('B')
    edge = GraphEdge.new(startVertex, endVertex)
    
    expect(edge.getKey()).to eq 'A_B'
    expect(edge.to_s).to eq 'A_B'
    expect(edge.startVertex).to eq startVertex
    expect(edge.endVertex).to eq endVertex
    expect(edge.weight).to eq 0
  end

    
  it 'should create graph edge with predefined weight' do
    startVertex = GraphVertex.new('A')
    endVertex = GraphVertex.new('B')
    edge = GraphEdge.new(startVertex, endVertex, 10)
    
    expect(edge.startVertex).to eq startVertex
    expect(edge.endVertex).to eq endVertex
    expect(edge.weight).to eq 10
  end

    
  it 'should be possible to do edge reverse' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    edge = GraphEdge.new(vertexA, vertexB, 10)
    
    expect(edge.startVertex).to eq vertexA
    expect(edge.endVertex).to eq vertexB
    expect(edge.weight).to eq 10
    
    edge.reverse();

    
    expect(edge.startVertex).to eq vertexB
    expect(edge.endVertex).to eq vertexA
    expect(edge.weight).to eq 10
  end

end
