require_relative '../linked_list/linked_list'

class Stack
  attr_reader :linked_list

  def initialize
    @linked_list = LinkedList.new
  end

  def push(value)
    linked_list.prepend value
  end

  def pop
    return if linked_list.head.nil?

    linked_list.delete_head.value
  end

  def peek
    return if linked_list.head.nil?

    linked_list.head.value
  end

  def to_s(&block)
    linked_list.to_s(&block)
  end

  def to_a
    linked_list.to_a
  end

  def empty?
    linked_list.empty?
  end
end
