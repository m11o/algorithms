    equalArr,

    notSortedArr,

    reverseArr,

    sortedArr,

    SortTester,

    } from '../../SortTester';

    
    // Complexity constants.

    SORTED_ARRAY_VISITING_COUNT = 19
    NOT_SORTED_ARRAY_VISITING_COUNT = 100
    REVERSE_SORTED_ARRAY_VISITING_COUNT = 209
    EQUAL_ARRAY_VISITING_COUNT = 19
    
describe InsertionSort do
  it 'should sort array' do
    SortTester.testSort(InsertionSort);

  end

    
  it 'should sort array with custom comparator' do
    SortTester.testSortWithCustomComparator(InsertionSort);

  end

    
  it 'should do stable sorting' do
    SortTester.testSortStability(InsertionSort);

  end

    
  it 'should sort negative numbers' do
    SortTester.testNegativeNumbersSort(InsertionSort);

  end

    
  it 'should visit EQUAL array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    InsertionSort,

    equalArr,

    EQUAL_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    InsertionSort,

    sortedArr,

    SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit NOT SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    InsertionSort,

    notSortedArr,

    NOT_SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit REVERSE SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    InsertionSort,

    reverseArr,

    REVERSE_SORTED_ARRAY_VISITING_COUNT,

    );

  end

end
