    
describe permutateWithoutRepetitions do
  it 'should permutate string' do
    permutations1 = permutateWithoutRepetitions(['A'])
    expect(permutations1).toEqual([

    ['A'],

    ]);

    
    permutations2 = permutateWithoutRepetitions(['A', 'B'])
    expect(permutations2.length).to be 2
    expect(permutations2).toEqual([

    ['A', 'B'],

    ['B', 'A'],

    ]);

    
    permutations6 = permutateWithoutRepetitions(['A', 'A'])
    expect(permutations6.length).to be 2
    expect(permutations6).toEqual([

    ['A', 'A'],

    ['A', 'A'],

    ]);

    
    permutations3 = permutateWithoutRepetitions(['A', 'B', 'C'])
    expect(permutations3.length).to be factorial(3)
    expect(permutations3).toEqual([

    ['A', 'B', 'C'],

    ['B', 'A', 'C'],

    ['B', 'C', 'A'],

    ['A', 'C', 'B'],

    ['C', 'A', 'B'],

    ['C', 'B', 'A'],

    ]);

    
    permutations4 = permutateWithoutRepetitions(['A', 'B', 'C', 'D'])
    expect(permutations4.length).to be factorial(4)
    expect(permutations4).toEqual([

    ['A', 'B', 'C', 'D'],

    ['B', 'A', 'C', 'D'],

    ['B', 'C', 'A', 'D'],

    ['B', 'C', 'D', 'A'],

    ['A', 'C', 'B', 'D'],

    ['C', 'A', 'B', 'D'],

    ['C', 'B', 'A', 'D'],

    ['C', 'B', 'D', 'A'],

    ['A', 'C', 'D', 'B'],

    ['C', 'A', 'D', 'B'],

    ['C', 'D', 'A', 'B'],

    ['C', 'D', 'B', 'A'],

    ['A', 'B', 'D', 'C'],

    ['B', 'A', 'D', 'C'],

    ['B', 'D', 'A', 'C'],

    ['B', 'D', 'C', 'A'],

    ['A', 'D', 'B', 'C'],

    ['D', 'A', 'B', 'C'],

    ['D', 'B', 'A', 'C'],

    ['D', 'B', 'C', 'A'],

    ['A', 'D', 'C', 'B'],

    ['D', 'A', 'C', 'B'],

    ['D', 'C', 'A', 'B'],

    ['D', 'C', 'B', 'A'],

    ]);

    
    permutations5 = permutateWithoutRepetitions(['A', 'B', 'C', 'D', 'E', 'F'])
    expect(permutations5.length).to be factorial(6)
  end

end
