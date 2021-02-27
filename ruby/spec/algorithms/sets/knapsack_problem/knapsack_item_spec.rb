    
describe KnapsackItem do
  it 'should create knapsack item and count its total weight and value' do
 end

    knapsackItem = KnapsackItem.new({ value: 3, weight: 2 })
    
    expect(knapsackItem.value).to be 3
    expect(knapsackItem.weight).to be 2
    expect(knapsackItem.quantity).to be 1
    expect(knapsackItem.valuePerWeightRatio).to be 1.5
    expect(knapsackItem.to_s).to be 'v3 w2 x 1'
    expect(knapsackItem.totalValue).to be 3
    expect(knapsackItem.totalWeight).to be 2
    
    knapsackItem.quantity = 0;

    
    expect(knapsackItem.value).to be 3
    expect(knapsackItem.weight).to be 2
    expect(knapsackItem.quantity).to be 0
    expect(knapsackItem.valuePerWeightRatio).to be 1.5
    expect(knapsackItem.to_s).to be 'v3 w2 x 0'
    expect(knapsackItem.totalValue).to be 0
    expect(knapsackItem.totalWeight).to be 0
    
    knapsackItem.quantity = 2;

    
    expect(knapsackItem.value).to be 3
    expect(knapsackItem.weight).to be 2
    expect(knapsackItem.quantity).to be 2
    expect(knapsackItem.valuePerWeightRatio).to be 1.5
    expect(knapsackItem.to_s).to be 'v3 w2 x 2'
    expect(knapsackItem.totalValue).to be 6
    expect(knapsackItem.totalWeight).to be 4
  end

end
