    
xdescribe HashTable do
  it 'should create hash table of certain size' do
    defaultHashTable = HashTable.new()
    expect(defaultHashTable.buckets.length).to eq 32
    
    biggerHashTable = HashTable.new(64)
    expect(biggerHashTable.buckets.length).to eq 64
  end

    
  it 'should generate proper hash for specified keys' do
    hashTable = HashTable.new()
    
    expect(hashTable.hash('a')).to eq 1
    expect(hashTable.hash('b')).to eq 2
    expect(hashTable.hash('abc')).to eq 6
  end

    
  it 'should set, read and delete data with collisions' do
    hashTable = HashTable.new(3)
    
    expect(hashTable.hash('a')).to eq 1
    expect(hashTable.hash('b')).to eq 2
    expect(hashTable.hash('c')).to eq 0
    expect(hashTable.hash('d')).to eq 1
    
    hashTable.set('a', 'sky-old');

    hashTable.set('a', 'sky');

    hashTable.set('b', 'sea');

    hashTable.set('c', 'earth');

    hashTable.set('d', 'ocean');

    
    expect(hashTable.has('x')).to eq false
    expect(hashTable.has('b')).to eq true
    expect(hashTable.has('c')).to eq true
    
    stringifier = (value) => `${value.key}:${value.value}`
    
    expect(hashTable.buckets[0].toString(stringifier)).to eq 'c:earth'
    expect(hashTable.buckets[1].toString(stringifier)).to eq 'a:sky,d:ocean'
    expect(hashTable.buckets[2].toString(stringifier)).to eq 'b:sea'
    
    expect(hashTable.get('a')).to eq 'sky'
    expect(hashTable.get('d')).to eq 'ocean'
    expect(hashTable.get('x')).not.toBeDefined();

    
    hashTable.delete('a');

    
    expect(hashTable.delete('not-existing')).to eq nil
    
    expect(hashTable.get('a')).not.toBeDefined();

    expect(hashTable.get('d')).to eq 'ocean'
    
    hashTable.set('d', 'ocean-new');

    expect(hashTable.get('d')).to eq 'ocean-new'
  end

    
  it 'should be possible to add objects to hash table' do
    hashTable = HashTable.new()
    
 end

    
    object = hashTable.get('objectKey')
    expect(object.prop1).to eq 'a'
    expect(object.prop2).to eq 'b'
  end

    
  it 'should track actual keys' do
    hashTable = HashTable.new(3)
    
    hashTable.set('a', 'sky-old');

    hashTable.set('a', 'sky');

    hashTable.set('b', 'sea');

    hashTable.set('c', 'earth');

    hashTable.set('d', 'ocean');

    
    expect(hashTable.getKeys()).to eq ['a', 'b', 'c', 'd']
    expect(hashTable.has('a')).to eq true
    expect(hashTable.has('x')).to eq false
    
    hashTable.delete('a');

    
    expect(hashTable.has('a')).to eq false
    expect(hashTable.has('b')).to eq true
    expect(hashTable.has('x')).to eq false
  end

    
  it 'should get all the values' do
    hashTable = HashTable.new(3)
    
    hashTable.set('a', 'alpha');

    hashTable.set('b', 'beta');

    hashTable.set('c', 'gamma');

    
    expect(hashTable.getValues()).to eq ['gamma', 'alpha', 'beta']
  end

    
  it 'should get all the values from empty hash table' do
    hashTable = HashTable.new()
    expect(hashTable.getValues()).to eq []
  end

    
  it 'should get all the values in case of hash collision' do
    hashTable = HashTable.new(3)
    
    // Keys `ab` and `ba` in current implementation should result in one hash (one bucket).

    // We need to make sure that several items from one bucket will be serialized.

    hashTable.set('ab', 'one');

    hashTable.set('ba', 'two');

    
    hashTable.set('ac', 'three');

    
    expect(hashTable.getValues()).to eq ['one', 'two', 'three']
  end

end
