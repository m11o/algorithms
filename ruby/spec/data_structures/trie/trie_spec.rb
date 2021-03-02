xdescribe Trie do
  let(:trie) { Trie.new }

  it 'should create trie' do
    expect(trie.head.to_s).to eq '*'
  end

  it 'should add words to trie' do
    trie.add_word('cat')

    expect(trie.head.to_s).to eq '*:c'
    expect(trie.head.child('c')).to eq 'c:a'

    trie.add_word('car')

    expect(trie.head.to_s).to eq '*:c'
    expect(trie.head.child('c')).to eq 'c:a'
    expect(trie.head.child('c').child('a')).to eq 'a:t,r'
    expect(trie.head.child('c').child('a').child('t')).to eq 't*'
  end

  it 'should delete words from trie' do
    trie.add_word('carpet')
    trie.add_word('car')
    trie.add_word('cat')
    trie.add_word('cart')

    expect(trie.exist_word?('carpet')).to eq true
    expect(trie.exist_word?('car')).to eq true
    expect(trie.exist_word?('cart')).to eq true
    expect(trie.exist_word?('cat')).to eq true

    # Try to delete not-existing word first.

    trie.delete_word('carpool')

    expect(trie.exist_word?('carpet')).to eq true
    expect(trie.exist_word?('car')).to eq true
    expect(trie.exist_word?('cart')).to eq true
    expect(trie.exist_word?('cat')).to eq true

    trie.delete_word('carpet')

    expect(trie.exist_word?('carpet')).to eq false
    expect(trie.exist_word?('car')).to eq true
    expect(trie.exist_word?('cart')).to eq true
    expect(trie.exist_word?('cat')).to eq true

    trie.delete_word('cat')

    expect(trie.exist_word?('car')).to eq true
    expect(trie.exist_word?('cart')).to eq true
    expect(trie.exist_word?('cat')).to eq false

    trie.delete_word('car')

    expect(trie.exist_word?('car')).to eq false
    expect(trie.exist_word?('cart')).to eq true

    trie.delete_word('cart')

    expect(trie.exist_word?('car')).to eq false
    expect(trie.exist_word?('cart')).to eq false
  end

  it 'should suggests next characters' do
    trie.add_word('cat')
    trie.add_word('cats')
    trie.add_word('car')
    trie.add_word('caption')

    expect(trie.suggest_next_characters('ca')).to match_array %w[t r p]
    expect(trie.suggest_next_characters('cat')).to match_array %w[s]
    expect(trie.suggest_next_characters('cab')).to eq nil
  end

  it 'should check if word exists' do
    trie.add_word('cat')
    trie.add_word('cats')
    trie.add_word('carpet')
    trie.add_word('car')
    trie.add_word('caption')

    expect(trie.exist_word?('cat')).to eq true
    expect(trie.exist_word?('cats')).to eq true
    expect(trie.exist_word?('carpet')).to eq true
    expect(trie.exist_word?('car')).to eq true
    expect(trie.exist_word?('cap')).to eq false
    expect(trie.exist_word?('call')).to eq false
  end
end
