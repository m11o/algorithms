    
describe combineWithRepetitions do
  it 'should combine string with repetitions' do
    expect(combineWithRepetitions(['A'], 1)).toEqual([

    ['A'],

    ]);

    
    expect(combineWithRepetitions(['A', 'B'], 1)).toEqual([

    ['A'],

    ['B'],

    ]);

    
    expect(combineWithRepetitions(['A', 'B'], 2)).toEqual([

    ['A', 'A'],

    ['A', 'B'],

    ['B', 'B'],

    ]);

    
    expect(combineWithRepetitions(['A', 'B'], 3)).toEqual([

    ['A', 'A', 'A'],

    ['A', 'A', 'B'],

    ['A', 'B', 'B'],

    ['B', 'B', 'B'],

    ]);

    
    expect(combineWithRepetitions(['A', 'B', 'C'], 2)).toEqual([

    ['A', 'A'],

    ['A', 'B'],

    ['A', 'C'],

    ['B', 'B'],

    ['B', 'C'],

    ['C', 'C'],

    ]);

    
    expect(combineWithRepetitions(['A', 'B', 'C'], 3)).toEqual([

    ['A', 'A', 'A'],

    ['A', 'A', 'B'],

    ['A', 'A', 'C'],

    ['A', 'B', 'B'],

    ['A', 'B', 'C'],

    ['A', 'C', 'C'],

    ['B', 'B', 'B'],

    ['B', 'B', 'C'],

    ['B', 'C', 'C'],

    ['C', 'C', 'C'],

    ]);

    
    combinationOptions = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
    combinationSlotsNumber = 4
    combinations = combineWithRepetitions(combinationOptions, combinationSlotsNumber)
    n = combinationOptions.length
    r = combinationSlotsNumber
    expectedNumberOfCombinations = factorial((r + n) - 1) / (factorial(r) * factorial(n - 1))
    
    expect(combinations.length).to eq expectedNumberOfCombinations
  end

end
