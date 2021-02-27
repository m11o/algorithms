    
describe pascalTriangleRecursive do
  it 'should calculate Pascal Triangle coefficients for specific line number' do
    expect(pascalTriangleRecursive(0)).to eq [1]
    expect(pascalTriangleRecursive(1)).to eq [1, 1]
    expect(pascalTriangleRecursive(2)).to eq [1, 2, 1]
    expect(pascalTriangleRecursive(3)).to eq [1, 3, 3, 1]
    expect(pascalTriangleRecursive(4)).to eq [1, 4, 6, 4, 1]
    expect(pascalTriangleRecursive(5)).to eq [1, 5, 10, 10, 5, 1]
    expect(pascalTriangleRecursive(6)).to eq [1, 6, 15, 20, 15, 6, 1]
    expect(pascalTriangleRecursive(7)).to eq [1, 7, 21, 35, 35, 21, 7, 1]
  end

end
