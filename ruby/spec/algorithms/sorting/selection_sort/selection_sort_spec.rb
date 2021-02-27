    equalArr,

    notSortedArr,

    reverseArr,

    sortedArr,

    SortTester,

    } from '../../SortTester';

    
    // Complexity constants.

    SORTED_ARRAY_VISITING_COUNT = 209
    NOT_SORTED_ARRAY_VISITING_COUNT = 209
    REVERSE_SORTED_ARRAY_VISITING_COUNT = 209
    EQUAL_ARRAY_VISITING_COUNT = 209
    
describe SelectionSort do
  it 'should sort array' do
    SortTester.testSort(SelectionSort);

  end

    
  it 'should sort array with custom comparator' do
    SortTester.testSortWithCustomComparator(SelectionSort);

  end

    
  it 'should sort negative numbers' do
    SortTester.testNegativeNumbersSort(SelectionSort);

  end

    
  it 'should visit EQUAL array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    SelectionSort,

    equalArr,

    EQUAL_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    SelectionSort,

    sortedArr,

    SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit NOT SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    SelectionSort,

    notSortedArr,

    NOT_SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit REVERSE SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    SelectionSort,

    reverseArr,

    REVERSE_SORTED_ARRAY_VISITING_COUNT,

    );

  end

end
