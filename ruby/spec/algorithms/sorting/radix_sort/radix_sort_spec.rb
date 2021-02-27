    
    // Complexity constants.

    ARRAY_OF_STRINGS_VISIT_COUNT = 24
    ARRAY_OF_INTEGERS_VISIT_COUNT = 77
describe RadixSort do
  it 'should sort array' do
    SortTester.testSort(RadixSort);

  end

    
  it 'should visit array of strings n (number of strings) x m (length of longest element) times' do
    SortTester.testAlgorithmTimeComplexity(

    RadixSort,

    ['zzz', 'bb', 'a', 'rr', 'rrb', 'rrba'],

    ARRAY_OF_STRINGS_VISIT_COUNT,

    );

  end

    
  it 'should visit array of integers n (number of elements) x m (length of longest integer) times' do
    SortTester.testAlgorithmTimeComplexity(

    RadixSort,

    [3, 1, 75, 32, 884, 523, 4343456, 232, 123, 656, 343],

    ARRAY_OF_INTEGERS_VISIT_COUNT,

    );

  end

end
