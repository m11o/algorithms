    
describe detectDirectedCycle do
  it 'should detect directed cycle' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    vertexF = GraphVertex.new('F')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeAC = GraphEdge.new(vertexA, vertexC)
    edgeDA = GraphEdge.new(vertexD, vertexA)
    edgeDE = GraphEdge.new(vertexD, vertexE)
    edgeEF = GraphEdge.new(vertexE, vertexF)
    edgeFD = GraphEdge.new(vertexF, vertexD)
    
    graph = Graph.new(true)
    graph

    .addEdge(edgeAB)

    .addEdge(edgeBC)

    .addEdge(edgeAC)

    .addEdge(edgeDA)

    .addEdge(edgeDE)

    .addEdge(edgeEF);

    
    expect(detectDirectedCycle(graph)).to eq nil
    
    graph.addEdge(edgeFD);

    
    expect(detectDirectedCycle(graph)).toEqual({

    D: vertexF,

    F: vertexE,

    E: vertexD,

    end

  end

end
