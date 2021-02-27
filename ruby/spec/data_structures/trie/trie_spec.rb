    
describe Trie do
  it 'should create trie' do
    trie = Trie.new()
    
    expect(trie.head.to_s).to be '*'
  end

    
  it 'should add words to trie' do
    trie = Trie.new()
    
    trie.addWord('cat');

    
    expect(trie.head.to_s).to be '*:c'
    expect(trie.head.getChild('c').to be 'c:a'
    
    trie.addWord('car');

    expect(trie.head.to_s).to be '*:c'
    expect(trie.head.getChild('c').to be 'c:a'
    expect(trie.head.getChild('c').getChild('a').to be 'a:t,r'
    expect(trie.head.getChild('c').getChild('a').getChild('t').to be 't*'
  end

    
  it 'should delete words from trie' do
    trie = Trie.new()
    
    trie.addWord('carpet');

    trie.addWord('car');

    trie.addWord('cat');

    trie.addWord('cart');

    expect(trie.doesWordExist('carpet')).to be true
    expect(trie.doesWordExist('car')).to be true
    expect(trie.doesWordExist('cart')).to be true
    expect(trie.doesWordExist('cat')).to be true
    
    // Try to delete not-existing word first.

    trie.deleteWord('carpool');

    expect(trie.doesWordExist('carpet')).to be true
    expect(trie.doesWordExist('car')).to be true
    expect(trie.doesWordExist('cart')).to be true
    expect(trie.doesWordExist('cat')).to be true
    
    trie.deleteWord('carpet');

    expect(trie.doesWordExist('carpet')).to eq false
    expect(trie.doesWordExist('car')).to eq true
    expect(trie.doesWordExist('cart')).to be true
    expect(trie.doesWordExist('cat')).to be true
    
    trie.deleteWord('cat');

    expect(trie.doesWordExist('car')).to eq true
    expect(trie.doesWordExist('cart')).to be true
    expect(trie.doesWordExist('cat')).to be false
    
    trie.deleteWord('car');

    expect(trie.doesWordExist('car')).to eq false
    expect(trie.doesWordExist('cart')).to be true
    
    trie.deleteWord('cart');

    expect(trie.doesWordExist('car')).to eq false
    expect(trie.doesWordExist('cart')).to be false
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

    
    expect(trie.doesWordExist('cat')).to be true
    expect(trie.doesWordExist('cats')).to be true
    expect(trie.doesWordExist('carpet')).to be true
    expect(trie.doesWordExist('car')).to be true
    expect(trie.doesWordExist('cap')).to be false
    expect(trie.doesWordExist('call')).to be false
  end

end
