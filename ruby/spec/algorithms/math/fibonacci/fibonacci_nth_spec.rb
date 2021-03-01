    
xdescribe fibonacciNth do
  it 'should calculate fibonacci correctly' do
    expect(fibonacciNth(1)).to eq 1
    expect(fibonacciNth(2)).to eq 1
    expect(fibonacciNth(3)).to eq 2
    expect(fibonacciNth(4)).to eq 3
    expect(fibonacciNth(5)).to eq 5
    expect(fibonacciNth(6)).to eq 8
    expect(fibonacciNth(7)).to eq 13
    expect(fibonacciNth(8)).to eq 21
    expect(fibonacciNth(20)).to eq 6765
    expect(fibonacciNth(30)).to eq 832040
    expect(fibonacciNth(50)).to eq 12586269025
    expect(fibonacciNth(70)).to eq 190392490709135
    expect(fibonacciNth(71)).to eq 308061521170129
    expect(fibonacciNth(72)).to eq 498454011879264
    expect(fibonacciNth(73)).to eq 806515533049393
    expect(fibonacciNth(74)).to eq 1304969544928657
    expect(fibonacciNth(75)).to eq 2111485077978050
    expect(fibonacciNth(80)).to eq 23416728348467685
    expect(fibonacciNth(90)).to eq 2880067194370816120
  end

end
