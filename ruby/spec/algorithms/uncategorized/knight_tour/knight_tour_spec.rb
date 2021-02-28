    
describe knightTour do
  it 'should not find solution on 3x3 board' do
    moves = knightTour(3)
    
    expect(moves.length).to eq 0
  end

    
  it 'should find one solution to do knight tour on 5x5 board' do
    moves = knightTour(5)
    
    expect(moves.length).to eq 25
    
    expect(moves).toEqual([

    [0, 0],

    [1, 2],

    [2, 0],

    [0, 1],

    [1, 3],

    [3, 4],

    [2, 2],

    [4, 1],

    [3, 3],

    [1, 4],

    [0, 2],

    [1, 0],

    [3, 1],

    [4, 3],

    [2, 4],

    [0, 3],

    [1, 1],

    [3, 0],

    [4, 2],

    [2, 1],

    [4, 0],

    [3, 2],

    [4, 4],

    [2, 3],

    [0, 4],

    ]);

  end

end
