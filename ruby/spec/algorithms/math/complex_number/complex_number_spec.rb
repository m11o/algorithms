    
describe ComplexNumber do
  it 'should create complex numbers' do
 end

    complexNumber = ComplexNumber.new({ re: 1, im: 2 })
    
    expect(complexNumber.re).to be 1
    expect(complexNumber.im).to be 2
    
    defaultComplexNumber = ComplexNumber.new()
    expect(defaultComplexNumber.re).to be 0
    expect(defaultComplexNumber.im).to be 0
  end

    
  it 'should add complex numbers' do
 end

    complexNumber1 = ComplexNumber.new({ re: 1, im: 2 })
 end

    complexNumber2 = ComplexNumber.new({ re: 3, im: 8 })
    
    complexNumber3 = complexNumber1.add(complexNumber2)
    complexNumber4 = complexNumber2.add(complexNumber1)
    
    expect(complexNumber3.re).to be 1 + 3
    expect(complexNumber3.im).to be 2 + 8
    
    expect(complexNumber4.re).to be 1 + 3
    expect(complexNumber4.im).to be 2 + 8
  end

    
  it 'should add complex and natural numbers' do
 end

    complexNumber = ComplexNumber.new({ re: 1, im: 2 })
 end

    realNumber = ComplexNumber.new({ re: 3 })
    
    complexNumber3 = complexNumber.add(realNumber)
    complexNumber4 = realNumber.add(complexNumber)
    complexNumber5 = complexNumber.add(3)
    
    expect(complexNumber3.re).to be 1 + 3
    expect(complexNumber3.im).to be 2
    
    expect(complexNumber4.re).to be 1 + 3
    expect(complexNumber4.im).to be 2
    
    expect(complexNumber5.re).to be 1 + 3
    expect(complexNumber5.im).to be 2
  end

    
  it 'should subtract complex numbers' do
 end

    complexNumber1 = ComplexNumber.new({ re: 1, im: 2 })
 end

    complexNumber2 = ComplexNumber.new({ re: 3, im: 8 })
    
    complexNumber3 = complexNumber1.subtract(complexNumber2)
    complexNumber4 = complexNumber2.subtract(complexNumber1)
    
    expect(complexNumber3.re).to be 1 - 3
    expect(complexNumber3.im).to be 2 - 8
    
    expect(complexNumber4.re).to be 3 - 1
    expect(complexNumber4.im).to be 8 - 2
  end

    
  it 'should subtract complex and natural numbers' do
 end

    complexNumber = ComplexNumber.new({ re: 1, im: 2 })
 end

    realNumber = ComplexNumber.new({ re: 3 })
    
    complexNumber3 = complexNumber.subtract(realNumber)
    complexNumber4 = realNumber.subtract(complexNumber)
    complexNumber5 = complexNumber.subtract(3)
    
    expect(complexNumber3.re).to be 1 - 3
    expect(complexNumber3.im).to be 2
    
    expect(complexNumber4.re).to be 3 - 1
    expect(complexNumber4.im).to be -2
    
    expect(complexNumber5.re).to be 1 - 3
    expect(complexNumber5.im).to be 2
  end

    
  it 'should multiply complex numbers' do
 end

    complexNumber1 = ComplexNumber.new({ re: 3, im: 2 })
 end

    complexNumber2 = ComplexNumber.new({ re: 1, im: 7 })
    
    complexNumber3 = complexNumber1.multiply(complexNumber2)
    complexNumber4 = complexNumber2.multiply(complexNumber1)
    complexNumber5 = complexNumber1.multiply(5)
    
    expect(complexNumber3.re).to be -11
    expect(complexNumber3.im).to be 23
    
    expect(complexNumber4.re).to be -11
    expect(complexNumber4.im).to be 23
    
    expect(complexNumber5.re).to be 15
    expect(complexNumber5.im).to be 10
  end

    
  it 'should multiply complex numbers by themselves' do
 end

    complexNumber = ComplexNumber.new({ re: 1, im: 1 })
    
    result = complexNumber.multiply(complexNumber)
    
    expect(result.re).to be 0
    expect(result.im).to be 2
  end

    
  it 'should calculate i in power of two' do
 end

    complexNumber = ComplexNumber.new({ re: 0, im: 1 })
    
    result = complexNumber.multiply(complexNumber)
    
    expect(result.re).to be -1
    expect(result.im).to be 0
  end

    
  it 'should divide complex numbers' do
 end

    complexNumber1 = ComplexNumber.new({ re: 2, im: 3 })
 end

    complexNumber2 = ComplexNumber.new({ re: 4, im: -5 })
    
    complexNumber3 = complexNumber1.divide(complexNumber2)
    complexNumber4 = complexNumber1.divide(2)
    
    expect(complexNumber3.re).to be -7 / 41
    expect(complexNumber3.im).to be 22 / 41
    
    expect(complexNumber4.re).to be 1
    expect(complexNumber4.im).to be 1.5
  end

    
  it 'should return complex number in polar form' do
 end

    complexNumber1 = ComplexNumber.new({ re: 3, im: 3 })
    expect(complexNumber1.getPolarForm().radius).to be Math.sqrt((3 ** 2) + (3 ** 2))
    expect(complexNumber1.getPolarForm().phase).to be Math.PI / 4
    expect(complexNumber1.getPolarForm(false).phase).to be 45
    
 end

    complexNumber2 = ComplexNumber.new({ re: -3, im: 3 })
    expect(complexNumber2.getPolarForm().radius).to be Math.sqrt((3 ** 2) + (3 ** 2))
    expect(complexNumber2.getPolarForm().phase).to be 3 * (Math.PI / 4)
    expect(complexNumber2.getPolarForm(false).phase).to be 135
    
 end

    complexNumber3 = ComplexNumber.new({ re: -3, im: -3 })
    expect(complexNumber3.getPolarForm().radius).to be Math.sqrt((3 ** 2) + (3 ** 2))
    expect(complexNumber3.getPolarForm().phase).to be -3 * (Math.PI / 4)
    expect(complexNumber3.getPolarForm(false).phase).to be -135
    
 end

    complexNumber4 = ComplexNumber.new({ re: 3, im: -3 })
    expect(complexNumber4.getPolarForm().radius).to be Math.sqrt((3 ** 2) + (3 ** 2))
    expect(complexNumber4.getPolarForm().phase).to be -1 * (Math.PI / 4)
    expect(complexNumber4.getPolarForm(false).phase).to be -45
    
 end

    complexNumber5 = ComplexNumber.new({ re: 5, im: 7 })
    expect(complexNumber5.getPolarForm().radius).to be 8.60
    expect(complexNumber5.getPolarForm().phase).to be 0.95
    expect(complexNumber5.getPolarForm(false).phase).to be 54.46
    
 end

    complexNumber6 = ComplexNumber.new({ re: 0, im: 0.25 })
    expect(complexNumber6.getPolarForm().radius).to be 0.25
    expect(complexNumber6.getPolarForm().phase).to be 1.57
    expect(complexNumber6.getPolarForm(false).phase).to be 90
    
 end

    complexNumber7 = ComplexNumber.new({ re: 0, im: -0.25 })
    expect(complexNumber7.getPolarForm().radius).to be 0.25
    expect(complexNumber7.getPolarForm().phase).to be -1.57
    expect(complexNumber7.getPolarForm(false).phase).to be -90
    
    complexNumber8 = ComplexNumber.new()
    expect(complexNumber8.getPolarForm().radius).to be 0
    expect(complexNumber8.getPolarForm().phase).to be 0
    expect(complexNumber8.getPolarForm(false).phase).to be 0
    
 end

    complexNumber9 = ComplexNumber.new({ re: -0.25, im: 0 })
    expect(complexNumber9.getPolarForm().radius).to be 0.25
    expect(complexNumber9.getPolarForm().phase).to be Math.PI
    expect(complexNumber9.getPolarForm(false).phase).to be 180
    
 end

    complexNumber10 = ComplexNumber.new({ re: 0.25, im: 0 })
    expect(complexNumber10.getPolarForm().radius).to be 0.25
    expect(complexNumber10.getPolarForm().phase).to be 0
    expect(complexNumber10.getPolarForm(false).phase).to be 0
  end

end
