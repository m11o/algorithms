    
describe pascalTriangle do
  it 'should calculate Pascal Triangle coefficients for specific line number' do
    expect(pascalTriangle(0)).to eq [1]
    expect(pascalTriangle(1)).to eq [1, 1]
    expect(pascalTriangle(2)).to eq [1, 2, 1]
    expect(pascalTriangle(3)).to eq [1, 3, 3, 1]
    expect(pascalTriangle(4)).to eq [1, 4, 6, 4, 1]
    expect(pascalTriangle(5)).to eq [1, 5, 10, 10, 5, 1]
    expect(pascalTriangle(6)).to eq [1, 6, 15, 20, 15, 6, 1]
    expect(pascalTriangle(7)).to eq [1, 7, 21, 35, 35, 21, 7, 1]
  end

end
