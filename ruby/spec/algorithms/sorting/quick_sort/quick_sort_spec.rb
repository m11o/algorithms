    equalArr,

    notSortedArr,

    reverseArr,

    sortedArr,

    SortTester,

    } from '../../SortTester';

    
    // Complexity constants.

    SORTED_ARRAY_VISITING_COUNT = 190
    NOT_SORTED_ARRAY_VISITING_COUNT = 62
    REVERSE_SORTED_ARRAY_VISITING_COUNT = 190
    EQUAL_ARRAY_VISITING_COUNT = 19
    
xdescribe QuickSort do
  it 'should sort array' do
    SortTester.testSort(QuickSort);

  end

    
  it 'should sort array with custom comparator' do
    SortTester.testSortWithCustomComparator(QuickSort);

  end

    
  it 'should do stable sorting' do
    SortTester.testSortStability(QuickSort);

  end

    
  it 'should sort negative numbers' do
    SortTester.testNegativeNumbersSort(QuickSort);

  end

    
  it 'should visit EQUAL array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    QuickSort,

    equalArr,

    EQUAL_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    QuickSort,

    sortedArr,

    SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit NOT SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    QuickSort,

    notSortedArr,

    NOT_SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit REVERSE SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    QuickSort,

    reverseArr,

    REVERSE_SORTED_ARRAY_VISITING_COUNT,

    );

  end

end
