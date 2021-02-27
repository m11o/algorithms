    
describe topologicalSort do
  it 'should do topological sorting on graph' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    vertexF = GraphVertex.new('F')
    vertexG = GraphVertex.new('G')
    vertexH = GraphVertex.new('H')
    
    edgeAC = GraphEdge.new(vertexA, vertexC)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeBD = GraphEdge.new(vertexB, vertexD)
    edgeCE = GraphEdge.new(vertexC, vertexE)
    edgeDF = GraphEdge.new(vertexD, vertexF)
    edgeEF = GraphEdge.new(vertexE, vertexF)
    edgeEH = GraphEdge.new(vertexE, vertexH)
    edgeFG = GraphEdge.new(vertexF, vertexG)
    
    graph = Graph.new(true)
    
    graph

    .addEdge(edgeAC)

    .addEdge(edgeBC)

    .addEdge(edgeBD)

    .addEdge(edgeCE)

    .addEdge(edgeDF)

    .addEdge(edgeEF)

    .addEdge(edgeEH)

    .addEdge(edgeFG);

    
    sortedVertices = topologicalSort(graph)
    
    expect(sortedVertices.length).to be graph.getAllVertices().length
    expect(sortedVertices).toEqual([

    vertexB,

    vertexD,

    vertexA,

    vertexC,

    vertexE,

    vertexH,

    vertexF,

    vertexG,

    ]);

  end

end
