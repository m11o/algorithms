require_relative '../linked_list/linked_list'
require_relative 'doubly_linked_list_node'

class DoublyLinkedList < LinkedList
  def append(value)
    node = DoublyLinkedListNode.new value, nil, tail

    init_insertion node and return self if head.nil?

    tail.next = node
    @tail = node
    self
  end

  def prepend(value)
    node = DoublyLinkedListNode.new value, head

    init_insertion node and return self if head.nil?

    head.previous = node
    @head = node
    self
  end

  def from_array(array)
    array.each do |value|
      node = DoublyLinkedListNode.new value
      append node
    end
    self
  end

  def delete(value)
    return if head.nil?

    deleted_node = nil
    node = head

    # head部分に削除する値が連続している場合に、headを複数回みるために、最初からループを回す
    while node
      if node.value == value
        deleted_node = node

        if head.value == value
          if head == tail
            init_insertion nil
            node = nil
            next
          end

          @head = head.next
          head.previous = nil
        elsif tail.value == value
          @tail = tail.previous
          @tail.next = nil
        else
          node.previous.next = node.next
          node.next.previous = node.previous
        end
      end

      node = node.next
    end

    deleted_node
  end

  def shift
    return if head.nil?

    if head == tail
      deleted_node = head
      init_insertion nil
      return deleted_node
    end

    deleted_node = head
    @head = head.next
    @head.previous = nil

    deleted_node
  end
  alias delete_head shift

  def pop
    return if head.nil?

    if head == tail
      deleted_node = tail
      init_insertion nil
      return deleted_node
    end

    deleted_node = tail
    @tail = tail.previous
    tail.next = nil
    deleted_node
  end
  alias delete_tail pop

  def reverse!
    prev_node = nil
    node = head
    while node
      prev_node = node.previous
      next_node = node.next

      node.previous = next_node
      node.next = prev_node

      prev_node = node
      node = next_node
    end

    @tail = head
    @head = prev_node
  end
end
