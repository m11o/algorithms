describe GraphEdge do
  it 'should create graph edge with default weight' do
    start_vertex = GraphVertex.new('A')
    end_vertex = GraphVertex.new('B')
    edge = GraphEdge.new(start_vertex, end_vertex)

    expect(edge.key).to eq 'A_B'
    expect(edge.to_s).to eq 'A_B'
    expect(edge.start_vertex).to eq start_vertex
    expect(edge.end_vertex).to eq end_vertex
    expect(edge.weight).to eq 0
  end

  it 'should create graph edge with predefined weight' do
    start_vertex = GraphVertex.new('A')
    end_vertex = GraphVertex.new('B')
    edge = GraphEdge.new(start_vertex, end_vertex, 10)

    expect(edge.start_vertex).to eq start_vertex
    expect(edge.end_vertex).to eq end_vertex
    expect(edge.weight).to eq 10
  end

  it 'should be possible to do edge reverse' do
    vertex_a = GraphVertex.new('A')
    vertex_b = GraphVertex.new('B')
    edge = GraphEdge.new(vertex_a, vertex_b, 10)

    expect(edge.start_vertex).to eq vertex_a
    expect(edge.end_vertex).to eq vertex_b
    expect(edge.weight).to eq 10

    edge.reverse!

    expect(edge.start_vertex).to eq vertex_b
    expect(edge.end_vertex).to eq vertex_a
    expect(edge.weight).to eq 10
  end
end
