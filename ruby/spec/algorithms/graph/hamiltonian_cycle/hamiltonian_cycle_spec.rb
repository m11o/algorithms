    
describe hamiltonianCycle do
  it 'should find hamiltonian paths in graph' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeAE = GraphEdge.new(vertexA, vertexE)
    edgeAC = GraphEdge.new(vertexA, vertexC)
    edgeBE = GraphEdge.new(vertexB, vertexE)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeBD = GraphEdge.new(vertexB, vertexD)
    edgeCD = GraphEdge.new(vertexC, vertexD)
    edgeDE = GraphEdge.new(vertexD, vertexE)
    
    graph = Graph.new()
    graph

    .addEdge(edgeAB)

    .addEdge(edgeAE)

    .addEdge(edgeAC)

    .addEdge(edgeBE)

    .addEdge(edgeBC)

    .addEdge(edgeBD)

    .addEdge(edgeCD)

    .addEdge(edgeDE);

    
    hamiltonianCycleSet = hamiltonianCycle(graph)
    
    expect(hamiltonianCycleSet.length).to eq 8
    
    expect(hamiltonianCycleSet[0][0].getKey()).to eq vertexA.getKey()
    expect(hamiltonianCycleSet[0][1].getKey()).to eq vertexB.getKey()
    expect(hamiltonianCycleSet[0][2].getKey()).to eq vertexE.getKey()
    expect(hamiltonianCycleSet[0][3].getKey()).to eq vertexD.getKey()
    expect(hamiltonianCycleSet[0][4].getKey()).to eq vertexC.getKey()
    
    expect(hamiltonianCycleSet[1][0].getKey()).to eq vertexA.getKey()
    expect(hamiltonianCycleSet[1][1].getKey()).to eq vertexB.getKey()
    expect(hamiltonianCycleSet[1][2].getKey()).to eq vertexC.getKey()
    expect(hamiltonianCycleSet[1][3].getKey()).to eq vertexD.getKey()
    expect(hamiltonianCycleSet[1][4].getKey()).to eq vertexE.getKey()
    
    expect(hamiltonianCycleSet[2][0].getKey()).to eq vertexA.getKey()
    expect(hamiltonianCycleSet[2][1].getKey()).to eq vertexE.getKey()
    expect(hamiltonianCycleSet[2][2].getKey()).to eq vertexB.getKey()
    expect(hamiltonianCycleSet[2][3].getKey()).to eq vertexD.getKey()
    expect(hamiltonianCycleSet[2][4].getKey()).to eq vertexC.getKey()
    
    expect(hamiltonianCycleSet[3][0].getKey()).to eq vertexA.getKey()
    expect(hamiltonianCycleSet[3][1].getKey()).to eq vertexE.getKey()
    expect(hamiltonianCycleSet[3][2].getKey()).to eq vertexD.getKey()
    expect(hamiltonianCycleSet[3][3].getKey()).to eq vertexB.getKey()
    expect(hamiltonianCycleSet[3][4].getKey()).to eq vertexC.getKey()
  end

    
  it 'should return false for graph without Hamiltonian path' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeAE = GraphEdge.new(vertexA, vertexE)
    edgeBE = GraphEdge.new(vertexB, vertexE)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeBD = GraphEdge.new(vertexB, vertexD)
    edgeCD = GraphEdge.new(vertexC, vertexD)
    
    graph = Graph.new()
    graph

    .addEdge(edgeAB)

    .addEdge(edgeAE)

    .addEdge(edgeBE)

    .addEdge(edgeBC)

    .addEdge(edgeBD)

    .addEdge(edgeCD);

    
    hamiltonianCycleSet = hamiltonianCycle(graph)
    
    expect(hamiltonianCycleSet.length).to eq 0
  end

end
