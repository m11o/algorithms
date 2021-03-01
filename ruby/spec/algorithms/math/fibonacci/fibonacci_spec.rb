    
xdescribe fibonacci do
  it 'should calculate fibonacci correctly' do
    expect(fibonacci(1)).to eq [1]
    expect(fibonacci(2)).to eq [1, 1]
    expect(fibonacci(3)).to eq [1, 1, 2]
    expect(fibonacci(4)).to eq [1, 1, 2, 3]
    expect(fibonacci(5)).to eq [1, 1, 2, 3, 5]
    expect(fibonacci(6)).to eq [1, 1, 2, 3, 5, 8]
    expect(fibonacci(7)).to eq [1, 1, 2, 3, 5, 8, 13]
    expect(fibonacci(8)).to eq [1, 1, 2, 3, 5, 8, 13, 21]
    expect(fibonacci(9)).to eq [1, 1, 2, 3, 5, 8, 13, 21, 34]
    expect(fibonacci(10)).to eq [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
  end

end
