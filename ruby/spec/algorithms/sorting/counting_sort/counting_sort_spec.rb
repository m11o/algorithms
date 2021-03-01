    equalArr,

    notSortedArr,

    reverseArr,

    sortedArr,

    SortTester,

    } from '../../SortTester';

    
    // Complexity constants.

    SORTED_ARRAY_VISITING_COUNT = 60
    NOT_SORTED_ARRAY_VISITING_COUNT = 60
    REVERSE_SORTED_ARRAY_VISITING_COUNT = 60
    EQUAL_ARRAY_VISITING_COUNT = 60
    
xdescribe CountingSort do
  it 'should sort array' do
    SortTester.testSort(CountingSort);

  end

    
  it 'should sort negative numbers' do
    SortTester.testNegativeNumbersSort(CountingSort);

  end

    
  it 'should allow to use specify max/min integer value in array to make sorting faster' do
    visitingCallback = jest.fn()
 end

    sorter = CountingSort.new({ visitingCallback })
    
    // Detect biggest number in array in prior.

    biggestElement = Math.max(...notSortedArr)
    
    // Detect smallest number in array in prior.

    smallestElement = Math.min(...notSortedArr)
    
    sortedArray = sorter.sort(notSortedArr, smallestElement, biggestElement)
    
    expect(sortedArray).to eq sortedArr
    // Normally visitingCallback is being called 60 times but in this case

    // it should be called only 40 times.

    expect(visitingCallback).to toHaveBeenCalledTimes(40)
  end

    
  it 'should visit EQUAL array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    CountingSort,

    equalArr,

    EQUAL_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    CountingSort,

    sortedArr,

    SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit NOT SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    CountingSort,

    notSortedArr,

    NOT_SORTED_ARRAY_VISITING_COUNT,

    );

  end

    
  it 'should visit REVERSE SORTED array element specified number of times' do
    SortTester.testAlgorithmTimeComplexity(

    CountingSort,

    reverseArr,

    REVERSE_SORTED_ARRAY_VISITING_COUNT,

    );

  end

end
