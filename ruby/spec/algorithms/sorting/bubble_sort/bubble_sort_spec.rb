    equalArr,

    notSortedArr,

    reverseArr,

    sortedArr,

    SortTester,

    } from '../../SortTester';

    
    // Complexity constants.

    SORTED_ARRAY_VISITING_COUNT = 20
    NOT_SORTED_ARRAY_VISITING_COUNT = 189
    REVERSE_SORTED_ARRAY_VISITING_COUNT = 209
    EQUAL_ARRAY_VISITING_COUNT = 20
    
xdescribe BubbleSort do
  it 'should sort array' do
    SortTester.testSort(BubbleSort);

  end

    
  it 'should sort array with custom comparator' do
    SortTester.testSortWithCustomComparator(BubbleSort);

  end

    
  it 'should do stable sorting' do
    SortTester.testSortStability(BubbleSort);

  end

    
  it 'should sort negative numbers' do
    SortTester.testNegativeNumbersSort(BubbleSort);

  end

    
  it 'should visit EQUAL array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    BubbleSort,

    equalArr,

    EQUAL_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    BubbleSort,

    sortedArr,

    SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit NOT SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    BubbleSort,

    notSortedArr,

    NOT_SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit REVERSE SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    BubbleSort,

    reverseArr,

    REVERSE_SORTED_ARRAY_VISITING_COUNT,

    );

  end

end
