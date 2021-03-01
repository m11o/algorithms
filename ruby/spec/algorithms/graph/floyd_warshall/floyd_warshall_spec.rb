    
xdescribe floydWarshall do
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
    
    // Add vertices first just to have them in desired order.

    graph

    .addVertex(vertexA)

    .addVertex(vertexB)

    .addVertex(vertexC)

    .addVertex(vertexD)

    .addVertex(vertexE)

    .addVertex(vertexF)

    .addVertex(vertexG)

    .addVertex(vertexH);

    
    // Now, when vertices are in correct order let's add edges.

    graph

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

    
    { distances, nextVertices } = floydWarshall(graph)
    
    vertices = graph.getAllVertices()
    
    vertexAIndex = vertices.indexOf(vertexA)
    vertexBIndex = vertices.indexOf(vertexB)
    vertexCIndex = vertices.indexOf(vertexC)
    vertexDIndex = vertices.indexOf(vertexD)
    vertexEIndex = vertices.indexOf(vertexE)
    vertexFIndex = vertices.indexOf(vertexF)
    vertexGIndex = vertices.indexOf(vertexG)
    vertexHIndex = vertices.indexOf(vertexH)
    
    expect(distances[vertexAIndex][vertexHIndex]).to eq Infinity
    expect(distances[vertexAIndex][vertexAIndex]).to eq 0
    expect(distances[vertexAIndex][vertexBIndex]).to eq 4
    expect(distances[vertexAIndex][vertexEIndex]).to eq 7
    expect(distances[vertexAIndex][vertexCIndex]).to eq 3
    expect(distances[vertexAIndex][vertexDIndex]).to eq 9
    expect(distances[vertexAIndex][vertexGIndex]).to eq 12
    expect(distances[vertexAIndex][vertexFIndex]).to eq 11
    
    expect(nextVertices[vertexAIndex][vertexFIndex]).to eq vertexD
    expect(nextVertices[vertexAIndex][vertexDIndex]).to eq vertexB
    expect(nextVertices[vertexAIndex][vertexBIndex]).to eq vertexA
    expect(nextVertices[vertexAIndex][vertexGIndex]).to eq vertexE
    expect(nextVertices[vertexAIndex][vertexCIndex]).to eq vertexA
    expect(nextVertices[vertexAIndex][vertexAIndex]).to eq null
    expect(nextVertices[vertexAIndex][vertexHIndex]).to eq null
  end

    
  it 'should find minimum paths to all vertices for directed graph' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    
    edgeAB = GraphEdge.new(vertexA, vertexB, 3)
    edgeBA = GraphEdge.new(vertexB, vertexA, 8)
    edgeAD = GraphEdge.new(vertexA, vertexD, 7)
    edgeDA = GraphEdge.new(vertexD, vertexA, 2)
    edgeBC = GraphEdge.new(vertexB, vertexC, 2)
    edgeCA = GraphEdge.new(vertexC, vertexA, 5)
    edgeCD = GraphEdge.new(vertexC, vertexD, 1)
    
    graph = Graph.new(true)
    
    // Add vertices first just to have them in desired order.

    graph

    .addVertex(vertexA)

    .addVertex(vertexB)

    .addVertex(vertexC)

    .addVertex(vertexD);

    
    // Now, when vertices are in correct order let's add edges.

    graph

    .addEdge(edgeAB)

    .addEdge(edgeBA)

    .addEdge(edgeAD)

    .addEdge(edgeDA)

    .addEdge(edgeBC)

    .addEdge(edgeCA)

    .addEdge(edgeCD);

    
    { distances, nextVertices } = floydWarshall(graph)
    
    vertices = graph.getAllVertices()
    
    vertexAIndex = vertices.indexOf(vertexA)
    vertexBIndex = vertices.indexOf(vertexB)
    vertexCIndex = vertices.indexOf(vertexC)
    vertexDIndex = vertices.indexOf(vertexD)
    
    expect(distances[vertexAIndex][vertexAIndex]).to eq 0
    expect(distances[vertexAIndex][vertexBIndex]).to eq 3
    expect(distances[vertexAIndex][vertexCIndex]).to eq 5
    expect(distances[vertexAIndex][vertexDIndex]).to eq 6
    
    expect(distances).toEqual([

    [0, 3, 5, 6],

    [5, 0, 2, 3],

    [3, 6, 0, 1],

    [2, 5, 7, 0],

    ]);

    
    expect(nextVertices[vertexAIndex][vertexDIndex]).to eq vertexC
    expect(nextVertices[vertexAIndex][vertexCIndex]).to eq vertexB
    expect(nextVertices[vertexBIndex][vertexDIndex]).to eq vertexC
    expect(nextVertices[vertexAIndex][vertexAIndex]).to eq null
    expect(nextVertices[vertexAIndex][vertexBIndex]).to eq vertexA
  end

    
  it 'should find minimum paths to all vertices for directed graph with negative edge weights' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    vertexF = GraphVertex.new('F')
    vertexG = GraphVertex.new('G')
    
    edgeFE = GraphEdge.new(vertexF, vertexE, 8)
    edgeFA = GraphEdge.new(vertexF, vertexA, 10)
    edgeED = GraphEdge.new(vertexE, vertexD, 1)
    edgeDA = GraphEdge.new(vertexD, vertexA, -4)
    edgeDC = GraphEdge.new(vertexD, vertexC, -1)
    edgeAC = GraphEdge.new(vertexA, vertexC, 2)
    edgeCB = GraphEdge.new(vertexC, vertexB, -2)
    edgeBA = GraphEdge.new(vertexB, vertexA, 1)
    
    graph = Graph.new(true)
    
    // Add vertices first just to have them in desired order.

    graph

    .addVertex(vertexA)

    .addVertex(vertexB)

    .addVertex(vertexC)

    .addVertex(vertexD)

    .addVertex(vertexE)

    .addVertex(vertexF)

    .addVertex(vertexG);

    
    // Now, when vertices are in correct order let's add edges.

    graph

    .addEdge(edgeFE)

    .addEdge(edgeFA)

    .addEdge(edgeED)

    .addEdge(edgeDA)

    .addEdge(edgeDC)

    .addEdge(edgeAC)

    .addEdge(edgeCB)

    .addEdge(edgeBA);

    
    { distances, nextVertices } = floydWarshall(graph)
    
    vertices = graph.getAllVertices()
    
    vertexAIndex = vertices.indexOf(vertexA)
    vertexBIndex = vertices.indexOf(vertexB)
    vertexCIndex = vertices.indexOf(vertexC)
    vertexDIndex = vertices.indexOf(vertexD)
    vertexEIndex = vertices.indexOf(vertexE)
    vertexGIndex = vertices.indexOf(vertexG)
    vertexFIndex = vertices.indexOf(vertexF)
    
    expect(distances[vertexFIndex][vertexGIndex]).to eq Infinity
    expect(distances[vertexFIndex][vertexFIndex]).to eq 0
    expect(distances[vertexFIndex][vertexAIndex]).to eq 5
    expect(distances[vertexFIndex][vertexBIndex]).to eq 5
    expect(distances[vertexFIndex][vertexCIndex]).to eq 7
    expect(distances[vertexFIndex][vertexDIndex]).to eq 9
    expect(distances[vertexFIndex][vertexEIndex]).to eq 8
    
    expect(nextVertices[vertexFIndex][vertexGIndex]).to eq null
    expect(nextVertices[vertexFIndex][vertexFIndex]).to eq null
    expect(nextVertices[vertexAIndex][vertexBIndex]).to eq vertexC
    expect(nextVertices[vertexAIndex][vertexCIndex]).to eq vertexA
    expect(nextVertices[vertexFIndex][vertexBIndex]).to eq vertexE
    expect(nextVertices[vertexEIndex][vertexBIndex]).to eq vertexD
    expect(nextVertices[vertexDIndex][vertexBIndex]).to eq vertexC
    expect(nextVertices[vertexCIndex][vertexBIndex]).to eq vertexC
  end

end
