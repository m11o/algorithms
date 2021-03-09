describe GraphVertex do
  it 'should throw an error when trying to create vertex without value' do
    def create_empty_vertex
      GraphVertex.new
    end

    expect { create_empty_vertex }.to raise_error Exception
  end

  it 'should create graph vertex' do
    vertex = GraphVertex.new('A')

    expect(vertex.value).to eq 'A'
    expect(vertex.to_s).to eq 'A'
    expect(vertex.key).to eq 'A'
    expect(vertex.edges.to_s).to eq ''
    expect(vertex.edges).to eq []
  end

  it 'should add edges to vertex and check if it exists' do
    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b)
    vertex_a.add_edge(edge_a_b)

    expect(vertex_a.edge?(edge_a_b)).to eq true
    expect(vertex_b.edge?(edge_a_b)).to eq false
    expect(vertex_a.edges.length).to eq 1
    expect(vertex_a.edges[0].to_s).to eq 'A_B'
  end

  it 'should delete edges from vertex' do
    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b)
    edge_a_c = GraphEdge.new(vertex_a, vertex_c)
    vertex_a.add_edge(edge_a_b).add_edge(edge_a_c)

    expect(vertex_a.edge?(edge_a_b)).to eq true
    expect(vertex_b.edge?(edge_a_b)).to eq false

    expect(vertex_a.edge?(edge_a_c)).to eq true
    expect(vertex_c.edge?(edge_a_c)).to eq false

    expect(vertex_a.edges.length).to eq 2

    expect(vertex_a.edges[0].to_s).to eq 'A_B'
    expect(vertex_a.edges[1].to_s).to eq 'A_C'

    vertex_a.delete_edge(edge_a_b)

    expect(vertex_a.edge?(edge_a_b)).to eq false
    expect(vertex_a.edge?(edge_a_c)).to eq true
    expect(vertex_a.edges[0].to_s).to eq 'A_C'

    vertex_a.delete_edge(edge_a_c)

    expect(vertex_a.edge?(edge_a_b)).to eq false
    expect(vertex_a.edge?(edge_a_c)).to eq false
    expect(vertex_a.edges.length).to eq 0
  end

  it 'should delete all edges from vertex' do
    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b)
    edge_a_c = GraphEdge.new(vertex_a, vertex_c)
    vertex_a.add_edge(edge_a_b).add_edge(edge_a_c)

    expect(vertex_a.edge?(edge_a_b)).to eq true
    expect(vertex_b.edge?(edge_a_b)).to eq false

    expect(vertex_a.edge?(edge_a_c)).to eq true
    expect(vertex_c.edge?(edge_a_c)).to eq false

    expect(vertex_a.edges.length).to eq 2

    vertex_a.delete_all_edges

    expect(vertex_a.edge?(edge_a_b)).to eq false
    expect(vertex_b.edge?(edge_a_b)).to eq false

    expect(vertex_a.edge?(edge_a_c)).to eq false
    expect(vertex_c.edge?(edge_a_c)).to eq false

    expect(vertex_a.edges.length).to eq 0
  end

  it 'should return vertex neighbors in case if current node is start one' do
    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b)
    edge_a_c = GraphEdge.new(vertex_a, vertex_c)
    vertex_a.add_edge(edge_a_b).add_edge(edge_a_c)

    expect(vertex_b.neighbors).to eq []

    neighbors = vertex_a.neighbors

    expect(neighbors.length).to eq 2
    expect(neighbors[0]).to eq vertex_b
    expect(neighbors[1]).to eq vertex_c
  end

  it 'should return vertex neighbors in case if current node is end one' do
    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')

    edge_b_a = GraphEdge.new(vertex_b, vertex_a)
    edge_c_a = GraphEdge.new(vertex_c, vertex_a)
    vertex_a.add_edge(edge_b_a).add_edge(edge_c_a)

    expect(vertex_b.neighbors).to eq []

    neighbors = vertex_a.neighbors

    expect(neighbors.length).to eq 2
    expect(neighbors[0]).to eq vertex_b
    expect(neighbors[1]).to eq vertex_c
  end

  it 'should check if vertex has specific neighbor' do
    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b)
    vertex_a.add_edge(edge_a_b)

    expect(vertex_a.neighbor?(vertex_b)).to eq true
    expect(vertex_a.neighbor?(vertex_c)).to eq false
  end

  it 'should edge by vertex' do
    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    vertex_c = GraphVertex.new('C')

    edge_a_b = GraphEdge.new(vertex_a, vertex_b)
    vertex_a.add_edge(edge_a_b)

    expect(vertex_a.find_edge(vertex_b)).to eq edge_a_b
    expect(vertex_a.find_edge(vertex_c)).to eq nil
  end

  it 'should calculate vertex degree' do
    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')

    expect(vertex_a.degree).to eq 0

    edge_a_b = GraphEdge.new(vertex_a, vertex_b)
    vertex_a.add_edge(edge_a_b)

    expect(vertex_a.degree).to eq 1

    edge_b_a = GraphEdge.new(vertex_b, vertex_a)
    vertex_a.add_edge(edge_b_a)

    expect(vertex_a.degree).to eq 2

    vertex_a.add_edge(edge_a_b)

    expect(vertex_a.degree).to eq 3

    expect(vertex_a.edges.length).to eq 3
  end
end
