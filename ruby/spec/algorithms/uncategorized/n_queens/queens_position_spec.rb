    
describe QueenPosition do
  it 'should store queen position on chessboard' do
    position1 = QueenPosition.new(0, 0)
    position2 = QueenPosition.new(2, 1)
    
    expect(position2.columnIndex).to be 1
    expect(position2.rowIndex).to be 2
    expect(position1.leftDiagonal).to be 0
    expect(position1.rightDiagonal).to be 0
    expect(position2.leftDiagonal).to be 1
    expect(position2.rightDiagonal).to be 3
    expect(position2.to_s).to be '2,1'
  end

end
