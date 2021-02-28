    
describe prim do
  it 'should fire an error for directed graph' do
    function applyPrimToDirectedGraph() {

    graph = Graph.new(true)
    
    prim(graph);

    }

    
    expect(applyPrimToDirectedGraph).to toThrowError()
  end

    
  it 'should find minimum spanning tree' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    vertexF = GraphVertex.new('F')
    vertexG = GraphVertex.new('G')
    
    edgeAB = GraphEdge.new(vertexA, vertexB, 2)
    edgeAD = GraphEdge.new(vertexA, vertexD, 3)
    edgeAC = GraphEdge.new(vertexA, vertexC, 3)
    edgeBC = GraphEdge.new(vertexB, vertexC, 4)
    edgeBE = GraphEdge.new(vertexB, vertexE, 3)
    edgeDF = GraphEdge.new(vertexD, vertexF, 7)
    edgeEC = GraphEdge.new(vertexE, vertexC, 1)
    edgeEF = GraphEdge.new(vertexE, vertexF, 8)
    edgeFG = GraphEdge.new(vertexF, vertexG, 9)
    edgeFC = GraphEdge.new(vertexF, vertexC, 6)
    
    graph = Graph.new()
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeAD)

    .addEdge(edgeAC)

    .addEdge(edgeBC)

    .addEdge(edgeBE)

    .addEdge(edgeDF)

    .addEdge(edgeEC)

    .addEdge(edgeEF)

    .addEdge(edgeFC)

    .addEdge(edgeFG);

    
    expect(graph.getWeight()).to eq 46
    
    minimumSpanningTree = prim(graph)
    
    expect(minimumSpanningTree.getWeight()).to eq 24
    expect(minimumSpanningTree.getAllVertices().length).to eq graph.getAllVertices().length
    expect(minimumSpanningTree.getAllEdges().length).to eq graph.getAllVertices().length - 1
    expect(minimumSpanningTree.to_s).to eq 'A,B,C,E,D,F,G'
  end

    
  it 'should find minimum spanning tree for simple graph' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    
    edgeAB = GraphEdge.new(vertexA, vertexB, 1)
    edgeAD = GraphEdge.new(vertexA, vertexD, 3)
    edgeBC = GraphEdge.new(vertexB, vertexC, 1)
    edgeBD = GraphEdge.new(vertexB, vertexD, 3)
    edgeCD = GraphEdge.new(vertexC, vertexD, 1)
    
    graph = Graph.new()
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeAD)

    .addEdge(edgeBC)

    .addEdge(edgeBD)

    .addEdge(edgeCD);

    
    expect(graph.getWeight()).to eq 9
    
    minimumSpanningTree = prim(graph)
    
    expect(minimumSpanningTree.getWeight()).to eq 3
    expect(minimumSpanningTree.getAllVertices().length).to eq graph.getAllVertices().length
    expect(minimumSpanningTree.getAllEdges().length).to eq graph.getAllVertices().length - 1
    expect(minimumSpanningTree.to_s).to eq 'A,B,C,D'
  end

end
