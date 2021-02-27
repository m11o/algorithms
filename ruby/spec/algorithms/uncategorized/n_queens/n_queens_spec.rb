    
describe nQueens do
  it 'should not hae solution for 3 queens' do
    solutions = nQueens(3)
    expect(solutions.length).to be 0
  end

    
  it 'should solve n-queens problem for 4 queens' do
    solutions = nQueens(4)
    expect(solutions.length).to be 2
    
    // First solution.

    expect(solutions[0][0].to_s).to be '0,1'
    expect(solutions[0][1].to_s).to be '1,3'
    expect(solutions[0][2].to_s).to be '2,0'
    expect(solutions[0][3].to_s).to be '3,2'
    
    // Second solution (mirrored).

    expect(solutions[1][0].to_s).to be '0,2'
    expect(solutions[1][1].to_s).to be '1,0'
    expect(solutions[1][2].to_s).to be '2,3'
    expect(solutions[1][3].to_s).to be '3,1'
  end

    
  it 'should solve n-queens problem for 6 queens' do
    solutions = nQueens(6)
    expect(solutions.length).to be 4
    
    // First solution.

    expect(solutions[0][0].to_s).to be '0,1'
    expect(solutions[0][1].to_s).to be '1,3'
    expect(solutions[0][2].to_s).to be '2,5'
    expect(solutions[0][3].to_s).to be '3,0'
    expect(solutions[0][4].to_s).to be '4,2'
    expect(solutions[0][5].to_s).to be '5,4'
  end

end
