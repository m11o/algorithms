    
xdescribe Comparator do
  it 'should compare with default comparator function' do
    comparator = Comparator.new()
    
    expect(comparator.equal(0, 0)).to eq true
    expect(comparator.equal(0, 1)).to eq false
    expect(comparator.equal('a', 'a')).to eq true
    expect(comparator.lessThan(1, 2)).to eq true
    expect(comparator.lessThan(-1, 2)).to eq true
    expect(comparator.lessThan('a', 'b')).to eq true
    expect(comparator.lessThan('a', 'ab')).to eq true
    expect(comparator.lessThan(10, 2)).to eq false
    expect(comparator.lessThanOrEqual(10, 2)).to eq false
    expect(comparator.lessThanOrEqual(1, 1)).to eq true
    expect(comparator.lessThanOrEqual(0, 0)).to eq true
    expect(comparator.greaterThan(0, 0)).to eq false
    expect(comparator.greaterThan(10, 0)).to eq true
    expect(comparator.greaterThanOrEqual(10, 0)).to eq true
    expect(comparator.greaterThanOrEqual(10, 10)).to eq true
    expect(comparator.greaterThanOrEqual(0, 10)).to eq false
  end

    
  it 'should compare with custom comparator function' do
    comparator = Comparator.new((a, b)
    if (a.length === b.length) {

    return 0;

    }

    
    return a.length < b.length ? -1 : 1;

    end

    
    expect(comparator.equal('a', 'b')).to eq true
    expect(comparator.equal('a', '')).to eq false
    expect(comparator.lessThan('b', 'aa')).to eq true
    expect(comparator.greaterThanOrEqual('a', 'aa')).to eq false
    expect(comparator.greaterThanOrEqual('aa', 'a')).to eq true
    expect(comparator.greaterThanOrEqual('a', 'a')).to eq true
    
    comparator.reverse();

    
    expect(comparator.equal('a', 'b')).to eq true
    expect(comparator.equal('a', '')).to eq false
    expect(comparator.lessThan('b', 'aa')).to eq false
    expect(comparator.greaterThanOrEqual('a', 'aa')).to eq true
    expect(comparator.greaterThanOrEqual('aa', 'a')).to eq false
    expect(comparator.greaterThanOrEqual('a', 'a')).to eq true
  end

end
