xdescribe BloomFilter do
  PEOPLE = ['Bruce Wayne', 'Clark Kent', 'Barry Allen'].freeze

  let(:bloom_filter) { BloomFilter.new }

  it 'should create a new filter store with the appropriate methods' do
    # store = bloom_filter.create_store(18)
    # expect(typeof store.getValue).to eq 'function'
    # expect(typeof store.setValue).to eq 'function'
  end


  it 'should hash deterministically with all 3 hash functions' do
    str1 = 'apple'

    expect(bloom_filter.hash1(str1)).to eq bloom_filter.hash1(str1)
    expect(bloom_filter.hash2(str1)).to eq bloom_filter.hash2(str1)
    expect(bloom_filter.hash3(str1)).to eq bloom_filter.hash3(str1)

    expect(bloom_filter.hash1(str1)).to eq 14
    expect(bloom_filter.hash2(str1)).to eq 43
    expect(bloom_filter.hash3(str1)).to eq 10

    str2 = 'orange'

    expect(bloom_filter.hash1(str2)).to eq bloom_filter.hash1(str2)
    expect(bloom_filter.hash2(str2)).to eq bloom_filter.hash2(str2)
    expect(bloom_filter.hash3(str2)).to eq bloom_filter.hash3(str2)

    expect(bloom_filter.hash1(str2)).to eq 0
    expect(bloom_filter.hash2(str2)).to eq 61
    expect(bloom_filter.hash3(str2)).to eq 10
  end


  it 'should create an array with 3 hash values' do
    expect(bloom_filter.hash_values('abc').length).to eq 3
    expect(bloom_filter.hash_values('abc')).to eq [66, 63, 54]
  end


  it 'should insert strings correctly and return true when checking for inserted values' do
    PEOPLE.each { |person| bloom_filter.insert(person) }

    expect(bloom_filter.include?('Bruce Wayne')).to eq true
    expect(bloom_filter.include?('Clark Kent')).to eq true
    expect(bloom_filter.include?('Barry Allen')).to eq true

    expect(bloom_filter.include?('Tony Stark')).to eq false
  end

end
