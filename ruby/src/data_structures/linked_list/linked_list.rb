require_relative 'linked_list_node'

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = LinkedListNode.new value

    init_insertion node and return self if head.nil?

    @tail.next = node
    @tail = node
    self
  end

  def prepend(value)
    node = LinkedListNode.new value, @head
    @head = node

    @tail = node if tail.nil?

    self
  end

  def delete(value)
    return if head.nil?

    deleted_node = nil

    while !head.nil? && head.value == value
      deleted_node = head
      @head = head.next
    end

    node = head
    unless node.nil?
      while node.next
        if node.next.value == value
          deleted_node = node.next
          node.next = node.next.next
        else
          node = node.next
        end
      end
    end

    if tail.value == value
      deleted_node = tail
      @tail = node
    end

    deleted_node
  end

  def shift
    return if head.nil?

    deleted_node = head
    if head.next
      @head = deleted_node.next
    else
      init_insertion nil
    end

    deleted_node
  end
  alias delete_head shift

  def pop
    return if tail.nil?

    deleted_node = tail

    if head == tail
      init_insertion nil
      return deleted_node
    end

    node = head
    while node.next
      if node.next.next
        node = node.next
      else
        node.next = nil
      end
    end

    @tail = node
    deleted_node
  end
  alias delete_tail pop

  def find(value = nil, &block)
    return if head.nil?

    return head if head == tail && (_find head, value, &block)

    node = head
    while node
      return node if _find node, value, &block

      node = node.next
    end
  end

  def from_array(array)
    array.each { |value| append(value) } and self
  end

  def reverse!
    current_node = head
    prev_node = nil

    while current_node
      next_node = current_node.next

      current_node.next = prev_node

      prev_node = current_node
      current_node = next_node
    end

    @tail = head
    @head = prev_node
  end

  def to_s(&block)
    to_a.map { |value| block_given? ? block.call(value) : value.to_s }.join(',')
  end

  def to_a
    node = head
    values = []
    while node
      values << node.value
      node = node.next
    end
    values
  end

  def empty?
    head.nil? && tail.nil?
  end

  private

  def init_insertion(node)
    @head = @tail = node
  end

  def _find(node, value, &block)
    return block.call(node.value) if block_given?

    node.value == value
  end
end
