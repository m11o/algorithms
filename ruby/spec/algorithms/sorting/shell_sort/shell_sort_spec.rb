    equalArr,

    notSortedArr,

    reverseArr,

    sortedArr,

    SortTester,

    } from '../../SortTester';

    
    // Complexity constants.

    SORTED_ARRAY_VISITING_COUNT = 320
    NOT_SORTED_ARRAY_VISITING_COUNT = 320
    REVERSE_SORTED_ARRAY_VISITING_COUNT = 320
    EQUAL_ARRAY_VISITING_COUNT = 320
    
xdescribe ShellSort do
  it 'should sort array' do
    SortTester.testSort(ShellSort);

  end

    
  it 'should sort array with custom comparator' do
    SortTester.testSortWithCustomComparator(ShellSort);

  end

    
  it 'should sort negative numbers' do
    SortTester.testNegativeNumbersSort(ShellSort);

  end

    
  it 'should visit EQUAL array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    ShellSort,

    equalArr,

    EQUAL_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    ShellSort,

    sortedArr,

    SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit NOT SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    ShellSort,

    notSortedArr,

    NOT_SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit REVERSE SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    ShellSort,

    reverseArr,

    REVERSE_SORTED_ARRAY_VISITING_COUNT,

    );

  end

end
