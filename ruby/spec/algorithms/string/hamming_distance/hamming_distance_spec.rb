    
describe hammingDistance do
  it 'should throw an error when trying to compare the strings of different lengths' do
    const compareStringsOfDifferentLength = () => {

    hammingDistance('a', 'aa');

    };

    
    expect(compareStringsOfDifferentLength).to toThrowError()
  end

    
  it 'should calculate difference between two strings' do
    expect(hammingDistance('a', 'a')).to be 0
    expect(hammingDistance('a', 'b')).to be 1
    expect(hammingDistance('abc', 'add')).to be 2
    expect(hammingDistance('karolin', 'kathrin')).to be 3
    expect(hammingDistance('karolin', 'kerstin')).to be 3
    expect(hammingDistance('1011101', '1001001')).to be 2
    expect(hammingDistance('2173896', '2233796')).to be 3
  end

end
