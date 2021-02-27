    
describe eulerianPath do
  it 'should throw an error when graph is not Eulerian' do
    function findEulerianPathInNotEulerianGraph() {

    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeAC = GraphEdge.new(vertexA, vertexC)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeBD = GraphEdge.new(vertexB, vertexD)
    edgeCE = GraphEdge.new(vertexC, vertexE)
    
    graph = Graph.new()
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeAC)

    .addEdge(edgeBC)

    .addEdge(edgeBD)

    .addEdge(edgeCE);

    
    eulerianPath(graph);

    }

    
    expect(findEulerianPathInNotEulerianGraph).to toThrowError()
  end

    
  it 'should find Eulerian Circuit in graph' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    vertexF = GraphVertex.new('F')
    vertexG = GraphVertex.new('G')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeAE = GraphEdge.new(vertexA, vertexE)
    edgeAF = GraphEdge.new(vertexA, vertexF)
    edgeAG = GraphEdge.new(vertexA, vertexG)
    edgeGF = GraphEdge.new(vertexG, vertexF)
    edgeBE = GraphEdge.new(vertexB, vertexE)
    edgeEB = GraphEdge.new(vertexE, vertexB)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeED = GraphEdge.new(vertexE, vertexD)
    edgeCD = GraphEdge.new(vertexC, vertexD)
    
    graph = Graph.new()
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeAE)

    .addEdge(edgeAF)

    .addEdge(edgeAG)

    .addEdge(edgeGF)

    .addEdge(edgeBE)

    .addEdge(edgeEB)

    .addEdge(edgeBC)

    .addEdge(edgeED)

    .addEdge(edgeCD);

    
    graphEdgesCount = graph.getAllEdges().length
    
    eulerianPathSet = eulerianPath(graph)
    
    expect(eulerianPathSet.length).to be graphEdgesCount + 1
    
    expect(eulerianPathSet[0].getKey()).to be vertexA.getKey()
    expect(eulerianPathSet[1].getKey()).to be vertexB.getKey()
    expect(eulerianPathSet[2].getKey()).to be vertexE.getKey()
    expect(eulerianPathSet[3].getKey()).to be vertexB.getKey()
    expect(eulerianPathSet[4].getKey()).to be vertexC.getKey()
    expect(eulerianPathSet[5].getKey()).to be vertexD.getKey()
    expect(eulerianPathSet[6].getKey()).to be vertexE.getKey()
    expect(eulerianPathSet[7].getKey()).to be vertexA.getKey()
    expect(eulerianPathSet[8].getKey()).to be vertexF.getKey()
    expect(eulerianPathSet[9].getKey()).to be vertexG.getKey()
    expect(eulerianPathSet[10].getKey()).to be vertexA.getKey()
  end

    
  it 'should find Eulerian Path in graph' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    vertexF = GraphVertex.new('F')
    vertexG = GraphVertex.new('G')
    vertexH = GraphVertex.new('H')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeAC = GraphEdge.new(vertexA, vertexC)
    edgeBD = GraphEdge.new(vertexB, vertexD)
    edgeDC = GraphEdge.new(vertexD, vertexC)
    edgeCE = GraphEdge.new(vertexC, vertexE)
    edgeEF = GraphEdge.new(vertexE, vertexF)
    edgeFH = GraphEdge.new(vertexF, vertexH)
    edgeFG = GraphEdge.new(vertexF, vertexG)
    edgeHG = GraphEdge.new(vertexH, vertexG)
    
    graph = Graph.new()
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeAC)

    .addEdge(edgeBD)

    .addEdge(edgeDC)

    .addEdge(edgeCE)

    .addEdge(edgeEF)

    .addEdge(edgeFH)

    .addEdge(edgeFG)

    .addEdge(edgeHG);

    
    graphEdgesCount = graph.getAllEdges().length
    
    eulerianPathSet = eulerianPath(graph)
    
    expect(eulerianPathSet.length).to be graphEdgesCount + 1
    
    expect(eulerianPathSet[0].getKey()).to be vertexC.getKey()
    expect(eulerianPathSet[1].getKey()).to be vertexA.getKey()
    expect(eulerianPathSet[2].getKey()).to be vertexB.getKey()
    expect(eulerianPathSet[3].getKey()).to be vertexD.getKey()
    expect(eulerianPathSet[4].getKey()).to be vertexC.getKey()
    expect(eulerianPathSet[5].getKey()).to be vertexE.getKey()
    expect(eulerianPathSet[6].getKey()).to be vertexF.getKey()
    expect(eulerianPathSet[7].getKey()).to be vertexH.getKey()
    expect(eulerianPathSet[8].getKey()).to be vertexG.getKey()
    expect(eulerianPathSet[9].getKey()).to be vertexF.getKey()
  end

end
