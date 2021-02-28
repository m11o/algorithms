    
describe depthFirstSearch do
  it 'should perform DFS operation on graph' do
    graph = Graph.new(true)
    
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    vertexF = GraphVertex.new('F')
    vertexG = GraphVertex.new('G')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeCG = GraphEdge.new(vertexC, vertexG)
    edgeAD = GraphEdge.new(vertexA, vertexD)
    edgeAE = GraphEdge.new(vertexA, vertexE)
    edgeEF = GraphEdge.new(vertexE, vertexF)
    edgeFD = GraphEdge.new(vertexF, vertexD)
    edgeDG = GraphEdge.new(vertexD, vertexG)
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeBC)

    .addEdge(edgeCG)

    .addEdge(edgeAD)

    .addEdge(edgeAE)

    .addEdge(edgeEF)

    .addEdge(edgeFD)

    .addEdge(edgeDG);

    
    expect(graph.to_s).to eq 'A,B,C,G,D,E,F'
    
    enterVertexCallback = jest.fn()
    leaveVertexCallback = jest.fn()
    
    // Traverse graphs without callbacks first to check default ones.

    depthFirstSearch(graph, vertexA);

    
    // Traverse graph with enterVertex and leaveVertex callbacks.

    depthFirstSearch(graph, vertexA, {

    enterVertex: enterVertexCallback,

    leaveVertex: leaveVertexCallback,

    end

    
    expect(enterVertexCallback).to toHaveBeenCalledTimes(graph.getAllVertices().length)
    expect(leaveVertexCallback).to toHaveBeenCalledTimes(graph.getAllVertices().length)
    
    const enterVertexParamsMap = [

    { currentVertex: vertexA, previousVertex: null },

    { currentVertex: vertexB, previousVertex: vertexA },

    { currentVertex: vertexC, previousVertex: vertexB },

    { currentVertex: vertexG, previousVertex: vertexC },

    { currentVertex: vertexD, previousVertex: vertexA },

    { currentVertex: vertexE, previousVertex: vertexA },

    { currentVertex: vertexF, previousVertex: vertexE },

    ];

    
    callIndex = 0
    params = enterVertexCallback.mock.calls[callIndex][0]
    expect(params.currentVertex).to eq enterVertexParamsMap[callIndex].currentVertex
    expect(params.previousVertex).to eq enterVertexParamsMap[callIndex].previousVertex
    }

    
    const leaveVertexParamsMap = [

    { currentVertex: vertexG, previousVertex: vertexC },

    { currentVertex: vertexC, previousVertex: vertexB },

    { currentVertex: vertexB, previousVertex: vertexA },

    { currentVertex: vertexD, previousVertex: vertexA },

    { currentVertex: vertexF, previousVertex: vertexE },

    { currentVertex: vertexE, previousVertex: vertexA },

    { currentVertex: vertexA, previousVertex: null },

    ];

    
    callIndex = 0
    params = leaveVertexCallback.mock.calls[callIndex][0]
    expect(params.currentVertex).to eq leaveVertexParamsMap[callIndex].currentVertex
    expect(params.previousVertex).to eq leaveVertexParamsMap[callIndex].previousVertex
    }

  end

    
  it 'allow users to redefine vertex visiting logic' do
    graph = Graph.new(true)
    
    vertexA = GraphVertex.new('A')
    vertexB = GraphVertex.new('B')
    vertexC = GraphVertex.new('C')
    vertexD = GraphVertex.new('D')
    vertexE = GraphVertex.new('E')
    vertexF = GraphVertex.new('F')
    vertexG = GraphVertex.new('G')
    
    edgeAB = GraphEdge.new(vertexA, vertexB)
    edgeBC = GraphEdge.new(vertexB, vertexC)
    edgeCG = GraphEdge.new(vertexC, vertexG)
    edgeAD = GraphEdge.new(vertexA, vertexD)
    edgeAE = GraphEdge.new(vertexA, vertexE)
    edgeEF = GraphEdge.new(vertexE, vertexF)
    edgeFD = GraphEdge.new(vertexF, vertexD)
    edgeDG = GraphEdge.new(vertexD, vertexG)
    
    graph

    .addEdge(edgeAB)

    .addEdge(edgeBC)

    .addEdge(edgeCG)

    .addEdge(edgeAD)

    .addEdge(edgeAE)

    .addEdge(edgeEF)

    .addEdge(edgeFD)

    .addEdge(edgeDG);

    
    expect(graph.to_s).to eq 'A,B,C,G,D,E,F'
    
    enterVertexCallback = jest.fn()
    leaveVertexCallback = jest.fn()
    
    depthFirstSearch(graph, vertexA, {

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

    { currentVertex: vertexG, previousVertex: vertexD },

    { currentVertex: vertexE, previousVertex: vertexA },

    { currentVertex: vertexF, previousVertex: vertexE },

    { currentVertex: vertexD, previousVertex: vertexF },

    { currentVertex: vertexG, previousVertex: vertexD },

    ];

    
    callIndex = 0
    params = enterVertexCallback.mock.calls[callIndex][0]
    expect(params.currentVertex).to eq enterVertexParamsMap[callIndex].currentVertex
    expect(params.previousVertex).to eq enterVertexParamsMap[callIndex].previousVertex
    }

    
    const leaveVertexParamsMap = [

    { currentVertex: vertexG, previousVertex: vertexD },

    { currentVertex: vertexD, previousVertex: vertexA },

    { currentVertex: vertexG, previousVertex: vertexD },

    { currentVertex: vertexD, previousVertex: vertexF },

    { currentVertex: vertexF, previousVertex: vertexE },

    { currentVertex: vertexE, previousVertex: vertexA },

    { currentVertex: vertexA, previousVertex: null },

    ];

    
    callIndex = 0
    params = leaveVertexCallback.mock.calls[callIndex][0]
    expect(params.currentVertex).to eq leaveVertexParamsMap[callIndex].currentVertex
    expect(params.previousVertex).to eq leaveVertexParamsMap[callIndex].previousVertex
    }

  end

end
