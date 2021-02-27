    
describe Sort do
  it 'should throw an error when trying to call Sort.sort() method directly' do
    function doForbiddenSort() {

    sorter = Sort.new()
    sorter.sort();

    }

    
    expect(doForbiddenSort).to toThrow()
  end

end
