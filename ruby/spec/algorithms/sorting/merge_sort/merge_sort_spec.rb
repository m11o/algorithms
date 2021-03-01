    equalArr,

    notSortedArr,

    reverseArr,

    sortedArr,

    SortTester,

    } from '../../SortTester';

    
    // Complexity constants.

    SORTED_ARRAY_VISITING_COUNT = 79
    NOT_SORTED_ARRAY_VISITING_COUNT = 102
    REVERSE_SORTED_ARRAY_VISITING_COUNT = 87
    EQUAL_ARRAY_VISITING_COUNT = 79
    
xdescribe MergeSort do
  it 'should sort array' do
    SortTester.testSort(MergeSort);

  end

    
  it 'should sort array with custom comparator' do
    SortTester.testSortWithCustomComparator(MergeSort);

  end

    
  it 'should do stable sorting' do
    SortTester.testSortStability(MergeSort);

  end

    
  it 'should sort negative numbers' do
    SortTester.testNegativeNumbersSort(MergeSort);

  end

    
  it 'should visit EQUAL array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    MergeSort,

    equalArr,

    EQUAL_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    MergeSort,

    sortedArr,

    SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit NOT SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    MergeSort,

    notSortedArr,

    NOT_SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit REVERSE SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    MergeSort,

    reverseArr,

    REVERSE_SORTED_ARRAY_VISITING_COUNT,

    );

  end

end
