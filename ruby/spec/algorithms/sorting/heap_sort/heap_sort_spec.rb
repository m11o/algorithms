    equalArr,

    notSortedArr,

    reverseArr,

    sortedArr,

    SortTester,

    } from '../../SortTester';

    
    // Complexity constants.

    // These numbers don't take into account up/dow heapifying of the heap.

    // Thus these numbers are higher in reality.

    SORTED_ARRAY_VISITING_COUNT = 40
    NOT_SORTED_ARRAY_VISITING_COUNT = 40
    REVERSE_SORTED_ARRAY_VISITING_COUNT = 40
    EQUAL_ARRAY_VISITING_COUNT = 40
    
describe HeapSort do
  it 'should sort array' do
    SortTester.testSort(HeapSort);

  end

    
  it 'should sort array with custom comparator' do
    SortTester.testSortWithCustomComparator(HeapSort);

  end

    
  it 'should sort negative numbers' do
    SortTester.testNegativeNumbersSort(HeapSort);

  end

    
  it 'should visit EQUAL array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    HeapSort,

    equalArr,

    EQUAL_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    HeapSort,

    sortedArr,

    SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit NOT SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    HeapSort,

    notSortedArr,

    NOT_SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit REVERSE SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    HeapSort,

    reverseArr,

    REVERSE_SORTED_ARRAY_VISITING_COUNT,

    );

  end

end
