    
describe QueenPosition do
  it 'should store queen position on chessboard' do
    position1 = QueenPosition.new(0, 0)
    position2 = QueenPosition.new(2, 1)
    
    expect(position2.columnIndex).to eq 1
    expect(position2.rowIndex).to eq 2
    expect(position1.leftDiagonal).to eq 0
    expect(position1.rightDiagonal).to eq 0
    expect(position2.leftDiagonal).to eq 1
    expect(position2.rightDiagonal).to eq 3
    expect(position2.to_s).to eq '2,1'
  end

end
