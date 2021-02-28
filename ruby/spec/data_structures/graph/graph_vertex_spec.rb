    
describe GraphVertex do
  it 'should throw an error when trying to create vertex without value' do
    vertex = null
    
    function createEmptyVertex() {

    vertex = new GraphVertex();

    }

    
    expect(vertex).to eq nil
    expect(createEmptyVertex).to toThrow()
  end

    
  it 'should create graph vertex' do
    vertex = GraphVertex.new('A')
    
    expect(vertex.value).to eq 'A'
    expect(vertex.to_s).to eq 'A'
    expect(vertex.getKey()).to eq 'A'
    expect(vertex.edges.to_s).to eq ''
    expect(vertex.getEdges()).to eq []
  end

    
  it 'should add edges to vertex and check if it exists' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    vertexA.addEdge(edgeAB);

    
    expect(vertexA.hasEdge(edgeAB)).to eq true
    expect(vertexB.hasEdge(edgeAB)).to eq false
    expect(vertexA.getEdges().length).to eq 1
    expect(vertexA.getEdges()[0].to_s).to eq 'A_B'
  end

    
  it 'should delete edges from vertex' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeAC = GraphEdge.new(vertexA, vertexC)
    vertexA

    .addEdge(edgeAB)

    .addEdge(edgeAC);

    
    expect(vertexA.hasEdge(edgeAB)).to eq true
    expect(vertexB.hasEdge(edgeAB)).to eq false
    
    expect(vertexA.hasEdge(edgeAC)).to eq true
    expect(vertexC.hasEdge(edgeAC)).to eq false
    
    expect(vertexA.getEdges().length).to eq 2
    
    expect(vertexA.getEdges()[0].to_s).to eq 'A_B'
    expect(vertexA.getEdges()[1].to_s).to eq 'A_C'
    
    vertexA.deleteEdge(edgeAB);

    expect(vertexA.hasEdge(edgeAB)).to eq false
    expect(vertexA.hasEdge(edgeAC)).to eq true
    expect(vertexA.getEdges()[0].to_s).to eq 'A_C'
    
    vertexA.deleteEdge(edgeAC);

    expect(vertexA.hasEdge(edgeAB)).to eq false
    expect(vertexA.hasEdge(edgeAC)).to eq false
    expect(vertexA.getEdges().length).to eq 0
  end

    
  it 'should delete all edges from vertex' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeAC = GraphEdge.new(vertexA, vertexC)
    vertexA

    .addEdge(edgeAB)

    .addEdge(edgeAC);

    
    expect(vertexA.hasEdge(edgeAB)).to eq true
    expect(vertexB.hasEdge(edgeAB)).to eq false
    
    expect(vertexA.hasEdge(edgeAC)).to eq true
    expect(vertexC.hasEdge(edgeAC)).to eq false
    
    expect(vertexA.getEdges().length).to eq 2
    
    vertexA.deleteAllEdges();

    
    expect(vertexA.hasEdge(edgeAB)).to eq false
    expect(vertexB.hasEdge(edgeAB)).to eq false
    
    expect(vertexA.hasEdge(edgeAC)).to eq false
    expect(vertexC.hasEdge(edgeAC)).to eq false
    
    expect(vertexA.getEdges().length).to eq 0
  end

    
  it 'should return vertex neighbors in case if current node is start one' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeAC = GraphEdge.new(vertexA, vertexC)
    vertexA

    .addEdge(edgeAB)

    .addEdge(edgeAC);

    
    expect(vertexB.getNeighbors()).to eq []
    
    neighbors = vertexA.getNeighbors()
    
    expect(neighbors.length).to eq 2
    expect(neighbors[0]).to eq vertexB
    expect(neighbors[1]).to eq vertexC
  end

    
  it 'should return vertex neighbors in case if current node is end one' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    
    edgeBA = GraphEdge.new(vertexB, vertexA)
    edgeCA = GraphEdge.new(vertexC, vertexA)
    vertexA

    .addEdge(edgeBA)

    .addEdge(edgeCA);

    
    expect(vertexB.getNeighbors()).to eq []
    
    neighbors = vertexA.getNeighbors()
    
    expect(neighbors.length).to eq 2
    expect(neighbors[0]).to eq vertexB
    expect(neighbors[1]).to eq vertexC
  end

    
  it 'should check if vertex has specific neighbor' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    vertexA.addEdge(edgeAB);

    
    expect(vertexA.hasNeighbor(vertexB)).to eq true
    expect(vertexA.hasNeighbor(vertexC)).to eq false
  end

    
  it 'should edge by vertex' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    vertexA.addEdge(edgeAB);

    
    expect(vertexA.findEdge(vertexB)).to eq edgeAB
    expect(vertexA.findEdge(vertexC)).to eq nil
  end

    
  it 'should calculate vertex degree' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    
    expect(vertexA.getDegree()).to eq 0
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    vertexA.addEdge(edgeAB);

    
    expect(vertexA.getDegree()).to eq 1
    
    edgeBA = GraphEdge.new(vertexB, vertexA)
    vertexA.addEdge(edgeBA);

    
    expect(vertexA.getDegree()).to eq 2
    
    vertexA.addEdge(edgeAB);

    expect(vertexA.getDegree()).to eq 3
    
    expect(vertexA.getEdges().length).to eq 3
  end

end
