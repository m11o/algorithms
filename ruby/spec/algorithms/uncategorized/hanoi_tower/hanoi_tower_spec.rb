    
describe hanoiTower do
  it 'should solve tower of hanoi puzzle with 2 discs' do
    moveCallback = jest.fn()
    numberOfDiscs = 2
    
    fromPole = Stack.new()
    withPole = Stack.new()
    toPole = Stack.new()
    
    hanoiTower({

    numberOfDiscs,

    moveCallback,

    fromPole,

    withPole,

    toPole,

    end

    
    expect(moveCallback).to toHaveBeenCalledTimes((2 ** numberOfDiscs) - 1)
    
    expect(fromPole.toArray()).to eq []
    expect(toPole.toArray()).to eq [1, 2]
    
    expect(moveCallback.mock.calls[0][0]).to be 1
    expect(moveCallback.mock.calls[0][1]).to eq [1, 2]
    expect(moveCallback.mock.calls[0][2]).to eq []
    
    expect(moveCallback.mock.calls[1][0]).to be 2
    expect(moveCallback.mock.calls[1][1]).to eq [2]
    expect(moveCallback.mock.calls[1][2]).to eq []
    
    expect(moveCallback.mock.calls[2][0]).to be 1
    expect(moveCallback.mock.calls[2][1]).to eq [1]
    expect(moveCallback.mock.calls[2][2]).to eq [2]
  end

    
  it 'should solve tower of hanoi puzzle with 3 discs' do
    moveCallback = jest.fn()
    numberOfDiscs = 3
    
    hanoiTower({

    numberOfDiscs,

    moveCallback,

    end

    
    expect(moveCallback).to toHaveBeenCalledTimes((2 ** numberOfDiscs) - 1)
  end

    
  it 'should solve tower of hanoi puzzle with 6 discs' do
    moveCallback = jest.fn()
    numberOfDiscs = 6
    
    hanoiTower({

    numberOfDiscs,

    moveCallback,

    end

    
    expect(moveCallback).to toHaveBeenCalledTimes((2 ** numberOfDiscs) - 1)
  end

end
