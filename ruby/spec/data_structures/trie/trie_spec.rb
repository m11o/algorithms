    
xdescribe Trie do
  it 'should create trie' do
    trie = Trie.new()
    
    expect(trie.head.to_s).to eq '*'
  end

    
  it 'should add words to trie' do
    trie = Trie.new()
    
    trie.addWord('cat');

    
    expect(trie.head.to_s).to eq '*:c'
    expect(trie.head.getChild('c').to eq 'c:a'
    
    trie.addWord('car');

    expect(trie.head.to_s).to eq '*:c'
    expect(trie.head.getChild('c').to eq 'c:a'
    expect(trie.head.getChild('c').getChild('a').to eq 'a:t,r'
    expect(trie.head.getChild('c').getChild('a').getChild('t').to eq 't*'
  end

    
  it 'should delete words from trie' do
    trie = Trie.new()
    
    trie.addWord('carpet');

    trie.addWord('car');

    trie.addWord('cat');

    trie.addWord('cart');

    expect(trie.doesWordExist('carpet')).to eq true
    expect(trie.doesWordExist('car')).to eq true
    expect(trie.doesWordExist('cart')).to eq true
    expect(trie.doesWordExist('cat')).to eq true
    
    // Try to delete not-existing word first.

    trie.deleteWord('carpool');

    expect(trie.doesWordExist('carpet')).to eq true
    expect(trie.doesWordExist('car')).to eq true
    expect(trie.doesWordExist('cart')).to eq true
    expect(trie.doesWordExist('cat')).to eq true
    
    trie.deleteWord('carpet');

    expect(trie.doesWordExist('carpet')).to eq false
    expect(trie.doesWordExist('car')).to eq true
    expect(trie.doesWordExist('cart')).to eq true
    expect(trie.doesWordExist('cat')).to eq true
    
    trie.deleteWord('cat');

    expect(trie.doesWordExist('car')).to eq true
    expect(trie.doesWordExist('cart')).to eq true
    expect(trie.doesWordExist('cat')).to eq false
    
    trie.deleteWord('car');

    expect(trie.doesWordExist('car')).to eq false
    expect(trie.doesWordExist('cart')).to eq true
    
    trie.deleteWord('cart');

    expect(trie.doesWordExist('car')).to eq false
    expect(trie.doesWordExist('cart')).to eq false
  end

    
  it 'should suggests next characters' do
    trie = Trie.new()
    
    trie.addWord('cat');

    trie.addWord('cats');

    trie.addWord('car');

    trie.addWord('caption');

    
    expect(trie.suggestNextCharacters('ca')).to eq ['t', 'r', 'p']
    expect(trie.suggestNextCharacters('cat')).to eq ['s']
    expect(trie.suggestNextCharacters('cab')).to eq nil
  end

    
  it 'should check if word exists' do
    trie = Trie.new()
    
    trie.addWord('cat');

    trie.addWord('cats');

    trie.addWord('carpet');

    trie.addWord('car');

    trie.addWord('caption');

    
    expect(trie.doesWordExist('cat')).to eq true
    expect(trie.doesWordExist('cats')).to eq true
    expect(trie.doesWordExist('carpet')).to eq true
    expect(trie.doesWordExist('car')).to eq true
    expect(trie.doesWordExist('cap')).to eq false
    expect(trie.doesWordExist('call')).to eq false
  end

end
