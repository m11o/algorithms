    
describe Matrix do
  it 'should throw when trying to add matrices of invalid shapes' do
    expect(

    () => mtrx.dot([0], [1]),

    ).toThrowError('Invalid matrix format');

    expect(

    () => mtrx.dot([[0]], [1]),

    ).toThrowError('Invalid matrix format');

    expect(

    () => mtrx.dot([[[0]]], [[1]]),

    ).toThrowError('Matrix is not of 2D shape');

    expect(

    () => mtrx.dot([[0]], [[1], [2]]),

    ).toThrowError('Matrices have incompatible shape for multiplication');

  end

    
  it 'should calculate matrices dimensions' do
    expect(mtrx.shape([])).to eq [0]
    
    expect(mtrx.shape([

    [],

    ])).toEqual([1, 0]);

    
    expect(mtrx.shape([

    [0],

    ])).toEqual([1, 1]);

    
    expect(mtrx.shape([

    [0, 0],

    ])).toEqual([1, 2]);

    
    expect(mtrx.shape([

    [0, 0],

    [0, 0],

    ])).toEqual([2, 2]);

    
    expect(mtrx.shape([

    [0, 0, 0],

    [0, 0, 0],

    ])).toEqual([2, 3]);

    
    expect(mtrx.shape([

    [0, 0],

    [0, 0],

    [0, 0],

    ])).toEqual([3, 2]);

    
    expect(mtrx.shape([

    [0, 0, 0],

    [0, 0, 0],

    [0, 0, 0],

    ])).toEqual([3, 3]);

    
    expect(mtrx.shape([

    [0],

    [0],

    [0],

    ])).toEqual([3, 1]);

    
    expect(mtrx.shape([

    [[0], [0], [0]],

    [[0], [0], [0]],

    [[0], [0], [0]],

    ])).toEqual([3, 3, 1]);

    
    expect(mtrx.shape([

    [[0, 0, 0], [0, 0, 0], [0, 0, 0]],

    [[0, 0, 0], [0, 0, 0], [0, 0, 0]],

    [[0, 0, 0], [0, 0, 0], [0, 0, 0]],

    ])).toEqual([3, 3, 3]);

  end

    
  it 'should generate the matrix of zeros' do
    expect(mtrx.zeros([1, 0])).toEqual([

    [],

    ]);

    
    expect(mtrx.zeros([1, 1])).toEqual([

    [0],

    ]);

    
    expect(mtrx.zeros([1, 3])).toEqual([

    [0, 0, 0],

    ]);

    
    expect(mtrx.zeros([3, 3])).toEqual([

    [0, 0, 0],

    [0, 0, 0],

    [0, 0, 0],

    ]);

    
    expect(mtrx.zeros([3, 3, 1])).toEqual([

    [[0], [0], [0]],

    [[0], [0], [0]],

    [[0], [0], [0]],

    ]);

  end

    
  it 'should generate the matrix with custom values' do
    expect(mtrx.generate([1, 0], () => 1)).toEqual([

    [],

    ]);

    
    expect(mtrx.generate([1, 1], () => 1)).toEqual([

    [1],

    ]);

    
    expect(mtrx.generate([1, 3], () => 1)).toEqual([

    [1, 1, 1],

    ]);

    
    expect(mtrx.generate([3, 3], () => 1)).toEqual([

    [1, 1, 1],

    [1, 1, 1],

    [1, 1, 1],

    ]);

    
    expect(mtrx.generate([3, 3, 1], () => 1)).toEqual([

    [[1], [1], [1]],

    [[1], [1], [1]],

    [[1], [1], [1]],

    ]);

  end

    
  it 'should generate a custom matrix based on specific cell indices' do
    const indicesCallback = jest.fn((indices) => {

    return indices[0] * 10 + indices[1];

    end

    m = mtrx.generate([3, 3], indicesCallback)
    
    expect(indicesCallback).to toHaveBeenCalledTimes(3 * 3)
    expect(indicesCallback.mock.calls[0][0]).to eq [0, 0]
    expect(indicesCallback.mock.calls[1][0]).to eq [0, 1]
    expect(indicesCallback.mock.calls[2][0]).to eq [0, 2]
    expect(indicesCallback.mock.calls[3][0]).to eq [1, 0]
    expect(indicesCallback.mock.calls[4][0]).to eq [1, 1]
    expect(indicesCallback.mock.calls[5][0]).to eq [1, 2]
    expect(indicesCallback.mock.calls[6][0]).to eq [2, 0]
    expect(indicesCallback.mock.calls[7][0]).to eq [2, 1]
    expect(indicesCallback.mock.calls[8][0]).to eq [2, 2]
    expect(m).toEqual([

    [0, 1, 2],

    [10, 11, 12],

    [20, 21, 22],

    ]);

  end

    
  it 'should multiply two matrices' do
    let c;

    c = mtrx.dot(

    [

    [1, 2],

    [3, 4],

    ],

    [

    [5, 6],

    [7, 8],

    ],

    );

    expect(mtrx.shape(c)).to eq [2, 2]
    expect(c).toEqual([

    [19, 22],

    [43, 50],

    ]);

    
    c = mtrx.dot(

    [

    [1, 2],

    [3, 4],

    ],

    [

    [5],

    [6],

    ],

    );

    expect(mtrx.shape(c)).to eq [2, 1]
    expect(c).toEqual([

    [17],

    [39],

    ]);

    
    c = mtrx.dot(

    [

    [1, 2, 3],

    [4, 5, 6],

    ],

    [

    [7, 8],

    [9, 10],

    [11, 12],

    ],

    );

    expect(mtrx.shape(c)).to eq [2, 2]
    expect(c).toEqual([

    [58, 64],

    [139, 154],

    ]);

    
    c = mtrx.dot(

    [

    [3, 4, 2],

    ],

    [

    [13, 9, 7, 5],

    [8, 7, 4, 6],

    [6, 4, 0, 3],

    ],

    );

    expect(mtrx.shape(c)).to eq [1, 4]
    expect(c).toEqual([

    [83, 63, 37, 45],

    ]);

  end

    
  it 'should transpose matrices' do
    expect(mtrx.t([[1, 2, 3]])).toEqual([

    [1],

    [2],

    [3],

    ]);

    
    expect(mtrx.t([

    [1],

    [2],

    [3],

    ])).toEqual([

    [1, 2, 3],

    ]);

    
    expect(mtrx.t([

    [1, 2, 3],

    [4, 5, 6],

    ])).toEqual([

    [1, 4],

    [2, 5],

    [3, 6],

    ]);

    
    expect(mtrx.t([

    [1, 2, 3],

    [4, 5, 6],

    [7, 8, 9],

    ])).toEqual([

    [1, 4, 7],

    [2, 5, 8],

    [3, 6, 9],

    ]);

  end

    
  it 'should throw when trying to transpose non 2D matrix' do
    expect(() => {

    mtrx.t([[[1]]]);

    }).toThrowError('Matrix is not of 2D shape');

  end

    
  it 'should add two matrices' do
    expect(mtrx.add([[1]], [[2]])).to eq [[3]]
    
    expect(mtrx.add(

    [[1, 2, 3]],

    [[4, 5, 6]],

    ))

    .toEqual(

    [[5, 7, 9]],

    );

    
    expect(mtrx.add(

    [[1], [2], [3]],

    [[4], [5], [6]],

    ))

    .toEqual(

    [[5], [7], [9]],

    );

    
    expect(mtrx.add(

    [

    [1, 2, 3],

    [4, 5, 6],

    [7, 8, 9],

    ],

    [

    [10, 11, 12],

    [13, 14, 15],

    [16, 17, 18],

    ],

    ))

    .toEqual(

    [

    [11, 13, 15],

    [17, 19, 21],

    [23, 25, 27],

    ],

    );

    
    expect(mtrx.add(

    [

    [[1], [2], [3]],

    [[4], [5], [6]],

    [[7], [8], [9]],

    ],

    [

    [[10], [11], [12]],

    [[13], [14], [15]],

    [[16], [17], [18]],

    ],

    ))

    .toEqual(

    [

    [[11], [13], [15]],

    [[17], [19], [21]],

    [[23], [25], [27]],

    ],

    );

  end

    
  it 'should throw when trying to add matrices of different shape' do
    expect(() => mtrx.add([[0]], [[[0]]])).toThrowError(

    'Matrices have different dimensions',

    );

    
    expect(() => mtrx.add([[0]], [[0, 0]])).toThrowError(

    'Matrices have different shapes',

    );

  end

    
  it 'should do element wise multiplication two matrices' do
    expect(mtrx.mul([[2]], [[3]])).to eq [[6]]
    
    expect(mtrx.mul(

    [[1, 2, 3]],

    [[4, 5, 6]],

    ))

    .toEqual(

    [[4, 10, 18]],

    );

    
    expect(mtrx.mul(

    [[1], [2], [3]],

    [[4], [5], [6]],

    ))

    .toEqual(

    [[4], [10], [18]],

    );

    
    expect(mtrx.mul(

    [

    [1, 2],

    [3, 4],

    ],

    [

    [5, 6],

    [7, 8],

    ],

    ))

    .toEqual(

    [

    [5, 12],

    [21, 32],

    ],

    );

    
    expect(mtrx.mul(

    [

    [[1], [2]],

    [[3], [4]],

    ],

    [

    [[5], [6]],

    [[7], [8]],

    ],

    ))

    .toEqual(

    [

    [[5], [12]],

    [[21], [32]],

    ],

    );

  end

    
  it 'should throw when trying to multiply matrices element-wise of different shape' do
    expect(() => mtrx.mul([[0]], [[[0]]])).toThrowError(

    'Matrices have different dimensions',

    );

    
    expect(() => mtrx.mul([[0]], [[0, 0]])).toThrowError(

    'Matrices have different shapes',

    );

  end

    
  it 'should do element wise subtraction two matrices' do
    expect(mtrx.sub([[3]], [[2]])).to eq [[1]]
    
    expect(mtrx.sub(

    [[10, 12, 14]],

    [[4, 5, 6]],

    ))

    .toEqual(

    [[6, 7, 8]],

    );

    
    expect(mtrx.sub(

    [[[10], [12], [14]]],

    [[[4], [5], [6]]],

    ))

    .toEqual(

    [[[6], [7], [8]]],

    );

    
    expect(mtrx.sub(

    [

    [10, 20],

    [30, 40],

    ],

    [

    [5, 6],

    [7, 8],

    ],

    ))

    .toEqual(

    [

    [5, 14],

    [23, 32],

    ],

    );

    
    expect(mtrx.sub(

    [

    [[10], [20]],

    [[30], [40]],

    ],

    [

    [[5], [6]],

    [[7], [8]],

    ],

    ))

    .toEqual(

    [

    [[5], [14]],

    [[23], [32]],

    ],

    );

  end

    
  it 'should throw when trying to subtract matrices element-wise of different shape' do
    expect(() => mtrx.sub([[0]], [[[0]]])).toThrowError(

    'Matrices have different dimensions',

    );

    
    expect(() => mtrx.sub([[0]], [[0, 0]])).toThrowError(

    'Matrices have different shapes',

    );

  end

end
