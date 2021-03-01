    
xdescribe BloomFilter do
    let bloomFilter;

    const people = [

    'Bruce Wayne',

    'Clark Kent',

    'Barry Allen',

    ];

    
    beforeEach(() => {

    bloomFilter = new BloomFilter();

  end

    
  it 'should have methods named "insert" and "mayContain"' do
    expect(typeof bloomFilter.insert).to eq 'function'
    expect(typeof bloomFilter.mayContain).to eq 'function'
  end

    
  it 'should create a new filter store with the appropriate methods' do
    store = bloomFilter.createStore(18)
    expect(typeof store.getValue).to eq 'function'
    expect(typeof store.setValue).to eq 'function'
  end

    
  it 'should hash deterministically with all 3 hash functions' do
    str1 = 'apple'
    
    expect(bloomFilter.hash1(str1)).to eq bloomFilter.hash1(str1)
    expect(bloomFilter.hash2(str1)).to eq bloomFilter.hash2(str1)
    expect(bloomFilter.hash3(str1)).to eq bloomFilter.hash3(str1)
    
    expect(bloomFilter.hash1(str1)).to eq 14
    expect(bloomFilter.hash2(str1)).to eq 43
    expect(bloomFilter.hash3(str1)).to eq 10
    
    str2 = 'orange'
    
    expect(bloomFilter.hash1(str2)).to eq bloomFilter.hash1(str2)
    expect(bloomFilter.hash2(str2)).to eq bloomFilter.hash2(str2)
    expect(bloomFilter.hash3(str2)).to eq bloomFilter.hash3(str2)
    
    expect(bloomFilter.hash1(str2)).to eq 0
    expect(bloomFilter.hash2(str2)).to eq 61
    expect(bloomFilter.hash3(str2)).to eq 10
  end

    
  it 'should create an array with 3 hash values' do
    expect(bloomFilter.getHashValues('abc').length).to eq 3
    expect(bloomFilter.getHashValues('abc')).to eq [66, 63, 54]
  end

    
  it 'should insert strings correctly and return true when checking for inserted values' do
    people.forEach((person) => bloomFilter.insert(person));

    
    expect(bloomFilter.mayContain('Bruce Wayne')).to eq true
    expect(bloomFilter.mayContain('Clark Kent')).to eq true
    expect(bloomFilter.mayContain('Barry Allen')).to eq true
    
    expect(bloomFilter.mayContain('Tony Stark')).to eq false
  end

end
