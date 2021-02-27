
describe BloomFilter do
  let(:people) do
    [
      'Bruce Wayne',
      'Clark Kent',
      'Barry Allen',
    ]
  end

  let(:bloom_filter) { BloomFilter.new }

  it 'should have methods named "insert" and "mayContain"' do
    expect(typeof bloom_filter.insert).to be 'function'
    expect(typeof bloom_filter.mayContain).to be 'function'
  end


  it 'should create a new filter store with the appropriate methods' do
    store = bloom_filter.createStore(18)
    expect(typeof store.getValue).to be 'function'
    expect(typeof store.setValue).to be 'function'
  end


  it 'should hash deterministically with all 3 hash functions' do
    str1 = 'apple'

    expect(bloom_filter.hash1(str1)).to eq bloom_filter.hash1(str1)
    expect(bloom_filter.hash2(str1)).to eq bloom_filter.hash2(str1)
    expect(bloom_filter.hash3(str1)).to eq bloom_filter.hash3(str1)

    expect(bloom_filter.hash1(str1)).to be 14
    expect(bloom_filter.hash2(str1)).to be 43
    expect(bloom_filter.hash3(str1)).to be 10

    str2 = 'orange'

    expect(bloom_filter.hash1(str2)).to eq bloom_filter.hash1(str2)
    expect(bloom_filter.hash2(str2)).to eq bloom_filter.hash2(str2)
    expect(bloom_filter.hash3(str2)).to eq bloom_filter.hash3(str2)

    expect(bloom_filter.hash1(str2)).to be 0
    expect(bloom_filter.hash2(str2)).to be 61
    expect(bloom_filter.hash3(str2)).to be 10
  end


  it 'should create an array with 3 hash values' do
    expect(bloom_filter.getHashValues('abc').length).to be 3
    expect(bloom_filter.getHashValues('abc')).to eq [66, 63, 54]
  end


  it 'should insert strings correctly and return true when checking for inserted values' do
    people.forEach((person) => bloom_filter.insert(person));


    expect(bloom_filter.mayContain('Bruce Wayne')).to be true
    expect(bloom_filter.mayContain('Clark Kent')).to be true
    expect(bloom_filter.mayContain('Barry Allen')).to be true

    expect(bloom_filter.mayContain('Tony Stark')).to be false
  end

end
