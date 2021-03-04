require_relative '../heap/min_heap'

class PriorityQueue < MinHeap
  def initialize
    super
    @priorities = {}
  end

  def add(value, priority)
    @priorities[value] = priority
    super value
    self
  end

  def change_priority(value, priority)
    remove value
    add value, priority
    self
  end

  def remove(item)
    super item
    @priorities.delete item
    self
  end

  def value?(value)
    !find(value).empty?
  end

  private

  def pair_is_in_collect_order(first_element, second_element)
    @priorities[first_element] < @priorities[second_element]
  end
end
