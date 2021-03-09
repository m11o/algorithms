describe Graph do
  it 'should add vertices to graph' do
    graph = Graph.new

    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')

    graph.add_vertex(vertex_a).add_vertex(vertex_b)

    expect(graph.to_s).to eq 'A,B'
    expect(graph.get_vertex_by_key(vertex_a.key)).to eq vertex_a
    expect(graph.get_vertex_by_key(vertex_b.key)).to eq vertex_b
  end

  it 'should add edges to undirected graph' do
    graph = Graph.new

    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b)

    graph.add_edge(edge_a_b)

    expect(graph.all_vertices.length).to eq 2
    expect(graph.all_vertices[0]).to eq vertex_a
    expect(graph.all_vertices[1]).to eq vertex_b

    graph_vertex_a = graph.get_vertex_by_key(vertex_a.key)
    graph_vertex_b = graph.get_vertex_by_key(vertex_b.key)

    expect(graph.to_s).to eq 'A,B'

    expect(graph.get_vertex_by_key('not existing')).to eq nil

    expect(graph_vertex_a.neighbors.length).to eq 1
    expect(graph_vertex_a.neighbors[0]).to eq vertex_b
    expect(graph_vertex_a.neighbors[0]).to eq graph_vertex_b

    expect(graph_vertex_b.neighbors.length).to eq 1
    expect(graph_vertex_b.neighbors[0]).to eq vertex_a
    expect(graph_vertex_b.neighbors[0]).to eq graph_vertex_a
  end

  it 'should add edges to directed graph' do
    graph = Graph.new(true)

    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b)

    graph.add_edge(edge_a_b)

    graph_vertex_a = graph.get_vertex_by_key(vertex_a.key)
    graph_vertex_b = graph.get_vertex_by_key(vertex_b.key)

    expect(graph.to_s).to eq 'A,B'

    expect(graph_vertex_a.neighbors.length).to eq 1
    expect(graph_vertex_a.neighbors[0]).to eq vertex_b
    expect(graph_vertex_a.neighbors[0]).to eq graph_vertex_b

    expect(graph_vertex_b.neighbors.length).to eq 0
  end

  it 'should find edge by vertices in undirected graph' do
    graph = Graph.new

    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b, 10)

    graph.add_edge(edge_a_b)

    graph_edge_a_b = graph.findEdge(vertex_a, vertex_b)
    graph_edge_b_a = graph.findEdge(vertex_b, vertex_a)
    graph_edge_a_c = graph.findEdge(vertex_a, vertex_c)
    graph_edge_c_a = graph.findEdge(vertex_c, vertex_a)

    expect(graph_edge_a_c).to eq nil
    expect(graph_edge_c_a).to eq nil
    expect(graph_edge_a_b).to eq edge_a_b
    expect(graph_edge_b_a).to eq edge_a_b
    expect(graph_edge_a_b.weight).to eq 10
  end

  it 'should find edge by vertices in directed graph' do
    graph = Graph.new(true)

    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b, 10)

    graph.add_edge(edge_a_b)

    graph_edge_a_b = graph.find_edge(vertex_a, vertex_b)
    graph_edge_b_a = graph.find_edge(vertex_b, vertex_a)
    graph_edge_a_c = graph.find_edge(vertex_a, vertex_c)
    graph_edge_c_a = graph.find_edge(vertex_c, vertex_a)

    expect(graph_edge_a_c).to eq nil
    expect(graph_edge_c_a).to eq nil
    expect(graph_edge_b_a).to eq nil
    expect(graph_edge_a_b).to eq edge_a_b
    expect(graph_edge_a_b.weight).to eq 10
  end

  it 'should return vertex neighbors' do
    graph = Graph.new(true)

    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b)
    edge_a_c = GraphEdge.new(vertex_a, vertex_c)

    graph.add_edge(edge_a_b).add_edge(edge_a_c)
    neighbors = graph.getNeighbors(vertex_a)

    expect(neighbors.length).to eq 2
    expect(neighbors[0]).to eq vertex_b
    expect(neighbors[1]).to eq vertex_c
  end

  it 'should throw an error when trying to add edge twice' do
    def add_same_edge_twice
      graph = Graph.new(true)

      vertex_a = GraphVertex.new('A')
      vertex_b = GraphVertex.new('B')

      edge_a_b = GraphEdge.new(vertex_a, vertex_b)
      graph.add_edge(edge_a_b).add_edge(edge_a_b)
    end

    expect { add_same_edge_twice }.to raise_error Exception
  end

  it 'should return the list of all added edges' do
    graph = Graph.new(true)

    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b)
    edge_b_c = GraphEdge.new(vertex_b, vertex_c)

    graph.add_edge(edge_a_b).add_edge(edge_b_c)

    edges = graph.all_edges

    expect(edges.length).to eq 2
    expect(edges[0]).to eq edge_a_b
    expect(edges[1]).to eq edge_b_c
  end

  it 'should calculate total graph weight for default graph' do
    graph = Graph.new

    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')
    vertex_d = GraphVertex.new('D')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b)
    edge_b_c = GraphEdge.new(vertex_b, vertex_c)
    edge_c_d = GraphEdge.new(vertex_c, vertex_d)
    edge_a_d = GraphEdge.new(vertex_a, vertex_d)

    graph.add_edge(edge_a_b).add_edge(edge_b_c).add_edge(edge_c_d).add_edge(edge_a_d)

    expect(graph.weight).to eq 0
  end

  it 'should calculate total graph weight for weighted graph' do
    graph = Graph.new

    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')
    vertex_d = GraphVertex.new('D')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b, 1)
    edge_b_c = GraphEdge.new(vertex_b, vertex_c, 2)
    edge_c_d = GraphEdge.new(vertex_c, vertex_d, 3)
    edge_a_d = GraphEdge.new(vertex_a, vertex_d, 4)

    graph.add_edge(edge_a_b).add_edge(edge_b_c).add_edge(edge_c_d).add_edge(edge_a_d)

    expect(graph.weight).to eq 10
  end

  it 'should be possible to delete edges from graph' do
    graph = Graph.new

    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b)
    edge_b_c = GraphEdge.new(vertex_b, vertex_c)
    edge_a_c = GraphEdge.new(vertex_a, vertex_c)

    graph.add_edge(edge_a_b).add_edge(edge_b_c).add_edge(edge_a_c)

    expect(graph.all_edges.length).to eq 3

    graph.delete_edge(edge_a_b)

    expect(graph.all_edges.length).to eq 2
    expect(graph.all_edges[0].key).to eq edge_b_c.key
    expect(graph.all_edges[1].key).to eq edge_a_c.key
  end

  it 'should should throw an error when trying to delete not existing edge' do
    def delete_not_existing_edge
      graph = Graph.new

      vertex_a = GraphVertex.new('A')
      vertex_b = GraphVertex.new('B')
      vertex_c = GraphVertex.new('C')

      edge_a_b = GraphEdge.new(vertex_a, vertex_b)
      edge_b_c = GraphEdge.new(vertex_b, vertex_c)

      graph.add_edge(edge_a_b)
      graph.delete_edge(edge_b_c)
    end

    expect { delete_not_existing_edge }.to raise_error Exception
  end

  it 'should be possible to reverse graph' do
    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')
    vertex_d = GraphVertex.new('D')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b)
    edge_a_c = GraphEdge.new(vertex_a, vertex_c)
    edge_c_d = GraphEdge.new(vertex_c, vertex_d)

    graph = Graph.new(true)
    graph.add_edge(edge_a_b).add_edge(edge_a_c).add_edge(edge_c_d)

    expect(graph.to_s).to eq 'A,B,C,D'
    expect(graph.all_edges.length).to eq 3
    expect(graph.neighbors(vertex_a).length).to eq 2
    expect(graph.neighbors(vertex_a)[0].key).to eq vertex_b.key
    expect(graph.neighbors(vertex_a)[1].key).to eq vertex_c.key
    expect(graph.neighbors(vertex_b).length).to eq 0
    expect(graph.neighbors(vertex_c).length).to eq 1
    expect(graph.neighbors(vertex_c)[0].key).to eq vertex_d.key
    expect(graph.neighbors(vertex_d).length).to eq 0

    graph.reverse!

    expect(graph.to_s).to eq 'A,B,C,D'
    expect(graph.all_edges.length).to eq 3
    expect(graph.neighbors(vertex_a).length).to eq 0
    expect(graph.neighbors(vertex_b).length).to eq 1
    expect(graph.neighbors(vertex_b)[0].key).to eq vertex_a.key
    expect(graph.neighbors(vertex_c).length).to eq 1
    expect(graph.neighbors(vertex_c)[0].key).to eq vertex_a.key
    expect(graph.neighbors(vertex_d).length).to eq 1
    expect(graph.neighbors(vertex_d)[0].key).to eq vertex_c.key
  end

  it 'should return vertices indices' do
    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')
    vertex_d = GraphVertex.new('D')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b)
    edge_b_c = GraphEdge.new(vertex_b, vertex_c)
    edge_c_d = GraphEdge.new(vertex_c, vertex_d)
    edge_b_d = GraphEdge.new(vertex_b, vertex_d)

    graph = Graph.new
    graph.add_edge(edge_a_b).add_edge(edge_b_c).add_edge(edge_c_d).add_edge(edge_b_d)

    vertices_indices = graph.vertices_indices
    expect(vertices_indices).to include('A' => 0, 'B' => 1, 'C' => 2, 'D' => 3)
  end

  it 'should generate adjacency matrix for undirected graph' do
    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')
    vertex_d = GraphVertex.new('D')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b)
    edge_b_c = GraphEdge.new(vertex_b, vertex_c)
    edge_c_d = GraphEdge.new(vertex_c, vertex_d)
    edge_b_d = GraphEdge.new(vertex_b, vertex_d)

    graph = Graph.new
    graph.add_edge(edge_a_b).add_edge(edge_b_c).add_edge(edge_c_d).add_edge(edge_b_d)

    adjacency_matrix = graph.get_adjacency_matrix
    expect(adjacency_matrix).to match_array([[Infinity, 0, Infinity, Infinity], [0, Infinity, 0, 0],
                                             [Infinity, 0, Infinity, 0], [Infinity, 0, 0, Infinity]])
  end

  it 'should generate adjacency matrix for directed graph' do
    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')
    vertex_d = GraphVertex.new('D')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b, 2)
    edge_b_c = GraphEdge.new(vertex_b, vertex_c, 1)
    edge_c_d = GraphEdge.new(vertex_c, vertex_d, 5)
    edge_b_d = GraphEdge.new(vertex_b, vertex_d, 7)

    graph = Graph.new(true)
    graph.add_edge(edge_a_b).add_edge(edge_b_c).add_edge(edge_c_d).add_edge(edge_b_d)

    adjacency_matrix = graph.get_adjacency_matrix
    expect(adjacency_matrix).to match_array([[Infinity, 2, Infinity, Infinity],
                                             [Infinity, Infinity, 1, 7],
                                             [Infinity, Infinity, Infinity, 5],
                                             [Infinity, Infinity, Infinity, Infinity]])
  end
end
