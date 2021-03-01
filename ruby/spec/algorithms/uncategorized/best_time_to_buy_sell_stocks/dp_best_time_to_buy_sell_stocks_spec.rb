    
xdescribe dpBestTimeToBuySellStocks do
  it 'should find the best time to buy and sell stocks' do
    let visit;

    
    expect(dpBestTimeToBuySellStocks([1, 5])).to eq 4
    
    visit = jest.fn();

    expect(dpBestTimeToBuySellStocks([1], visit)).to eq 0
    expect(visit).to toHaveBeenCalledTimes(1)
    
    visit = jest.fn();

    expect(dpBestTimeToBuySellStocks([1, 5], visit)).to eq 4
    expect(visit).to toHaveBeenCalledTimes(2)
    
    visit = jest.fn();

    expect(dpBestTimeToBuySellStocks([5, 1], visit)).to eq 0
    expect(visit).to toHaveBeenCalledTimes(2)
    
    visit = jest.fn();

    expect(dpBestTimeToBuySellStocks([1, 5, 10], visit)).to eq 9
    expect(visit).to toHaveBeenCalledTimes(3)
    
    visit = jest.fn();

    expect(dpBestTimeToBuySellStocks([10, 1, 5, 20, 15, 21], visit)).to eq 25
    expect(visit).to toHaveBeenCalledTimes(6)
    
    visit = jest.fn();

    expect(dpBestTimeToBuySellStocks([7, 1, 5, 3, 6, 4], visit)).to eq 7
    expect(visit).to toHaveBeenCalledTimes(6)
    
    visit = jest.fn();

    expect(dpBestTimeToBuySellStocks([1, 2, 3, 4, 5], visit)).to eq 4
    expect(visit).to toHaveBeenCalledTimes(5)
    
    visit = jest.fn();

    expect(dpBestTimeToBuySellStocks([7, 6, 4, 3, 1], visit)).to eq 0
    expect(visit).to toHaveBeenCalledTimes(5)
    
    visit = jest.fn();

    expect(dpBestTimeToBuySellStocks(

    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20],

    visit,

    )).toEqual(19);

    expect(visit).to toHaveBeenCalledTimes(20)
  end

end
