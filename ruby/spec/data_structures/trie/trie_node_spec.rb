xdescribe TrieNode do
  it 'should create trie node' do
    trie_node = TrieNode.new('c', true)

    expect(trie_node.character).to eq 'c'
    expect(trie_node.complete_word?).to eq true
    expect(trie_node.to_s).to eq 'c*'
  end

  it 'should add child nodes' do
    trie_node = TrieNode.new('c')
    trie_node.add_child('a', true)
    trie_node.add_child('o')

    expect(trie_node.to_s).to eq 'c:a,o'
  end

  it 'should get child nodes' do
    trie_node = TrieNode.new('c')
    trie_node.add_child('a')
    trie_node.add_child('o')

    expect(trie_node.child('a')).to eq 'a'
    expect(trie_node.child('a').character).to eq 'a'
    expect(trie_node.child('o')).to eq 'o'
    expect(trie_node.child('b')).to eq nil
  end

  it 'should check if node has children' do
    trie_node = TrieNode.new('c')

    expect(trie_node.children?).to eq false

    trie_node.add_child('a')

    expect(trie_node.children?).to eq true
  end

  it 'should check if node has specific child' do
    trie_node = TrieNode.new('c')
    trie_node.add_child('a')
    trie_node.add_child('o')

    expect(trie_node.child?('a')).to eq true
    expect(trie_node.child?('o')).to eq true
    expect(trie_node.child?('b')).to eq false
  end

  it 'should suggest next children' do
    trie_node = TrieNode.new('c')
    trie_node.add_child('a')
    trie_node.add_child('o')

    expect(trie_node.suggest_children).to eq %w[a o]
  end

  it 'should delete child node if the child node has NO children' do
    trie_node = TrieNode.new('c')
    trie_node.add_child('a')

    expect(trie_node.child?('a')).to eq true

    trie_node.remove_child('a')

    expect(trie_node.child?('a')).to eq false
  end

  it 'should NOT delete child node if the child node has children' do
    trie_node = TrieNode.new('c')
    trie_node.add_child('a')

    child_node = trie_node.child('a')
    child_node.add_child('r')

    trie_node.remove_child('a')

    expect(trie_node.child?('a')).to eq true
  end

  it 'should NOT delete child node if the child node completes a word' do
    trie_node = TrieNode.new('c')
    trie_node.add_child('a', true)

    trie_node.remove_child('a')

    expect(trie_node.child?('a')).to eq true
  end
end
