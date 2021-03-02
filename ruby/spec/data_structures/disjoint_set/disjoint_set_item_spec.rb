xdescribe DisjointSetItem do
  it 'should do basic manipulation with disjoint set item' do
    item_a = DisjointSetItem.new('A')
    item_b = DisjointSetItem.new('B')
    item_c = DisjointSetItem.new('C')
    item_d = DisjointSetItem.new('D')

    expect(item_a.rank).to eq 0
    expect(item_a.children).to eq []
    expect(item_a.key).to eq 'A'
    expect(item_a.root).to eq item_a
    expect(item_a.root?).to eq true
    expect(item_b.root?).to eq true

    item_a.add_child(item_b)
    item_d.set_parent(item_c)

    expect(item_a.rank).to eq 1
    expect(item_c.rank).to eq 1

    expect(item_b.rank).to eq 0
    expect(item_d.rank).to eq 0

    expect(item_a.children.length).to eq 1
    expect(item_c.children.length).to eq 1

    expect(item_a.children[0]).to eq item_b
    expect(item_c.children[0]).to eq item_d

    expect(item_b.children.length).to eq 0
    expect(item_d.children.length).to eq 0

    expect(item_a.root).to eq item_a
    expect(item_b.root).to eq item_a

    expect(item_c.root).to eq item_c
    expect(item_d.root).to eq item_c

    expect(item_a.root?).to eq true
    expect(item_b.root?).to eq false
    expect(item_c.root?).to eq true
    expect(item_d.root?).to eq false

    item_a.add_child(item_c)

    expect(item_a.root?).to eq true
    expect(item_b.root?).to eq false
    expect(item_c.root?).to eq false
    expect(item_d.root?).to eq false

    expect(item_a.rank).to eq 3
    expect(item_b.rank).to eq 0
    expect(item_c.rank).to eq 1
  end

  it 'should do basic manipulation with disjoint set item with custom key extractor' do
    key_extractor = ->(value) { value.key }

    item_a = DisjointSetItem.new({ key: 'A', value: 1 }, &key_extractor)
    item_b = DisjointSetItem.new({ key: 'B', value: 2 }, &key_extractor)
    item_c = DisjointSetItem.new({ key: 'C', value: 3 }, &key_extractor)
    item_d = DisjointSetItem.new({ key: 'D', value: 4 }, &key_extractor)

    expect(item_a.rank).to eq 0
    expect(item_a.children).to eq []
    expect(item_a.key).to eq 'A'
    expect(item_a.root).to eq item_a
    expect(item_a.root?).to eq true
    expect(item_b.root?).to eq true

    item_a.add_child(item_b)
    item_d.set_parent(item_c)

    expect(item_a.rank).to eq 1
    expect(item_c.rank).to eq 1

    expect(item_b.rank).to eq 0
    expect(item_d.rank).to eq 0

    expect(item_a.children.length).to eq 1
    expect(item_c.children.length).to eq 1

    expect(item_a.children[0]).to eq item_b
    expect(item_c.children[0]).to eq item_d

    expect(item_b.children.length).to eq 0
    expect(item_d.children.length).to eq 0

    expect(item_a.root).to eq item_a
    expect(item_b.root).to eq item_a

    expect(item_c.root).to eq item_c
    expect(item_d.root).to eq item_c

    expect(item_a.root?).to eq true
    expect(item_b.root?).to eq false
    expect(item_c.root?).to eq true
    expect(item_d.root?).to eq false

    item_a.add_child(item_c)

    expect(item_a.root?).to eq true
    expect(item_b.root?).to eq false
    expect(item_c.root?).to eq false
    expect(item_d.root?).to eq false

    expect(item_a.rank).to eq 3
    expect(item_b.rank).to eq 0
    expect(item_c.rank).to eq 1
  end
end
