class Heap
  def initialize
    raise NotImplementedError if self.class == Heap

    @container = []
  end

  def left_child_index(parent_index)
    2 * parent_index + 1
  end

  def right_child_index(parent_index)
    2 * parent_index + 2
  end

  def parent_index(child_index)
    calculated_index = ((child_index - 1) / 2).floor
    return if calculated_index.negative?

    calculated_index
  end

  def parent?(child_index)
    parent_index = parent_index(child_index)
    return false if parent_index.nil?

    parent_index >= 0
  end

  def left_child?(parent_index)
    !left_child(parent_index).nil?
  end

  def right_child?(parent_index)
    !right_child(parent_index).nil?
  end

  def left_child(parent_index)
    @container[left_child_index(parent_index)]
  end

  def right_child(parent_index)
    @container[right_child_index(parent_index)]
  end

  def parent(child_index)
    parent_index = parent_index(child_index)
    return if parent_index.nil?

    @container[parent_index]
  end

  def swap(index1, index2)
    tmp = @container[index2]
    @container[index2] = @container[index1]
    @container[index1] = tmp
  end

  def peek
    return if @container.empty?

    @container.first
  end

  def poll
    return if @container.empty?
    return @container.shift if @container.size == 1

    item = @container.first
    @container[0] = @container.pop
    heapify_down

    item
  end

  def add(item)
    @container.push item
    heapify_up
    self
  end

  def remove(item)
    number_of_items_to_remove = find(item).size
    return self if number_of_items_to_remove.zero?

    number_of_items_to_remove.times do
      will_remove_index = find(item).pop
      @container.pop and next if will_remove_index == @container.size - 1

      @container[will_remove_index] = @container.pop
      parent_item = parent will_remove_index

      if left_child?(will_remove_index) && (parent_item.nil? || pair_is_in_collect_order(parent_item, @container[will_remove_index]))
        heapify_down will_remove_index
      else
        heapify_up will_remove_index
      end
    end

    self
  end

  def find(item)
    @container.map.with_index do |heap_item, index|
      next if heap_item != item

      index
    end.compact
  end

  def empty?
    @container.empty?
  end

  def to_s
    @container.join(',')
  end

  def heapify_down(current_index = 0)
    while left_child?(current_index)
      next_index = if right_child?(current_index) && pair_is_in_collect_order(right_child(current_index), left_child(current_index))
                     right_child_index(current_index)
                   else
                     left_child_index(current_index)
                   end

      break if pair_is_in_collect_order(@container[current_index], @container[next_index])

      swap current_index, next_index
      current_index = next_index
    end
  end

  def heapify_up(current_index = nil)
    current_index ||= @container.size - 1

    while parent?(current_index) && pair_is_in_collect_order(@container[current_index], parent(current_index))
      next_index = parent_index current_index
      swap current_index, next_index
      current_index = next_index
    end
  end

  def pair_is_in_collect_order(_first_element, _second_element)
    raise NotImplementedError
  end
end
