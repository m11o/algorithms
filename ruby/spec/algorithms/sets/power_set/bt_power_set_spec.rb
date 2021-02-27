    
describe btPowerSet do
  it 'should calculate power set of given set using backtracking approach' do
    expect(btPowerSet([1])).toEqual([

    [],

    [1],

    ]);

    
    expect(btPowerSet([1, 2, 3])).toEqual([

    [],

    [1],

    [1, 2],

    [1, 2, 3],

    [1, 3],

    [2],

    [2, 3],

    [3],

    ]);

  end

end
