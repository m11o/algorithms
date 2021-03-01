    
xdescribe articulationPoints do
  it 'should find articulation points in simple graph' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeCD = GraphEdge.new(vertexC, vertexD)
    
    graph = Graph.new()
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeBC)

    .addEdge(edgeCD);

    
    articulationPointsSet = Object.values(articulationPoints(graph))
    
    expect(articulationPointsSet.length).to eq 2
    expect(articulationPointsSet[0].getKey()).to eq vertexC.getKey()
    expect(articulationPointsSet[1].getKey()).to eq vertexB.getKey()
  end

    
  it 'should find articulation points in simple graph with back edge' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeCD = GraphEdge.new(vertexC, vertexD)
    edgeAC = GraphEdge.new(vertexA, vertexC)
    
    graph = Graph.new()
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeAC)

    .addEdge(edgeBC)

    .addEdge(edgeCD);

    
    articulationPointsSet = Object.values(articulationPoints(graph))
    
    expect(articulationPointsSet.length).to eq 1
    expect(articulationPointsSet[0].getKey()).to eq vertexC.getKey()
  end

    
  it 'should find articulation points in simple graph with back edge #2' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeCD = GraphEdge.new(vertexC, vertexD)
    edgeAE = GraphEdge.new(vertexA, vertexE)
    edgeCE = GraphEdge.new(vertexC, vertexE)
    
    graph = Graph.new()
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeAE)

    .addEdge(edgeCE)

    .addEdge(edgeBC)

    .addEdge(edgeCD);

    
    articulationPointsSet = Object.values(articulationPoints(graph))
    
    expect(articulationPointsSet.length).to eq 1
    expect(articulationPointsSet[0].getKey()).to eq vertexC.getKey()
  end

    
  it 'should find articulation points in graph' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    vertexF = GraphVertex.new('F')
    vertexG = GraphVertex.new('G')
    vertexH = GraphVertex.new('H')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeAC = GraphEdge.new(vertexA, vertexC)
    edgeCD = GraphEdge.new(vertexC, vertexD)
    edgeDE = GraphEdge.new(vertexD, vertexE)
    edgeEG = GraphEdge.new(vertexE, vertexG)
    edgeEF = GraphEdge.new(vertexE, vertexF)
    edgeGF = GraphEdge.new(vertexG, vertexF)
    edgeFH = GraphEdge.new(vertexF, vertexH)
    
    graph = Graph.new()
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeBC)

    .addEdge(edgeAC)

    .addEdge(edgeCD)

    .addEdge(edgeDE)

    .addEdge(edgeEG)

    .addEdge(edgeEF)

    .addEdge(edgeGF)

    .addEdge(edgeFH);

    
    articulationPointsSet = Object.values(articulationPoints(graph))
    
    expect(articulationPointsSet.length).to eq 4
    expect(articulationPointsSet[0].getKey()).to eq vertexF.getKey()
    expect(articulationPointsSet[1].getKey()).to eq vertexE.getKey()
    expect(articulationPointsSet[2].getKey()).to eq vertexD.getKey()
    expect(articulationPointsSet[3].getKey()).to eq vertexC.getKey()
  end

    
  it 'should find articulation points in graph starting with articulation root vertex' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    vertexF = GraphVertex.new('F')
    vertexG = GraphVertex.new('G')
    vertexH = GraphVertex.new('H')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeAC = GraphEdge.new(vertexA, vertexC)
    edgeCD = GraphEdge.new(vertexC, vertexD)
    edgeDE = GraphEdge.new(vertexD, vertexE)
    edgeEG = GraphEdge.new(vertexE, vertexG)
    edgeEF = GraphEdge.new(vertexE, vertexF)
    edgeGF = GraphEdge.new(vertexG, vertexF)
    edgeFH = GraphEdge.new(vertexF, vertexH)
    
    graph = Graph.new()
    
    graph

    .addEdge(edgeDE)

    .addEdge(edgeAB)

    .addEdge(edgeBC)

    .addEdge(edgeAC)

    .addEdge(edgeCD)

    .addEdge(edgeEG)

    .addEdge(edgeEF)

    .addEdge(edgeGF)

    .addEdge(edgeFH);

    
    articulationPointsSet = Object.values(articulationPoints(graph))
    
    expect(articulationPointsSet.length).to eq 4
    expect(articulationPointsSet[0].getKey()).to eq vertexF.getKey()
    expect(articulationPointsSet[1].getKey()).to eq vertexE.getKey()
    expect(articulationPointsSet[2].getKey()).to eq vertexC.getKey()
    expect(articulationPointsSet[3].getKey()).to eq vertexD.getKey()
  end

    
  it 'should find articulation points in yet another graph #1' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeAC = GraphEdge.new(vertexA, vertexC)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeCD = GraphEdge.new(vertexC, vertexD)
    edgeDE = GraphEdge.new(vertexD, vertexE)
    
    graph = Graph.new()
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeAC)

    .addEdge(edgeBC)

    .addEdge(edgeCD)

    .addEdge(edgeDE);

    
    articulationPointsSet = Object.values(articulationPoints(graph))
    
    expect(articulationPointsSet.length).to eq 2
    expect(articulationPointsSet[0].getKey()).to eq vertexD.getKey()
    expect(articulationPointsSet[1].getKey()).to eq vertexC.getKey()
  end

    
  it 'should find articulation points in yet another graph #2' do
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    vertexF = GraphVertex.new('F')
    vertexG = GraphVertex.new('G')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeAC = GraphEdge.new(vertexA, vertexC)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeCD = GraphEdge.new(vertexC, vertexD)
    edgeCE = GraphEdge.new(vertexC, vertexE)
    edgeCF = GraphEdge.new(vertexC, vertexF)
    edgeEG = GraphEdge.new(vertexE, vertexG)
    edgeFG = GraphEdge.new(vertexF, vertexG)
    
    graph = Graph.new()
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeAC)

    .addEdge(edgeBC)

    .addEdge(edgeCD)

    .addEdge(edgeCE)

    .addEdge(edgeCF)

    .addEdge(edgeEG)

    .addEdge(edgeFG);

    
    articulationPointsSet = Object.values(articulationPoints(graph))
    
    expect(articulationPointsSet.length).to eq 1
    expect(articulationPointsSet[0].getKey()).to eq vertexC.getKey()
  end

end
