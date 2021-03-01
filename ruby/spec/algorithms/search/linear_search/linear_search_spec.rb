    
xdescribe linearSearch do
  it 'should search all numbers in array' do
    array = [1, 2, 4, 6, 2]
    
    expect(linearSearch(array, 10)).to eq []
    expect(linearSearch(array, 1)).to eq [0]
    expect(linearSearch(array, 2)).to eq [1, 4]
  end

    
  it 'should search all strings in array' do
    array = ['a', 'b', 'a']
    
    expect(linearSearch(array, 'c')).to eq []
    expect(linearSearch(array, 'b')).to eq [1]
    expect(linearSearch(array, 'a')).to eq [0, 2]
  end

    
  it 'should search through objects as well' do
    const comparatorCallback = (a, b) => {

    if (a.key === b.key) {

    return 0;

    }

    
    a.key < = b.key ? -1 : 1
    };

    
    const array = [

    { key: 5 },

    { key: 6 },

    { key: 7 },

    { key: 6 },

    ];

    
    expect(linearSearch(array, { key: 10 }, comparatorCallback)).to eq []
    expect(linearSearch(array, { key: 5 }, comparatorCallback)).to eq [0]
    expect(linearSearch(array, { key: 6 }, comparatorCallback)).to eq [1, 3]
  end

end
