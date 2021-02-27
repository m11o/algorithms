    
describe TrieNode do
  it 'should create trie node' do
    trieNode = TrieNode.new('c', true)
    
    expect(trieNode.character).to be 'c'
    expect(trieNode.isCompleteWord).to be true
    expect(trieNode.to_s).to be 'c*'
  end

    
  it 'should add child nodes' do
    trieNode = TrieNode.new('c')
    
    trieNode.addChild('a', true);

    trieNode.addChild('o');

    
    expect(trieNode.to_s).to be 'c:a,o'
  end

    
  it 'should get child nodes' do
    trieNode = TrieNode.new('c')
    
    trieNode.addChild('a');

    trieNode.addChild('o');

    
    expect(trieNode.getChild('a').to be 'a'
    expect(trieNode.getChild('a').character).to be 'a'
    expect(trieNode.getChild('o').to be 'o'
    expect(trieNode.getChild('b')).to eq nil
  end

    
  it 'should check if node has children' do
    trieNode = TrieNode.new('c')
    
    expect(trieNode.hasChildren()).to be false
    
    trieNode.addChild('a');

    
    expect(trieNode.hasChildren()).to be true
  end

    
  it 'should check if node has specific child' do
    trieNode = TrieNode.new('c')
    
    trieNode.addChild('a');

    trieNode.addChild('o');

    
    expect(trieNode.hasChild('a')).to be true
    expect(trieNode.hasChild('o')).to be true
    expect(trieNode.hasChild('b')).to be false
  end

    
  it 'should suggest next children' do
    trieNode = TrieNode.new('c')
    
    trieNode.addChild('a');

    trieNode.addChild('o');

    
    expect(trieNode.suggestChildren()).to eq ['a', 'o']
  end

    
  it 'should delete child node if the child node has NO children' do
    trieNode = TrieNode.new('c')
    trieNode.addChild('a');

    expect(trieNode.hasChild('a')).to be true
    
    trieNode.removeChild('a');

    expect(trieNode.hasChild('a')).to be false
  end

    
  it 'should NOT delete child node if the child node has children' do
    trieNode = TrieNode.new('c')
    trieNode.addChild('a');

    childNode = trieNode.getChild('a')
    childNode.addChild('r');

    
    trieNode.removeChild('a');

    expect(trieNode.hasChild('a')).to eq true
  end

    
  it 'should NOT delete child node if the child node completes a word' do
    trieNode = TrieNode.new('c')
    IS_COMPLETE_WORD = true
    trieNode.addChild('a', IS_COMPLETE_WORD);

    
    trieNode.removeChild('a');

    expect(trieNode.hasChild('a')).to eq true
  end

end
