    
describe combineWithoutRepetitions do
  it 'should combine string without repetitions' do
    expect(combineWithoutRepetitions(['A', 'B'], 3)).to eq []
    
    expect(combineWithoutRepetitions(['A', 'B'], 1)).toEqual([

    ['A'],

    ['B'],

    ]);

    
    expect(combineWithoutRepetitions(['A'], 1)).toEqual([

    ['A'],

    ]);

    
    expect(combineWithoutRepetitions(['A', 'B'], 2)).toEqual([

    ['A', 'B'],

    ]);

    
    expect(combineWithoutRepetitions(['A', 'B', 'C'], 2)).toEqual([

    ['A', 'B'],

    ['A', 'C'],

    ['B', 'C'],

    ]);

    
    expect(combineWithoutRepetitions(['A', 'B', 'C'], 3)).toEqual([

    ['A', 'B', 'C'],

    ]);

    
    expect(combineWithoutRepetitions(['A', 'B', 'C', 'D'], 3)).toEqual([

    ['A', 'B', 'C'],

    ['A', 'B', 'D'],

    ['A', 'C', 'D'],

    ['B', 'C', 'D'],

    ]);

    
    expect(combineWithoutRepetitions(['A', 'B', 'C', 'D', 'E'], 3)).toEqual([

    ['A', 'B', 'C'],

    ['A', 'B', 'D'],

    ['A', 'B', 'E'],

    ['A', 'C', 'D'],

    ['A', 'C', 'E'],

    ['A', 'D', 'E'],

    ['B', 'C', 'D'],

    ['B', 'C', 'E'],

    ['B', 'D', 'E'],

    ['C', 'D', 'E'],

    ]);

    
    combinationOptions = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
    combinationSlotsNumber = 4
    combinations = combineWithoutRepetitions(combinationOptions, combinationSlotsNumber)
    n = combinationOptions.length
    r = combinationSlotsNumber
    expectedNumberOfCombinations = factorial(n) / (factorial(r) * factorial(n - r))
    
    expect(combinations.length).to eq expectedNumberOfCombinations
    
    // This one is just to see one of the way of Pascal's triangle application.

    expect(combinations.length).to eq pascalTriangle(n)[r]
  end

end
