    equalArr,

    notSortedArr,

    reverseArr,

    sortedArr,

    SortTester,

    } from '../../SortTester';

    
    // Complexity constants.

    SORTED_ARRAY_VISITING_COUNT = 19
    NOT_SORTED_ARRAY_VISITING_COUNT = 12
    REVERSE_SORTED_ARRAY_VISITING_COUNT = 19
    EQUAL_ARRAY_VISITING_COUNT = 19
    
describe QuickSortInPlace do
  it 'should sort array' do
    SortTester.testSort(QuickSortInPlace);

  end

    
  it 'should sort array with custom comparator' do
    SortTester.testSortWithCustomComparator(QuickSortInPlace);

  end

    
  it 'should sort negative numbers' do
    SortTester.testNegativeNumbersSort(QuickSortInPlace);

  end

    
  it 'should visit EQUAL array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    QuickSortInPlace,

    equalArr,

    EQUAL_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    QuickSortInPlace,

    sortedArr,

    SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit NOT SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    QuickSortInPlace,

    notSortedArr,

    NOT_SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit REVERSE SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    QuickSortInPlace,

    reverseArr,

    REVERSE_SORTED_ARRAY_VISITING_COUNT,

    );

  end

end
