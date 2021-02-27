    
describe bellmanFord do
  it 'should find minimum paths to all vertices for undirected graph' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    vertexF = GraphVertex.new('F')
    vertexG = GraphVertex.new('G')
    vertexH = GraphVertex.new('H')
    
    edgeAB = GraphEdge.new(vertexA, vertexB, 4)
    edgeAE = GraphEdge.new(vertexA, vertexE, 7)
    edgeAC = GraphEdge.new(vertexA, vertexC, 3)
    edgeBC = GraphEdge.new(vertexB, vertexC, 6)
    edgeBD = GraphEdge.new(vertexB, vertexD, 5)
    edgeEC = GraphEdge.new(vertexE, vertexC, 8)
    edgeED = GraphEdge.new(vertexE, vertexD, 2)
    edgeDC = GraphEdge.new(vertexD, vertexC, 11)
    edgeDG = GraphEdge.new(vertexD, vertexG, 10)
    edgeDF = GraphEdge.new(vertexD, vertexF, 2)
    edgeFG = GraphEdge.new(vertexF, vertexG, 3)
    edgeEG = GraphEdge.new(vertexE, vertexG, 5)
    
    graph = Graph.new()
    graph

    .addVertex(vertexH)

    .addEdge(edgeAB)

    .addEdge(edgeAE)

    .addEdge(edgeAC)

    .addEdge(edgeBC)

    .addEdge(edgeBD)

    .addEdge(edgeEC)

    .addEdge(edgeED)

    .addEdge(edgeDC)

    .addEdge(edgeDG)

    .addEdge(edgeDF)

    .addEdge(edgeFG)

    .addEdge(edgeEG);

    
    { distances, previousVertices } = bellmanFord(graph, vertexA)
    
    expect(distances).toEqual({

    H: Infinity,

    A: 0,

    B: 4,

    E: 7,

    C: 3,

    D: 9,

    G: 12,

    F: 11,

    end

    
    expect(previousVertices.F.getKey()).to be 'D'
    expect(previousVertices.D.getKey()).to be 'B'
    expect(previousVertices.B.getKey()).to be 'A'
    expect(previousVertices.G.getKey()).to be 'E'
    expect(previousVertices.C.getKey()).to be 'A'
    expect(previousVertices.A).to eq nil
    expect(previousVertices.H).to eq nil
  end

    
  it 'should find minimum paths to all vertices for directed graph with negative edge weights' do
    vertexS = GraphVertex.new('S')
    vertexE = GraphVertex.new('E')
    vertexA = GraphVertex.new('A')
    vertexD = GraphVertex.new('D')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexH = GraphVertex.new('H')
    
    edgeSE = GraphEdge.new(vertexS, vertexE, 8)
    edgeSA = GraphEdge.new(vertexS, vertexA, 10)
    edgeED = GraphEdge.new(vertexE, vertexD, 1)
    edgeDA = GraphEdge.new(vertexD, vertexA, -4)
    edgeDC = GraphEdge.new(vertexD, vertexC, -1)
    edgeAC = GraphEdge.new(vertexA, vertexC, 2)
    edgeCB = GraphEdge.new(vertexC, vertexB, -2)
    edgeBA = GraphEdge.new(vertexB, vertexA, 1)
    
    graph = Graph.new(true)
    graph

    .addVertex(vertexH)

    .addEdge(edgeSE)

    .addEdge(edgeSA)

    .addEdge(edgeED)

    .addEdge(edgeDA)

    .addEdge(edgeDC)

    .addEdge(edgeAC)

    .addEdge(edgeCB)

    .addEdge(edgeBA);

    
    { distances, previousVertices } = bellmanFord(graph, vertexS)
    
    expect(distances).toEqual({

    H: Infinity,

    S: 0,

    A: 5,

    B: 5,

    C: 7,

    D: 9,

    E: 8,

    end

    
    expect(previousVertices.H).to eq nil
    expect(previousVertices.S).to eq nil
    expect(previousVertices.B.getKey()).to be 'C'
    expect(previousVertices.C.getKey()).to be 'A'
    expect(previousVertices.A.getKey()).to be 'D'
    expect(previousVertices.D.getKey()).to be 'E'
  end

end
