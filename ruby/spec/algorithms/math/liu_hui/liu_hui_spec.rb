    
describe liuHui do
  it 'should calculate π based on 12-gon' do
    expect(liuHui(1)).to eq 3
  end

    
  it 'should calculate π based on 24-gon' do
    expect(liuHui(2)).to eq 3.105828541230249
  end

    
  it 'should calculate π based on 6144-gon' do
    expect(liuHui(10)).to eq 3.1415921059992717
  end

    
  it 'should calculate π based on 201326592-gon' do
    expect(liuHui(25)).to eq 3.141592653589793
  end

end
