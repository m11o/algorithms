    
describe fibonacciNth do
  it 'should calculate fibonacci correctly' do
    expect(fibonacciNth(1)).to be 1
    expect(fibonacciNth(2)).to be 1
    expect(fibonacciNth(3)).to be 2
    expect(fibonacciNth(4)).to be 3
    expect(fibonacciNth(5)).to be 5
    expect(fibonacciNth(6)).to be 8
    expect(fibonacciNth(7)).to be 13
    expect(fibonacciNth(8)).to be 21
    expect(fibonacciNth(20)).to be 6765
    expect(fibonacciNth(30)).to be 832040
    expect(fibonacciNth(50)).to be 12586269025
    expect(fibonacciNth(70)).to be 190392490709135
    expect(fibonacciNth(71)).to be 308061521170129
    expect(fibonacciNth(72)).to be 498454011879264
    expect(fibonacciNth(73)).to be 806515533049393
    expect(fibonacciNth(74)).to be 1304969544928657
    expect(fibonacciNth(75)).to be 2111485077978050
    expect(fibonacciNth(80)).to be 23416728348467685
    expect(fibonacciNth(90)).to be 2880067194370816120
  end

end
