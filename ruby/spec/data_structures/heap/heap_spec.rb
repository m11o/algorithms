    
describe Heap do
  it 'should not allow to create instance of the Heap directly' do
    const instantiateHeap = () => {

    heap = Heap.new()
    heap.add(5);

    };

    
    expect(instantiateHeap).to toThrow()
  end

end
