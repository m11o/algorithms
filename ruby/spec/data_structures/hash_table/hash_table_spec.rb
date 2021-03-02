
describe HashTable do
  it 'should create hash table of certain size' do
    default_hash_table = HashTable.new
    expect(default_hash_table.buckets.length).to eq 32

    bigger_hash_table = HashTable.new 64
    expect(bigger_hash_table.buckets.length).to eq 64
  end


  it 'should generate proper hash for specified keys' do
    hash_table = HashTable.new

    expect(hash_table.hash('a')).to eq 1
    expect(hash_table.hash('b')).to eq 2
    expect(hash_table.hash('abc')).to eq 6
  end


  it 'should set, read and delete data with collisions' do
    hash_table = HashTable.new 3

    expect(hash_table.hash('a')).to eq 1
    expect(hash_table.hash('b')).to eq 2
    expect(hash_table.hash('c')).to eq 0
    expect(hash_table.hash('d')).to eq 1

    hash_table.set('a', 'sky-old')
    hash_table.set('a', 'sky')
    hash_table.set('b', 'sea')
    hash_table.set('c', 'earth')
    hash_table.set('d', 'ocean')

    expect(hash_table.key?('x')).to eq false
    expect(hash_table.key?('b')).to eq true
    expect(hash_table.key?('c')).to eq true

    stringifier = lambda { |value| "#{value[:key]}:#{value[:value]}" }

    expect(hash_table.buckets[0].to_s(&stringifier)).to eq 'c:earth'
    expect(hash_table.buckets[1].to_s(&stringifier)).to eq 'a:sky,d:ocean'
    expect(hash_table.buckets[2].to_s(&stringifier)).to eq 'b:sea'

    expect(hash_table.get('a')).to eq 'sky'
    expect(hash_table.get('d')).to eq 'ocean'
    expect(hash_table.get('x')).to eq nil

    hash_table.delete('a')

    expect(hash_table.delete('not-existing')).to eq nil
    expect(hash_table.get('a')).to eq nil
    expect(hash_table.get('d')).to eq 'ocean'

    hash_table.set('d', 'ocean-new')

    expect(hash_table.get('d')).to eq 'ocean-new'
  end

  it 'should be possible to add objects to hash table' do
    hash_table = HashTable.new
    hash_table.set('objectKey', { prop1: 'a', prop2: 'b' })

    object = hash_table.get('objectKey')
    expect(object[:prop1]).to eq 'a'
    expect(object[:prop2]).to eq 'b'
  end


  it 'should track actual keys' do
    hash_table = HashTable.new 3

    hash_table.set('a', 'sky-old')
    hash_table.set('a', 'sky')
    hash_table.set('b', 'sea')
    hash_table.set('c', 'earth')
    hash_table.set('d', 'ocean')

    expect(hash_table.keys).to eq %w[a b c d]
    expect(hash_table.key?('a')).to eq true
    expect(hash_table.key?('x')).to eq false

    hash_table.delete('a')

    expect(hash_table.key?('a')).to eq false
    expect(hash_table.key?('b')).to eq true
    expect(hash_table.key?('x')).to eq false
  end


  it 'should get all the values' do
    hash_table = HashTable.new 3

    hash_table.set('a', 'alpha')
    hash_table.set('b', 'beta')
    hash_table.set('c', 'gamma')

    expect(hash_table.values).to match_array %w[gamma alpha beta]
  end


  it 'should get all the values from empty hash table' do
    hash_table = HashTable.new
    expect(hash_table.values).to eq []
  end


  it 'should get all the values in case of hash collision' do
    hash_table = HashTable.new 3

    # Keys `ab` and `ba` in current implementation should result in one hash (one bucket).
    # We need to make sure that several items from one bucket will be serialized.
    hash_table.set('ab', 'one')
    hash_table.set('ba', 'two')
    hash_table.set('ac', 'three')

    expect(hash_table.values).to eq %w[one two three]
  end
end
