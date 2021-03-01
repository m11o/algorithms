    
xdescribe breadthFirstSearch do
  it 'should perform BFS operation on graph' do
    graph = Graph.new(true)
    
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
    edgeCG = GraphEdge.new(vertexC, vertexG)
    edgeAD = GraphEdge.new(vertexA, vertexD)
    edgeAE = GraphEdge.new(vertexA, vertexE)
    edgeEF = GraphEdge.new(vertexE, vertexF)
    edgeFD = GraphEdge.new(vertexF, vertexD)
    edgeDH = GraphEdge.new(vertexD, vertexH)
    edgeGH = GraphEdge.new(vertexG, vertexH)
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeBC)

    .addEdge(edgeCG)

    .addEdge(edgeAD)

    .addEdge(edgeAE)

    .addEdge(edgeEF)

    .addEdge(edgeFD)

    .addEdge(edgeDH)

    .addEdge(edgeGH);

    
    expect(graph.to_s).to eq 'A,B,C,G,D,E,F,H'
    
    enterVertexCallback = jest.fn()
    leaveVertexCallback = jest.fn()
    
    // Traverse graphs without callbacks first.

    breadthFirstSearch(graph, vertexA);

    
    // Traverse graph with enterVertex and leaveVertex callbacks.

    breadthFirstSearch(graph, vertexA, {

    enterVertex: enterVertexCallback,

    leaveVertex: leaveVertexCallback,

    end

    
    expect(enterVertexCallback).to toHaveBeenCalledTimes(8)
    expect(leaveVertexCallback).to toHaveBeenCalledTimes(8)
    
    const enterVertexParamsMap = [

    { currentVertex: vertexA, previousVertex: null },

    { currentVertex: vertexB, previousVertex: vertexA },

    { currentVertex: vertexD, previousVertex: vertexB },

    { currentVertex: vertexE, previousVertex: vertexD },

    { currentVertex: vertexC, previousVertex: vertexE },

    { currentVertex: vertexH, previousVertex: vertexC },

    { currentVertex: vertexF, previousVertex: vertexH },

    { currentVertex: vertexG, previousVertex: vertexF },

    ];

    
    callIndex = 0
    params = enterVertexCallback.mock.calls[callIndex][0]
    expect(params.currentVertex).to eq enterVertexParamsMap[callIndex].currentVertex
    expect(params.previousVertex).to eq enterVertexParamsMap[callIndex].previousVertex
    }

    
    const leaveVertexParamsMap = [

    { currentVertex: vertexA, previousVertex: null },

    { currentVertex: vertexB, previousVertex: vertexA },

    { currentVertex: vertexD, previousVertex: vertexB },

    { currentVertex: vertexE, previousVertex: vertexD },

    { currentVertex: vertexC, previousVertex: vertexE },

    { currentVertex: vertexH, previousVertex: vertexC },

    { currentVertex: vertexF, previousVertex: vertexH },

    { currentVertex: vertexG, previousVertex: vertexF },

    ];

    
    callIndex = 0
    params = leaveVertexCallback.mock.calls[callIndex][0]
    expect(params.currentVertex).to eq leaveVertexParamsMap[callIndex].currentVertex
    expect(params.previousVertex).to eq leaveVertexParamsMap[callIndex].previousVertex
    }

  end

    
  it 'should allow to create custom vertex visiting logic' do
    graph = Graph.new(true)
    
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
    edgeCG = GraphEdge.new(vertexC, vertexG)
    edgeAD = GraphEdge.new(vertexA, vertexD)
    edgeAE = GraphEdge.new(vertexA, vertexE)
    edgeEF = GraphEdge.new(vertexE, vertexF)
    edgeFD = GraphEdge.new(vertexF, vertexD)
    edgeDH = GraphEdge.new(vertexD, vertexH)
    edgeGH = GraphEdge.new(vertexG, vertexH)
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeBC)

    .addEdge(edgeCG)

    .addEdge(edgeAD)

    .addEdge(edgeAE)

    .addEdge(edgeEF)

    .addEdge(edgeFD)

    .addEdge(edgeDH)

    .addEdge(edgeGH);

    
    expect(graph.to_s).to eq 'A,B,C,G,D,E,F,H'
    
    enterVertexCallback = jest.fn()
    leaveVertexCallback = jest.fn()
    
    // Traverse graph with enterVertex and leaveVertex callbacks.

    breadthFirstSearch(graph, vertexA, {

    enterVertex: enterVertexCallback,

    leaveVertex: leaveVertexCallback,

    allowTraversal: ({ currentVertex, nextVertex }) => {

    !(currentVertex === vertexA && nextVertex === vertexB)
    },

    end

    
    expect(enterVertexCallback).to toHaveBeenCalledTimes(7)
    expect(leaveVertexCallback).to toHaveBeenCalledTimes(7)
    
    const enterVertexParamsMap = [

    { currentVertex: vertexA, previousVertex: null },

    { currentVertex: vertexD, previousVertex: vertexA },

    { currentVertex: vertexE, previousVertex: vertexD },

    { currentVertex: vertexH, previousVertex: vertexE },

    { currentVertex: vertexF, previousVertex: vertexH },

    { currentVertex: vertexD, previousVertex: vertexF },

    { currentVertex: vertexH, previousVertex: vertexD },

    ];

    
    callIndex = 0
    params = enterVertexCallback.mock.calls[callIndex][0]
    expect(params.currentVertex).to eq enterVertexParamsMap[callIndex].currentVertex
    expect(params.previousVertex).to eq enterVertexParamsMap[callIndex].previousVertex
    }

    
    const leaveVertexParamsMap = [

    { currentVertex: vertexA, previousVertex: null },

    { currentVertex: vertexD, previousVertex: vertexA },

    { currentVertex: vertexE, previousVertex: vertexD },

    { currentVertex: vertexH, previousVertex: vertexE },

    { currentVertex: vertexF, previousVertex: vertexH },

    { currentVertex: vertexD, previousVertex: vertexF },

    { currentVertex: vertexH, previousVertex: vertexD },

    ];

    
    callIndex = 0
    params = leaveVertexCallback.mock.calls[callIndex][0]
    expect(params.currentVertex).to eq leaveVertexParamsMap[callIndex].currentVertex
    expect(params.previousVertex).to eq leaveVertexParamsMap[callIndex].previousVertex
    }

  end

end
