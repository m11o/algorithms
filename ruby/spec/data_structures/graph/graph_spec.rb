    
describe Graph do
  it 'should add vertices to graph' do
    graph = Graph.new()
    
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    
    graph

    .addVertex(vertexA)

    .addVertex(vertexB);

    
    expect(graph.to_s).to be 'A,B'
    expect(graph.getVertexByKey(vertexA.getKey())).to eq vertexA
    expect(graph.getVertexByKey(vertexB.getKey())).to eq vertexB
  end

    
  it 'should add edges to undirected graph' do
    graph = Graph.new()
    
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    
    graph.addEdge(edgeAB);

    
    expect(graph.getAllVertices().length).to be 2
    expect(graph.getAllVertices()[0]).to eq vertexA
    expect(graph.getAllVertices()[1]).to eq vertexB
    
    graphVertexA = graph.getVertexByKey(vertexA.getKey())
    graphVertexB = graph.getVertexByKey(vertexB.getKey())
    
    expect(graph.to_s).to be 'A,B'
    
    expect(graph.getVertexByKey('not existing')).to eq nil
    
    expect(graphVertexA.getNeighbors().length).to be 1
    expect(graphVertexA.getNeighbors()[0]).to eq vertexB
    expect(graphVertexA.getNeighbors()[0]).to eq graphVertexB
    
    expect(graphVertexB.getNeighbors().length).to be 1
    expect(graphVertexB.getNeighbors()[0]).to eq vertexA
    expect(graphVertexB.getNeighbors()[0]).to eq graphVertexA
  end

    
  it 'should add edges to directed graph' do
    graph = Graph.new(true)
    
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    
    graph.addEdge(edgeAB);

    
    graphVertexA = graph.getVertexByKey(vertexA.getKey())
    graphVertexB = graph.getVertexByKey(vertexB.getKey())
    
    expect(graph.to_s).to be 'A,B'
    
    expect(graphVertexA.getNeighbors().length).to be 1
    expect(graphVertexA.getNeighbors()[0]).to eq vertexB
    expect(graphVertexA.getNeighbors()[0]).to eq graphVertexB
    
    expect(graphVertexB.getNeighbors().length).to be 0
  end

    
  it 'should find edge by vertices in undirected graph' do
    graph = Graph.new()
    
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    
    edgeAB = GraphEdge.new(vertexA, vertexB, 10)
    
    graph.addEdge(edgeAB);

    
    graphEdgeAB = graph.findEdge(vertexA, vertexB)
    graphEdgeBA = graph.findEdge(vertexB, vertexA)
    graphEdgeAC = graph.findEdge(vertexA, vertexC)
    graphEdgeCA = graph.findEdge(vertexC, vertexA)
    
    expect(graphEdgeAC).to eq nil
    expect(graphEdgeCA).to eq nil
    expect(graphEdgeAB).to eq edgeAB
    expect(graphEdgeBA).to eq edgeAB
    expect(graphEdgeAB.weight).to be 10
  end

    
  it 'should find edge by vertices in directed graph' do
    graph = Graph.new(true)
    
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    
    edgeAB = GraphEdge.new(vertexA, vertexB, 10)
    
    graph.addEdge(edgeAB);

    
    graphEdgeAB = graph.findEdge(vertexA, vertexB)
    graphEdgeBA = graph.findEdge(vertexB, vertexA)
    graphEdgeAC = graph.findEdge(vertexA, vertexC)
    graphEdgeCA = graph.findEdge(vertexC, vertexA)
    
    expect(graphEdgeAC).to eq nil
    expect(graphEdgeCA).to eq nil
    expect(graphEdgeBA).to eq nil
    expect(graphEdgeAB).to eq edgeAB
    expect(graphEdgeAB.weight).to be 10
  end

    
  it 'should return vertex neighbors' do
    graph = Graph.new(true)
    
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeAC = GraphEdge.new(vertexA, vertexC)
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeAC);

    
    neighbors = graph.getNeighbors(vertexA)
    
    expect(neighbors.length).to be 2
    expect(neighbors[0]).to eq vertexB
    expect(neighbors[1]).to eq vertexC
  end

    
  it 'should throw an error when trying to add edge twice' do
    function addSameEdgeTwice() {

    graph = Graph.new(true)
    
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeAB);

    }

    
    expect(addSameEdgeTwice).to toThrow()
  end

    
  it 'should return the list of all added edges' do
    graph = Graph.new(true)
    
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeBC);

    
    edges = graph.getAllEdges()
    
    expect(edges.length).to be 2
    expect(edges[0]).to eq edgeAB
    expect(edges[1]).to eq edgeBC
  end

    
  it 'should calculate total graph weight for default graph' do
    graph = Graph.new()
    
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeCD = GraphEdge.new(vertexC, vertexD)
    edgeAD = GraphEdge.new(vertexA, vertexD)
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeBC)

    .addEdge(edgeCD)

    .addEdge(edgeAD);

    
    expect(graph.getWeight()).to be 0
  end

    
  it 'should calculate total graph weight for weighted graph' do
    graph = Graph.new()
    
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    
    edgeAB = GraphEdge.new(vertexA, vertexB, 1)
    edgeBC = GraphEdge.new(vertexB, vertexC, 2)
    edgeCD = GraphEdge.new(vertexC, vertexD, 3)
    edgeAD = GraphEdge.new(vertexA, vertexD, 4)
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeBC)

    .addEdge(edgeCD)

    .addEdge(edgeAD);

    
    expect(graph.getWeight()).to be 10
  end

    
  it 'should be possible to delete edges from graph' do
    graph = Graph.new()
    
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeAC = GraphEdge.new(vertexA, vertexC)
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeBC)

    .addEdge(edgeAC);

    
    expect(graph.getAllEdges().length).to be 3
    
    graph.deleteEdge(edgeAB);

    
    expect(graph.getAllEdges().length).to be 2
    expect(graph.getAllEdges()[0].getKey()).to be edgeBC.getKey()
    expect(graph.getAllEdges()[1].getKey()).to be edgeAC.getKey()
  end

    
  it 'should should throw an error when trying to delete not existing edge' do
    function deleteNotExistingEdge() {

    graph = Graph.new()
    
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    
    graph.addEdge(edgeAB);

    graph.deleteEdge(edgeBC);

    }

    
    expect(deleteNotExistingEdge).to toThrowError()
  end

    
  it 'should be possible to reverse graph' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeAC = GraphEdge.new(vertexA, vertexC)
    edgeCD = GraphEdge.new(vertexC, vertexD)
    
    graph = Graph.new(true)
    graph

    .addEdge(edgeAB)

    .addEdge(edgeAC)

    .addEdge(edgeCD);

    
    expect(graph.to_s).to be 'A,B,C,D'
    expect(graph.getAllEdges().length).to be 3
    expect(graph.getNeighbors(vertexA).length).to be 2
    expect(graph.getNeighbors(vertexA)[0].getKey()).to be vertexB.getKey()
    expect(graph.getNeighbors(vertexA)[1].getKey()).to be vertexC.getKey()
    expect(graph.getNeighbors(vertexB).length).to be 0
    expect(graph.getNeighbors(vertexC).length).to be 1
    expect(graph.getNeighbors(vertexC)[0].getKey()).to be vertexD.getKey()
    expect(graph.getNeighbors(vertexD).length).to be 0
    
    graph.reverse();

    
    expect(graph.to_s).to be 'A,B,C,D'
    expect(graph.getAllEdges().length).to be 3
    expect(graph.getNeighbors(vertexA).length).to be 0
    expect(graph.getNeighbors(vertexB).length).to be 1
    expect(graph.getNeighbors(vertexB)[0].getKey()).to be vertexA.getKey()
    expect(graph.getNeighbors(vertexC).length).to be 1
    expect(graph.getNeighbors(vertexC)[0].getKey()).to be vertexA.getKey()
    expect(graph.getNeighbors(vertexD).length).to be 1
    expect(graph.getNeighbors(vertexD)[0].getKey()).to be vertexC.getKey()
  end

    
  it 'should return vertices indices' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeCD = GraphEdge.new(vertexC, vertexD)
    edgeBD = GraphEdge.new(vertexB, vertexD)
    
    graph = Graph.new()
    graph

    .addEdge(edgeAB)

    .addEdge(edgeBC)

    .addEdge(edgeCD)

    .addEdge(edgeBD);

    
    verticesIndices = graph.getVerticesIndices()
    expect(verticesIndices).toEqual({

    A: 0,

    B: 1,

    C: 2,

    D: 3,

    end

  end

    
  it 'should generate adjacency matrix for undirected graph' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeCD = GraphEdge.new(vertexC, vertexD)
    edgeBD = GraphEdge.new(vertexB, vertexD)
    
    graph = Graph.new()
    graph

    .addEdge(edgeAB)

    .addEdge(edgeBC)

    .addEdge(edgeCD)

    .addEdge(edgeBD);

    
    adjacencyMatrix = graph.getAdjacencyMatrix()
    expect(adjacencyMatrix).toEqual([

    [Infinity, 0, Infinity, Infinity],

    [0, Infinity, 0, 0],

    [Infinity, 0, Infinity, 0],

    [Infinity, 0, 0, Infinity],

    ]);

  end

    
  it 'should generate adjacency matrix for directed graph' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    
    edgeAB = GraphEdge.new(vertexA, vertexB, 2)
    edgeBC = GraphEdge.new(vertexB, vertexC, 1)
    edgeCD = GraphEdge.new(vertexC, vertexD, 5)
    edgeBD = GraphEdge.new(vertexB, vertexD, 7)
    
    graph = Graph.new(true)
    graph

    .addEdge(edgeAB)

    .addEdge(edgeBC)

    .addEdge(edgeCD)

    .addEdge(edgeBD);

    
    adjacencyMatrix = graph.getAdjacencyMatrix()
    expect(adjacencyMatrix).toEqual([

    [Infinity, 2, Infinity, Infinity],

    [Infinity, Infinity, 1, 7],

    [Infinity, Infinity, Infinity, 5],

    [Infinity, Infinity, Infinity, Infinity],

    ]);

  end

end
