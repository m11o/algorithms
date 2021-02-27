    
describe Knapsack do
  it 'should solve 0/1 knapsack problem' do
    const possibleKnapsackItems = [

    new KnapsackItem({ value: 1, weight: 1 }),

    new KnapsackItem({ value: 4, weight: 3 }),

    new KnapsackItem({ value: 5, weight: 4 }),

    new KnapsackItem({ value: 7, weight: 5 }),

    ];

    
    maxKnapsackWeight = 7
    
    knapsack = Knapsack.new(possibleKnapsackItems, maxKnapsackWeight)
    
    knapsack.solveZeroOneKnapsackProblem();

    
    expect(knapsack.totalValue).to be 9
    expect(knapsack.totalWeight).to be 7
    expect(knapsack.selectedItems.length).to be 2
    expect(knapsack.selectedItems[0].to_s).to be 'v5 w4 x 1'
    expect(knapsack.selectedItems[1].to_s).to be 'v4 w3 x 1'
  end

    
  it 'should solve 0/1 knapsack problem regardless of items order' do
    const possibleKnapsackItems = [

    new KnapsackItem({ value: 5, weight: 4 }),

    new KnapsackItem({ value: 1, weight: 1 }),

    new KnapsackItem({ value: 7, weight: 5 }),

    new KnapsackItem({ value: 4, weight: 3 }),

    ];

    
    maxKnapsackWeight = 7
    
    knapsack = Knapsack.new(possibleKnapsackItems, maxKnapsackWeight)
    
    knapsack.solveZeroOneKnapsackProblem();

    
    expect(knapsack.totalValue).to be 9
    expect(knapsack.totalWeight).to be 7
    expect(knapsack.selectedItems.length).to be 2
    expect(knapsack.selectedItems[0].to_s).to be 'v5 w4 x 1'
    expect(knapsack.selectedItems[1].to_s).to be 'v4 w3 x 1'
  end

    
  it 'should solve 0/1 knapsack problem with impossible items set' do
    const possibleKnapsackItems = [

    new KnapsackItem({ value: 5, weight: 40 }),

    new KnapsackItem({ value: 1, weight: 10 }),

    new KnapsackItem({ value: 7, weight: 50 }),

    new KnapsackItem({ value: 4, weight: 30 }),

    ];

    
    maxKnapsackWeight = 7
    
    knapsack = Knapsack.new(possibleKnapsackItems, maxKnapsackWeight)
    
    knapsack.solveZeroOneKnapsackProblem();

    
    expect(knapsack.totalValue).to be 0
    expect(knapsack.totalWeight).to be 0
    expect(knapsack.selectedItems.length).to be 0
  end

    
  it 'should solve 0/1 knapsack problem with all equal weights' do
    const possibleKnapsackItems = [

    new KnapsackItem({ value: 5, weight: 1 }),

    new KnapsackItem({ value: 1, weight: 1 }),

    new KnapsackItem({ value: 7, weight: 1 }),

    new KnapsackItem({ value: 4, weight: 1 }),

    new KnapsackItem({ value: 4, weight: 1 }),

    new KnapsackItem({ value: 4, weight: 1 }),

    ];

    
    maxKnapsackWeight = 3
    
    knapsack = Knapsack.new(possibleKnapsackItems, maxKnapsackWeight)
    
    knapsack.solveZeroOneKnapsackProblem();

    
    expect(knapsack.totalValue).to be 16
    expect(knapsack.totalWeight).to be 3
    expect(knapsack.selectedItems.length).to be 3
    expect(knapsack.selectedItems[0].to_s).to be 'v4 w1 x 1'
    expect(knapsack.selectedItems[1].to_s).to be 'v5 w1 x 1'
    expect(knapsack.selectedItems[2].to_s).to be 'v7 w1 x 1'
  end

    
  it 'should solve unbound knapsack problem' do
    const possibleKnapsackItems = [

    new KnapsackItem({ value: 84, weight: 7 }), // v/w ratio is 12

    new KnapsackItem({ value: 5, weight: 2 }), // v/w ratio is 2.5

    new KnapsackItem({ value: 12, weight: 3 }), // v/w ratio is 4

    new KnapsackItem({ value: 10, weight: 1 }), // v/w ratio is 10

    new KnapsackItem({ value: 20, weight: 2 }), // v/w ratio is 10

    ];

    
    maxKnapsackWeight = 15
    
    knapsack = Knapsack.new(possibleKnapsackItems, maxKnapsackWeight)
    
    knapsack.solveUnboundedKnapsackProblem();

    
    expect(knapsack.totalValue).to be 84 + 20 + 12 + 10 + 5
    expect(knapsack.totalWeight).to be 15
    expect(knapsack.selectedItems.length).to be 5
    expect(knapsack.selectedItems[0].to_s).to be 'v84 w7 x 1'
    expect(knapsack.selectedItems[1].to_s).to be 'v20 w2 x 1'
    expect(knapsack.selectedItems[2].to_s).to be 'v10 w1 x 1'
    expect(knapsack.selectedItems[3].to_s).to be 'v12 w3 x 1'
    expect(knapsack.selectedItems[4].to_s).to be 'v5 w2 x 1'
  end

    
  it 'should solve unbound knapsack problem with items in stock' do
    const possibleKnapsackItems = [

    new KnapsackItem({ value: 84, weight: 7, itemsInStock: 3 }), // v/w ratio is 12

    new KnapsackItem({ value: 5, weight: 2, itemsInStock: 2 }), // v/w ratio is 2.5

    new KnapsackItem({ value: 12, weight: 3, itemsInStock: 1 }), // v/w ratio is 4

    new KnapsackItem({ value: 10, weight: 1, itemsInStock: 6 }), // v/w ratio is 10

    new KnapsackItem({ value: 20, weight: 2, itemsInStock: 8 }), // v/w ratio is 10

    ];

    
    maxKnapsackWeight = 17
    
    knapsack = Knapsack.new(possibleKnapsackItems, maxKnapsackWeight)
    
    knapsack.solveUnboundedKnapsackProblem();

    
    expect(knapsack.totalValue).to be 84 + 84 + 20 + 10
    expect(knapsack.totalWeight).to be 17
    expect(knapsack.selectedItems.length).to be 3
    expect(knapsack.selectedItems[0].to_s).to be 'v84 w7 x 2'
    expect(knapsack.selectedItems[1].to_s).to be 'v20 w2 x 1'
    expect(knapsack.selectedItems[2].to_s).to be 'v10 w1 x 1'
  end

    
  it 'should solve unbound knapsack problem with items in stock and max weight more than sum of all items' do
    const possibleKnapsackItems = [

    new KnapsackItem({ value: 84, weight: 7, itemsInStock: 3 }), // v/w ratio is 12

    new KnapsackItem({ value: 5, weight: 2, itemsInStock: 2 }), // v/w ratio is 2.5

    new KnapsackItem({ value: 12, weight: 3, itemsInStock: 1 }), // v/w ratio is 4

    new KnapsackItem({ value: 10, weight: 1, itemsInStock: 6 }), // v/w ratio is 10

    new KnapsackItem({ value: 20, weight: 2, itemsInStock: 8 }), // v/w ratio is 10

    ];

    
    maxKnapsackWeight = 60
    
    knapsack = Knapsack.new(possibleKnapsackItems, maxKnapsackWeight)
    
    knapsack.solveUnboundedKnapsackProblem();

    
    expect(knapsack.totalValue).to be (3 * 84) + (2 * 5) + (1 * 12) + (6 * 10) + (8 * 20)
    expect(knapsack.totalWeight).to be (3 * 7) + (2 * 2) + (1 * 3) + (6 * 1) + (8 * 2)
    expect(knapsack.selectedItems.length).to be 5
    expect(knapsack.selectedItems[0].to_s).to be 'v84 w7 x 3'
    expect(knapsack.selectedItems[1].to_s).to be 'v20 w2 x 8'
    expect(knapsack.selectedItems[2].to_s).to be 'v10 w1 x 6'
    expect(knapsack.selectedItems[3].to_s).to be 'v12 w3 x 1'
    expect(knapsack.selectedItems[4].to_s).to be 'v5 w2 x 2'
  end

end
