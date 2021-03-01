    
xdescribe detectUndirectedCycleUsingDisjointSet do
  it 'should detect undirected cycle' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    vertexF = GraphVertex.new('F')
    
    edgeAF = GraphEdge.new(vertexA, vertexF)
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeBE = GraphEdge.new(vertexB, vertexE)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeCD = GraphEdge.new(vertexC, vertexD)
    edgeDE = GraphEdge.new(vertexD, vertexE)
    
    graph = Graph.new()
    graph

    .addEdge(edgeAF)

    .addEdge(edgeAB)

    .addEdge(edgeBE)

    .addEdge(edgeBC)

    .addEdge(edgeCD);

    
    expect(detectUndirectedCycleUsingDisjointSet(graph)).to eq false
    
    graph.addEdge(edgeDE);

    
    expect(detectUndirectedCycleUsingDisjointSet(graph)).to eq true
  end

end
