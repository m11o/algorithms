describe Heap do
  it 'should not allow to create instance of the Heap directly' do
    def instantiate_head
      heap = Heap.new
      heap.add 5
    end

    expect { instantiate_head }.to raise_error Exception
  end
end
