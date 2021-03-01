require_relative '../linked_list/linked_list'

class Queue
  attr_reader :linked_list

  def initialize
    @linked_list = LinkedList.new
  end

  def peek
    return if linked_list.head.nil?

    linked_list.head.value
  end

  def enqueue(value)
    linked_list.append value
  end

  def to_s(&block)
    linked_list.to_s(&block)
  end

  def dequeue
    return if linked_list.head.nil?

    linked_list.delete_head.value
  end

  def empty?
    linked_list.empty?
  end
end
