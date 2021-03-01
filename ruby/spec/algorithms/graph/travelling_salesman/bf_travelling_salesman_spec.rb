    
xdescribe bfTravellingSalesman do
  it 'should solve problem for simple graph' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    
    edgeAB = GraphEdge.new(vertexA, vertexB, 1)
    edgeBD = GraphEdge.new(vertexB, vertexD, 1)
    edgeDC = GraphEdge.new(vertexD, vertexC, 1)
    edgeCA = GraphEdge.new(vertexC, vertexA, 1)
    
    edgeBA = GraphEdge.new(vertexB, vertexA, 5)
    edgeDB = GraphEdge.new(vertexD, vertexB, 8)
    edgeCD = GraphEdge.new(vertexC, vertexD, 7)
    edgeAC = GraphEdge.new(vertexA, vertexC, 4)
    edgeAD = GraphEdge.new(vertexA, vertexD, 2)
    edgeDA = GraphEdge.new(vertexD, vertexA, 3)
    edgeBC = GraphEdge.new(vertexB, vertexC, 3)
    edgeCB = GraphEdge.new(vertexC, vertexB, 9)
    
    graph = Graph.new(true)
    graph

    .addEdge(edgeAB)

    .addEdge(edgeBD)

    .addEdge(edgeDC)

    .addEdge(edgeCA)

    .addEdge(edgeBA)

    .addEdge(edgeDB)

    .addEdge(edgeCD)

    .addEdge(edgeAC)

    .addEdge(edgeAD)

    .addEdge(edgeDA)

    .addEdge(edgeBC)

    .addEdge(edgeCB);

    
    salesmanPath = bfTravellingSalesman(graph)
    
    expect(salesmanPath.length).to eq 4
    
    expect(salesmanPath[0].getKey()).to eq vertexA.getKey()
    expect(salesmanPath[1].getKey()).to eq vertexB.getKey()
    expect(salesmanPath[2].getKey()).to eq vertexD.getKey()
    expect(salesmanPath[3].getKey()).to eq vertexC.getKey()
  end

end
