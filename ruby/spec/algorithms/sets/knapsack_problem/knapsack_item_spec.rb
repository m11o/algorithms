    
xdescribe KnapsackItem do
  it 'should create knapsack item and count its total weight and value' do
 end

    knapsackItem = KnapsackItem.new({ value: 3, weight: 2 })
    
    expect(knapsackItem.value).to eq 3
    expect(knapsackItem.weight).to eq 2
    expect(knapsackItem.quantity).to eq 1
    expect(knapsackItem.valuePerWeightRatio).to eq 1.5
    expect(knapsackItem.to_s).to eq 'v3 w2 x 1'
    expect(knapsackItem.totalValue).to eq 3
    expect(knapsackItem.totalWeight).to eq 2
    
    knapsackItem.quantity = 0;

    
    expect(knapsackItem.value).to eq 3
    expect(knapsackItem.weight).to eq 2
    expect(knapsackItem.quantity).to eq 0
    expect(knapsackItem.valuePerWeightRatio).to eq 1.5
    expect(knapsackItem.to_s).to eq 'v3 w2 x 0'
    expect(knapsackItem.totalValue).to eq 0
    expect(knapsackItem.totalWeight).to eq 0
    
    knapsackItem.quantity = 2;

    
    expect(knapsackItem.value).to eq 3
    expect(knapsackItem.weight).to eq 2
    expect(knapsackItem.quantity).to eq 2
    expect(knapsackItem.valuePerWeightRatio).to eq 1.5
    expect(knapsackItem.to_s).to eq 'v3 w2 x 2'
    expect(knapsackItem.totalValue).to eq 6
    expect(knapsackItem.totalWeight).to eq 4
  end

end
