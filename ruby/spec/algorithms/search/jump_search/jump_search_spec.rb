    
describe jumpSearch do
  it 'should search for an element in sorted array' do
    expect(jumpSearch([], 1)).to eq -1
    expect(jumpSearch([1], 2)).to eq -1
    expect(jumpSearch([1], 1)).to eq 0
    expect(jumpSearch([1, 2], 1)).to eq 0
    expect(jumpSearch([1, 2], 1)).to eq 0
    expect(jumpSearch([1, 1, 1], 1)).to eq 0
    expect(jumpSearch([1, 2, 5, 10, 20, 21, 24, 30, 48], 2)).to eq 1
    expect(jumpSearch([1, 2, 5, 10, 20, 21, 24, 30, 48], 0)).to eq -1
    expect(jumpSearch([1, 2, 5, 10, 20, 21, 24, 30, 48], 0)).to eq -1
    expect(jumpSearch([1, 2, 5, 10, 20, 21, 24, 30, 48], 7)).to eq -1
    expect(jumpSearch([1, 2, 5, 10, 20, 21, 24, 30, 48], 5)).to eq 2
    expect(jumpSearch([1, 2, 5, 10, 20, 21, 24, 30, 48], 20)).to eq 4
    expect(jumpSearch([1, 2, 5, 10, 20, 21, 24, 30, 48], 30)).to eq 7
    expect(jumpSearch([1, 2, 5, 10, 20, 21, 24, 30, 48], 48)).to eq 8
  end

    
  it 'should search object in sorted array' do
    const sortedArrayOfObjects = [

    { key: 1, value: 'value1' },

    { key: 2, value: 'value2' },

    { key: 3, value: 'value3' },

    ];

    
    const comparator = (a, b) => {

    if (a.key === b.key) return 0;

    return a.key < b.key ? -1 : 1;

    };

    
    expect(jumpSearch([], { key: 1 }, comparator)).to eq -1
    expect(jumpSearch(sortedArrayOfObjects, { key: 4 }, comparator)).to eq -1
    expect(jumpSearch(sortedArrayOfObjects, { key: 1 }, comparator)).to eq 0
    expect(jumpSearch(sortedArrayOfObjects, { key: 2 }, comparator)).to eq 1
    expect(jumpSearch(sortedArrayOfObjects, { key: 3 }, comparator)).to eq 2
  end

end
