    
describe dqBestTimeToBuySellStocks do
  it 'should find the best time to buy and sell stocks' do
    let visit;

    
    expect(dqBestTimeToBuySellStocks([1, 5])).to eq 4
    
    visit = jest.fn();

    expect(dqBestTimeToBuySellStocks([1], visit)).to eq 0
    expect(visit).to toHaveBeenCalledTimes(3)
    
    visit = jest.fn();

    expect(dqBestTimeToBuySellStocks([1, 5], visit)).to eq 4
    expect(visit).to toHaveBeenCalledTimes(7)
    
    visit = jest.fn();

    expect(dqBestTimeToBuySellStocks([5, 1], visit)).to eq 0
    expect(visit).to toHaveBeenCalledTimes(7)
    
    visit = jest.fn();

    expect(dqBestTimeToBuySellStocks([1, 5, 10], visit)).to eq 9
    expect(visit).to toHaveBeenCalledTimes(15)
    
    visit = jest.fn();

    expect(dqBestTimeToBuySellStocks([10, 1, 5, 20, 15, 21], visit)).to eq 25
    expect(visit).to toHaveBeenCalledTimes(127)
    
    visit = jest.fn();

    expect(dqBestTimeToBuySellStocks([7, 1, 5, 3, 6, 4], visit)).to eq 7
    expect(visit).to toHaveBeenCalledTimes(127)
    
    visit = jest.fn();

    expect(dqBestTimeToBuySellStocks([1, 2, 3, 4, 5], visit)).to eq 4
    expect(visit).to toHaveBeenCalledTimes(63)
    
    visit = jest.fn();

    expect(dqBestTimeToBuySellStocks([7, 6, 4, 3, 1], visit)).to eq 0
    expect(visit).to toHaveBeenCalledTimes(63)
    
    visit = jest.fn();

    expect(dqBestTimeToBuySellStocks(

    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20],

    visit,

    )).toEqual(19);

    expect(visit).to toHaveBeenCalledTimes(2097151)
  end

end
