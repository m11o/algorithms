class MinHeap < Heap
  def pair_is_in_collect_order(first_element, second_element)
    first_element <= second_element
  end
end
