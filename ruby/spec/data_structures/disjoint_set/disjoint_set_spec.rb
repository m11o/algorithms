xdescribe DisjointSet do
  it 'should throw error when trying to union and check not existing sets' do
    def merge_not_existing_sets
      disjoint_set = DisjointSet.new
      disjoint_set.union('A', 'B')
    end

    def check_not_existing_sets
      disjoint_set = DisjointSet.new
      disjoint_set.in_same_set?('A', 'B')
    end

    expect { merge_not_existing_sets }.to raise_error Exception
    expect { check_not_existing_sets }.to raise_error Exception
  end

  it 'should do basic manipulations on disjoint set' do
    disjoint_set = DisjointSet.new

    expect(disjoint_set.find('A')).to eq nil
    expect(disjoint_set.find('B')).to eq nil

    disjoint_set.make_set('A')

    expect(disjoint_set.find('A')).to eq 'A'
    expect(disjoint_set.find('B')).to eq nil

    disjoint_set.make_set('B')

    expect(disjoint_set.find('A')).to eq 'A'
    expect(disjoint_set.find('B')).to eq 'B'

    disjoint_set.make_set('C')

    expect(disjoint_set.in_same_set?('A', 'B')).to eq false

    disjoint_set.union('A', 'B')

    expect(disjoint_set.find('A')).to eq 'A'
    expect(disjoint_set.find('B')).to eq 'A'
    expect(disjoint_set.in_same_set?('A', 'B')).to eq true
    expect(disjoint_set.in_same_set?('B', 'A')).to eq true
    expect(disjoint_set.in_same_set?('A', 'C')).to eq false

    disjoint_set.union('A', 'A')
    disjoint_set.union('B', 'C')

    expect(disjoint_set.find('A')).to eq 'A'
    expect(disjoint_set.find('B')).to eq 'A'
    expect(disjoint_set.find('C')).to eq 'A'

    expect(disjoint_set.in_same_set?('A', 'B')).to eq true
    expect(disjoint_set.in_same_set?('B', 'C')).to eq true
    expect(disjoint_set.in_same_set?('A', 'C')).to eq true

    disjoint_set.make_set('E').make_set('F').make_set('G').make_set('H').make_set('I')
    disjoint_set.union('E', 'F').union('F', 'G').union('G', 'H').union('H', 'I')

    expect(disjoint_set.in_same_set?('A', 'I')).to eq false
    expect(disjoint_set.in_same_set?('E', 'I')).to eq true

    disjoint_set.union('I', 'C')

    expect(disjoint_set.find('I')).to eq 'E'
    expect(disjoint_set.in_same_set?('A', 'I')).to eq true
  end

  it 'should union smaller set with bigger one making bigger one to be new root' do
    disjoint_set = DisjointSet.new
    disjoint_set.make_set('A').make_set('B').make_set('C').union('B', 'C').union('A', 'C')

    expect(disjoint_set.find('A')).to eq 'B'
  end

  it 'should do basic manipulations on disjoint set with custom key extractor' do
    key_extractor = ->(value) { value.key }
    disjoint_set = DisjointSet.new(&key_extractor)

    item_a = { key: 'A', value: 1 }
    item_b = { key: 'B', value: 2 }
    item_c = { key: 'C', value: 3 }

    expect(disjoint_set.find(item_a)).to eq nil
    expect(disjoint_set.find(item_b)).to eq nil

    disjoint_set.make_set(item_a)

    expect(disjoint_set.find(item_a)).to eq 'A'
    expect(disjoint_set.find(item_b)).to eq nil

    disjoint_set.make_set(item_b)

    expect(disjoint_set.find(item_a)).to eq 'A'
    expect(disjoint_set.find(item_b)).to eq 'B'

    disjoint_set.make_set(item_c)

    expect(disjoint_set.in_same_set?(item_a, item_b)).to eq false

    disjoint_set.union(item_a, item_b)

    expect(disjoint_set.find(item_a)).to eq 'A'
    expect(disjoint_set.find(item_b)).to eq 'A'
    expect(disjoint_set.in_same_set?(item_a, item_b)).to eq true
    expect(disjoint_set.in_same_set?(item_b, item_a)).to eq true
    expect(disjoint_set.in_same_set?(item_a, item_c)).to eq false

    disjoint_set.union(item_a, item_c)

    expect(disjoint_set.find(item_a)).to eq 'A'
    expect(disjoint_set.find(item_b)).to eq 'A'
    expect(disjoint_set.find(item_c)).to eq 'A'

    expect(disjoint_set.in_same_set?(item_a, item_b)).to eq true
    expect(disjoint_set.in_same_set?(item_b, item_c)).to eq true
    expect(disjoint_set.in_same_set?(item_a, item_c)).to eq true
  end
end
